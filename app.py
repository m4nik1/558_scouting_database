from flask import Flask, render_template, request, json, redirect, session
from flask.ext.mysql import MySQL
from sqlalchemy import create_engine
import pandas as pd

app = Flask(__name__)
mysql = MySQL()
app.secret_key = 'b\xb9\xeb\xeb_\xa7(\x1e\xaeAB\xac\xfdLV\xd1R2\x0e7p\xe3>s\xa5\x8bt\xef>\x9b\x81'
engine = create_engine('mysql+pymysql://root:soomro12@localhost/558_scouting_testing')
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] ='soomro12'
app.config['MYSQL_DATABASE_DB'] = '558_scouting_testing'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/')
def index():
    if session.get('user'):
        return render_template('SignedHome.html')
    else:
        return render_template('index.html')

@app.route('/showSignup')
def showSignup():
    return render_template('signup.html')

@app.route('/signUp', methods=['GET' ,'POST'])
def signUp():
    try:
        # read the posted values from the UI
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        # validate the received values
        if _name and _email and _password:
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_createUser',(_name,_email,_password))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return redirect('/')
                #return json.dumps({'message':'user successfully created'})
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
@app.route('/signedUp')
def signedUp():
    return render_template('signedupHome.html')

@app.route('/showSignin')
def showSignin():
    return render_template('signin.html')

@app.route('/validateLogin', methods=['POST'])
def validateLogin():
    try:
        _username = request.form['inputEmail']
        _password = request.form['inputPassword']

        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('sp_validateLogin', (_username,))
        data = cursor.fetchall()


        if len(data) > 0:
            if (str(data[0][3]) == _password):
                session['user'] = data[0][0]
                return redirect('/userHome')
                #return json.dumps({'testing': str(data[0])})
            else:
                return render_template('error.html',error='Wrong Email address and Password.')
        else:
            return render_template('error.html',error='Wrong Email address or password.')
    except Exception as e:
        return render_template('error.html', error=str(e))

@app.route('/userHome')
def userHome():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('error.html', error = 'Unauthorized Access')
@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect('/')
@app.route('/showEnterData')
def showEnterData():
    if session.get('user'):
        return render_template('scoutingData.html')
    else:
        return render_template('error.html', error = 'Unauthorized Access Please Sign in or log in')
@app.route('/addData', methods=['POST'])
def addData():
    try:
        selectGearIntake = request.form.get('SelectGearIntake')
        selectGearPlace = request.form.get('selectGearPlace')
        selectClimb = request.form.get('selectClimb')
        selectDriveTrain = request.form.get('selectDriveTrain')
        Match = request.form.get('inputMatch')
        Team = request.form.get('inputTeam')
        GearsPlace = request.form.get('txtGears')
        Kpa = request.form.get('inputKpa')
        Comments = request.form.get('inputComments')
        if selectGearIntake and selectGearPlace and selectClimb and selectDriveTrain and Match and Team and GearsPlace and Kpa:
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_addData',(Match, Team, selectGearIntake, selectGearPlace, GearsPlace, Kpa, selectDriveTrain, selectClimb, Comments))
            data = cursor.fetchall()
            if len(data) is 0:
                conn.commit()
                return json.dumps({'message':'Data successfully entered'})
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'Error':'Please enter the required fields'})
    except Exception as e:
        return render_template('error.html', error=str(e))
@app.route('/showInfo')
def info():
    connection = engine.connect()
    data = pd.read_sql_table('tbl_data', connection)
    return render_template('info.html', tables=[data.to_html(classes="table table-striped")], titles=['testing'])

if(__name__ == "__main__"):
    app.run(host='0.0.0.0', debug=True)

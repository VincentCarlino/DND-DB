from __future__ import print_function
from flask import Flask, render_template, json, request, redirect, url_for, session
from flask.ext.mysql import MySQL
import getpass
import sys

mysql = MySQL()
username = raw_input('Username: ')
pw = getpass.getpass('Password:')

app = Flask(__name__)
app.secret_key = 'secret key'

app.config['MYSQL_DATABASE_USER'] = username
app.config['MYSQL_DATABASE_PASSWORD'] = pw
app.config['MYSQL_DATABASE_DB'] = 'dnd'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)


@app.route("/")
def main():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('index.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

@app.route('/successSignUp')
def successSignUp():
    return render_template('successsignup.html')

@app.route('/logout')
def logout():
    session.pop('user',None)
    return redirect('/')

@app.route('/showSignin')
def showSignin():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('signin.html')

@app.route('/showCreate')
def showCreate():
    if session.get('user'):
        return render_template('createItem.html')
    else:
        return render_template('signin.html')

@app.route('/showAddRace')
def showAddRace():
    if session.get('user'):
        return render_template('addRace.html')
    else:
        return render_template('signin.html')

@app.route('/showAddClass')
def showAddClass():
    if session.get('user'):
        return render_template('addClass.html')
    else:
        return render_template('signin.html')

@app.route('/addRace',methods=['POST'])
def addRace():
    try:
        if session.get('user'):
            _name = request.form['inputName']
            _description = request.form['inputDescription']
            _abilities = request.form['inputAbilities']
            _user = session.get('user')
 
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('addRace',(_name,_description,_abilities,_user))
            data = cursor.fetchall()
 
            if len(data) is 0:
                conn.commit()
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'An error occurred!')
 
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()

@app.route('/addClass',methods=['POST'])
def addClass():
    try:
        if session.get('user'):
            _name = request.form['inputName']
            _description = request.form['inputDescription']
            _1st = request.form['input1st']
            _2nd = request.form['input2nd']
            _3rd = request.form['input3rd']
            _4th = request.form['input4th']
            _5th = request.form['input5th']
            _6th = request.form['input6th']
            _7th = request.form['input7th']
            _8th = request.form['input8th']
            _9th = request.form['input9th']
            _10th = request.form['input10th']
            _11th = request.form['input11th']
            _12th = request.form['input12th']
            _13th = request.form['input13th']
            _14th = request.form['input14th']
            _15th = request.form['input15th']
            _16th = request.form['input16th']
            _17th = request.form['input17th']
            _18th = request.form['input18th']
            _19th = request.form['input19th']
            _20th = request.form['input20th']
            _user = session.get('user')
 
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('addClass',(_name,_description,_user,_1st,_2nd,_3rd,_4th,_5th,_6th,_7th,_8th,_9th,_10th,_11th,_12th,_13th,_14th,_15th,_16th,_17th,_18th,_19th,_20th))
            data = cursor.fetchall()
 
            if len(data) is 0:
                conn.commit()
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'An error occurred!')
 
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()

@app.route('/getClasses')
def getClasses():
    try:
        if session.get('user'):
            _user = session.get('user')

            con = mysql.connect()
            cursor = con.cursor()
            cursor.callproc('getClasses',(_user,))
            classes = cursor.fetchall()

            classes_json = []
            for c in classes:
                class_json = {
                    'Name': c[0],
                    'Description': c[1]}
                classes_json.append(c)

            return json.dumps(classes_json)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html', error = str(e))

@app.route('/getRaces')
def getRaces():
    try:
        if session.get('user'):
            _user = session.get('user')

            con = mysql.connect()
            cursor = con.cursor()
            cursor.callproc('getRaces',(_user,))
            races = cursor.fetchall()

            races_json = []
            for r in races:
                race_json = {
                    'Name': r[0],
                    'Description': r[1]}
                races_json.append(r)

            return json.dumps(races_json)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html', error = str(e))

@app.route('/showRaces')
def showRaces():
    if session.get('user'):
        return render_template('showRaces.html')
    else:
        return render_template('signin.html')

@app.route('/showClasses')
def showClasses():
    if session.get('user'):
        return render_template('showClasses.html')
    else:
        return render_template('signin.html')

@app.route('/userHome')
def userHome():
    
    if session.get('user'):
        print(session.get('user'), file=sys.stderr)
        return render_template('userHome.html')
    else:
        return render_template('error.html',error = 'Unauthorized Access')

@app.route('/signUp', methods=['POST', 'GET'])
def signUp():
    try:
        # read the posted values from the UI
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']
    

        # validate the received values
        if _name and _email and _password:
            connection = mysql.connect()
            cursor = connection.cursor()
            cursor.callproc('createUser',(_name,_email,_password))
            data = cursor.fetchall()
            if len(data) is 0:
                connection.commit()
                return url_for('successSignUp')
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})
    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        cursor.close()
        connection.close()

@app.route('/validateLogin',methods=['POST', 'GET'])
def validateLogin():
    try:
        _username = request.form['inputName']
        _password = request.form['inputPassword']
        # connect to mysql
        connection = mysql.connect()
        cursor = connection.cursor()
        cursor.callproc('validateLogin',[_username,])
        data = cursor.fetchall()

        if len(data) > 0:
            if data[0][3] == _password:
                session['user'] = data[0][0]
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'Wrong Email address or Password.')
        else:
            return render_template('error.html',error = 'Wrong Email address or Password.')
 
 
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        connection.close()

if __name__ == "__main__":
    app.run()
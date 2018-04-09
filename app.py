from flask import Flask, render_template, json, request, redirect, url_for, session
from flask.ext.mysql import MySQL
import getpass

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

@app.route('/userHome')
def userHome():
    print(session.get('user'))
    if session.get('user'):
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
# D&D Tracking Web App

## Step 1: Prerequisites
[Python 2.7.13](https://www.python.org/downloads/)

## Step 2: Required Python Modules
[flask](http://flask.pocoo.org/): `pip install flask`

[pymysql](https://github.com/PyMySQL/PyMySQL): `pip install pymysql`

flask-mysql: `pip install flask-mysql`

mysql-connector: `pip install mysql-connector`

## Step 3: Import Database
In MySQL Workbench: 
```
Server > Data Import
```
Set the target schema to a new database 'dnd'

Set the target dump file to `dndDump.sql`

Note: Database dump file contains stored procedures as well as the create schema and data.

## Step 5: Running the project
run

```
python app.py
```
Enter your MySQL username and password, and go to `localhost:5000` in your browser (Chrome is preferred).

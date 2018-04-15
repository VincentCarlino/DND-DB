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

## Step 4: Running the project
run

```
python app.py
```
Enter your MySQL username and password, and go to `localhost:5000` in your browser (Chrome is preferred).

## Step 5: Using the web app

Either sign in as one of the users in the database or sign up with a new account.

The web app currently supports creating new races, classes, and characters using classes and races available to the user (all races and classes made by that user as well as all admin races and classes)

Once an entity is created, a user can choose to delete it using the 'x' button on that entity.  Characters can be leveled up or down using the plus and minus buttons on that character.

import flask
import mysql.connector
import getpass

# 1. Prompt user to login
username = raw_input('Username: ')
pw = getpass.getpass('Password:')

# 2. Use username and password to connect to database
cnx = mysql.connector.connect(user=username, password=pw, host='localhost', database='dnddb', port=3306)

def createCharacter(name, age, stre, dex, con, wis, inte, cha, race):
    cur = cnx.cursor()
    add_character = ("INSERT INTO player_character "
                    "(character_name, character_age, strength, dexterity, constitution, wisdom, intelligence, charisma, character_race)"
                    "VALUES (%s, %d, %d, %d, %d, %d, %d, %d, %s)")
    data_character = (name, age, stre, dex, con, wis, inte, char, race)
    cur.execute(add_character, data_character)
    cur.close()

def createClass(name, desc, levels):
    cur = cnx.cursor()
    add_class =  ("INSERT INTO class "
                    "(class_name, class_desc)"
                    "VALUES (%s, %s)")
    data_class = (name, desc)
    cur.execute(add_class, data_class)
    index = 0
    for level in levels:
        createClassLevel(name, index, level)
        index += 1
    cur.close()

def createClassLevel(name, level, abilities):
    cur = cnx.cursor()
    add_level =  ("INSERT INTO class_level "
                    "(class_name, class_level, class_abilities)"
                    "VALUES (%s, %d, %s)")
    data_level = (name, level, desc)
    cur.execute(add_class, data_level)
    cur.close()

def createRace(name, desc, abilities):
    cur = cnx.cursor()
    add_race = ("INSERT INTO race "
                    "(race_name, race_desc, race_abilities)"
                    "VALUES (%s, %s, %s)")
    data_race = (name, desc, abilities)
    cur.excute(add_race, data_race)
    cur.close()

cnx.close


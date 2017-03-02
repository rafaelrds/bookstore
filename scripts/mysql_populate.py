from __future__ import print_function
from datetime import date, datetime, timedelta
import mysql.connector

cnx = mysql.connector.connect(user='root', database='bookstore', password='defaultpassword')
cursor = cnx.cursor()

import string, random

flag = 1000
while (flag):
	genre_name = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(10))

	add_genre = ("INSERT INTO genre "
              "(name) "
              "VALUES (%(name)s)")
	data_genre = {
	  'name': genre_name
	}
	cursor.execute(add_genre, data_genre)
	flag -= 1
	

# Insert new employee

# Make sure data is committed to the database
cnx.commit()

cursor.close()
cnx.close()

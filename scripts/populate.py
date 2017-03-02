# mongo_hello_world.py
# Author: Bruce Elgort
# Date: March 18, 2014
# Purpose: To demonstrate how to use Python to
# 1) Connect to a MongoDB document collection
# 2) Insert a document
# 3) Display all of the documents in a collection</code>
 
from pymongo import MongoClient
 
# connect to the MongoDB on MongoLab
# to learn more about MongoLab visit http://www.mongolab.com
# replace the "" in the line below with your MongoLab connection string
# you can also use a local MongoDB instance
connection = MongoClient("mongodb://localhost/bookstore")

# connect to the students database and the ctec121 collection
db = connection.bookstore.genres

# Drop everything
result = db.delete_many({})
print result.deleted_count

# create a dictionary to hold student documents
 
# # create dictionary
genre_record = {}
 
# insert 10,000
flag = 10000

import sys

 
import random, string
# # loop for data input
while (flag):
   # place values in dictionary
   random_genre = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(10))
   genre_record = {'name':random_genre}
   # insert the record
   db.insert(genre_record)
   # should we continue?
   flag-=1
   if flag % 100 == 0:
      sys.stdout.write('. ')
 
# find all documents
results = db.find()


print('FIM')
 
 
# close the connection to MongoDB
connection.close()
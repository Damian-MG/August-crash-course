'''
In this assignment you will write a Python program somewhat similar to http://www.pythonlearn.com/code/json2.py. The program will prompt for a URL, read the JSON data from that URL using urllib and then parse and extract the comment counts from the JSON data, compute the sum of the numbers in the file and enter the sum below:
We provide two files for this assignment. One is a sample file where we give you the sum for your testing and the other is the actual data you need to process for the assignment.
Sample data: http://python-data.dr-chuck.net/comments_42.json (Sum=2553)
Actual data: http://python-data.dr-chuck.net/comments_353540.json (Sum ends with 71)
You do not need to save these files to your folder since your program will read the data directly from the URL. Note: Each student will have a distinct data url for the assignment - so only use your own data url for analysis.
'''

import urllib.request, urllib.parse, urllib.error
import json
import ssl

#Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

count = 0
sum = 0

address = input('Enter location: ')
if len(address) < 1 : address = 'http://python-data.dr-chuck.net/comments_42.json'

print('Retrieving ' + address)
data = urllib.request.urlopen(address, context=ctx).read()

info = json.loads(data)

for item in info["comments"]:
	count += 1
	sum += item["count"]

print('Count: ', count)
print('Sum: ', sum)

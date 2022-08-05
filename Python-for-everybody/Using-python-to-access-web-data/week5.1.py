'''
In this assignment you will write a Python program somewhat similar to http://www.pythonlearn.com/code/geoxml.py. The program will prompt for a URL, read the XML data from that URL using urllib and then parse and extract the comment counts from the XML data, compute the sum of the numbers in the file.
We provide two files for this assignment. One is a sample file where we give you the sum for your testing and the other is the actual data you need to process for the assignment.
Sample data: http://python-data.dr-chuck.net/comments_42.xml (Sum=2553)
Actual data: http://python-data.dr-chuck.net/comments_353536.xml (Sum ends with 90)
You do not need to save these files to your folder since your program will read the data directly from the URL. Note: Each student will have a distinct data url for the assignment - so only use your own data url for analysis.
'''

import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET
import ssl

#Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

count = 0
sum = 0


address = input('Enter location: ')
if len(address) < 1 : address = 'http://python-data.dr-chuck.net/comments_42.xml'

print('Retrieving ' + address)
data = urllib.request.urlopen(address, context=ctx).read()

tree = ET.fromstring(data)
lst = tree.findall('.//count')

for item in lst:
    count += 1
    sum += int(item.text)

print('Count: ', count)
print('Sum: ', sum)

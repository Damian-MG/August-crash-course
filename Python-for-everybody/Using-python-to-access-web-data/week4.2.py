'''
Following Links in Python
In this assignment you will write a Python program that expands on http://www.pythonlearn.com/code/urllinks.py. The program will use urllib to read the HTML from the data files below, extract the href= vaues from the anchor tags, scan for a tag that is in a particular position relative to the first name in the list, follow that link and repeat the process a number of times and report the last name you find.
We provide two files for this assignment. One is a sample file where we give you the name for your testing and the other is the actual data you need to process for the assignment
Sample problem: Start at http://python-data.dr-chuck.net/known_by_Fikret.html 
Find the link at position 3 (the first name is 1). Follow that link. Repeat this process 4 times. The answer is the last name that you retrieve.
Sequence of names: Fikret Montgomery Mhairade Butchi Anayah 
Last name in sequence: Anayah
Actual problem: Start at: http://python-data.dr-chuck.net/known_by_Blanka.html 
Find the link at position 18 (the first name is 1). Follow that link. Repeat this process 7 times. The answer is the last name that you retrieve.
Hint: The first character of the name of the last page that you will load is: L
'''

import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup
import ssl

#Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

#Set an input function for the url address and parse it through BeautifulSoup
url = input('Enter URL : ')
if len(url) < 1 : url = 'http://python-data.dr-chuck.net/known_by_Fikret.html'
html = urllib.request.urlopen(url, context = ctx).read()
soup = BeautifulSoup(html, 'html.parser')

#Set up an input functions for the repeat
countinp = input('Enter count : ')
count = int(countinp)
if count < 1 : count = 4

#Set up an input function for the position
positioninp = input('Enter position : ')
position = int(positioninp)
if position < 1 : position = 3 

#Initialize currcount to 0
currcount = 0

#Repeat the loop for the required amount of repeats
while currcount < count :

	# Retrieve the url for the required position and print it
	tags = soup('a')
	for tag in tags:
	    tag = tags[position - 1].get('href', None)
	print("Retrieving : " + tag)

        	#Update url and parse it through BeautifulSoup
	url = tag
	html = urllib.request.urlopen(url, context = ctx).read()
	soup = BeautifulSoup(html, 'html.parser')

	#Update currcount by 1 each step
	currcount = currcount + 1

'''
Scraping Numbers from HTML using BeautifulSoup
In this assignment you will write a Python program
similar to http://www.pythonlearn.com/code/urllink2.py.
The program will use urllib to read the HTML from the data files below,
and parse the data, extracting numbers and compute the
sum of the numbers in the file.
We provide two files for this assignment.
One is a sample file where we give you the sum for your testing and
the other is the actual data you need to process for the assignment.
Sample data: http://python-data.dr-chuck.net/comments_42.html (Sum=2553)
Actual data: http://python-data.dr-chuck.net/comments_353539.html (Sum ends with 63)
You do not need to save these files to your folder since your program
will read the data directly from the URL. Note: Each student will have a
distinct data url for the assignment - so only use your own data url for analysis.
'''

import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup
import ssl

#Initialize totalsum and count values to 0
totalsum = 0
count = 0

#Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

#Set an input function for the url address and parse it through BeautifulSoup
url = input('Enter - ')
if len(url) < 1 : url = 'http://python-data.dr-chuck.net/comments_42.html'
html = urllib.request.urlopen(url, context = ctx).read()
soup = BeautifulSoup(html, 'html.parser')
print(soup)

#Convert the values in that class into text and append it to the numlist
commentsclass = soup.select('span[class="comments"]')
print(commentsclass)
numlist = list()
for comment in commentsclass:
	numlist.append(comment.get_text())
print(numlist)

if len(numlist) > 0:
	for num in numlist:
		totalsum = totalsum + int(num)
		count = count + 1
#Print out the final values
print("Count :",count)
print("Total Sum :", totalsum)


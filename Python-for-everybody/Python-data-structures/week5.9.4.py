'''
9.4 Write a program to read through the mbox-short.txt and figure out who has
the sent the greatest number of mail messages. The program looks for 'From '
lines and takes the second word of those lines as the person who sent the mail.
The program creates a Python dictionary that maps the sender's mail address to
a count of the number of times they appear in the file. After the dictionary is
produced, the program reads through the dictionary using a maximum loop
to find the most prolific committer.
'''

file_name = input("Enter file name:")
if len(file_name) < 1: file_name = 'mbox-short.txt'
file_handler = open(file_name)

count = dict()
for line in file_handler:
    if not line.startswith('From'): continue
    line = line.split()
    email = line[1]
    count[email] = count.get(email,0) + 1

bigcount = 0
bigword = 0
for key, value in count.items():
    if bigcount == None or value > bigcount:
        bigword = key
        bigcount = value

print(bigword, bigcount)

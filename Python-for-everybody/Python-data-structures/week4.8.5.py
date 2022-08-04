'''
8.5 Open the file mbox-short.txt and read it line by line. When you find a line
that starts with 'From ' like the following line:
From stephen.marquard@uct.ac.za Sat Jan  5 09:14:16 2008
You will parse the From line using split() and print out the second word in the
line (i.e. the entire address of the person who sent the message). Then print
out a count at the end.
Hint: make sure not to include the lines that start with 'From:'.
You can download the sample data at http://www.pythonlearn.com/code/mbox-short.txt
'''

file_name = input("Enter file name:")
if len(file_name) < 1 : file_name = "mbox-short.txt"

file_handler = open(file_name)
count = 0

for line in file_handler:
    if not line.startswith('From'): continue
    line = line.split()
    print(line[1])
    count += 1

print("There is,", count,"e-mails")

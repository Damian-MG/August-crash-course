'''
10.2 Write a program to read through the mbox-short.txt and figure out
the distribution by hour of the day for each of the messages.
You can pull the hour out from the 'From ' line by finding the time and then
splitting the string a second time using a colon.
From stephen.marquard@uct.ac.za Sat Jan  5 09:14:16 2008
Once you have accumulated the counts for each hour, print out the counts,
sorted by hour as shown below.
'''

file_name = input("Enter file name:")
if len(file_name) < 1 : file_name = 'mbox-short.txt'
file_handler = open(file_name)

hours = list()
hours_dict = dict()

for line in file_handler:
    if line.startswith('From '):
        i = line.find(':')
        hours.append(line[i-2:i])

for hour in hours:
    hours_dict[hour] = hours_dict.get(hour,0) + 1

tuples = list()
for key, value in hours_dict.items():
    newtup = (key,value)
    tuples.append(newtup)

for key, value in tuples:
    print(key, value)


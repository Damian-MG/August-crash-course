'''
8.4 Open the file romeo.txt and read it line by line. For each line, split the
line into a list of words using the split() method. The program should build a
list of words. For each word on each line check to see if the word is already
in the list and if not append it to the list. When the program completes,
sort and print the resulting words in alphabetical order.
You can download the sample data at http://www.pythonlearn.com/code/romeo.txt
'''

file_name = input("Enter file name:")
file_handler = open(file_name)
words = list()
count = 0

for line in file_handler:
    for word in line.split():
        if word not in words:
            words.append(word)

words.sort()
print(words)

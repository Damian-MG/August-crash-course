# Write a program to read through a file and print the contents of the file (line by line)
# all in upper case

file_handler = open('mbox-short.txt')
for line in file_handler:
    line = line.rstrip()
    print(line.upper())

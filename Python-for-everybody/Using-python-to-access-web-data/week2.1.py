'''
In this assignment you will read through and parse a file with text and numbers.
You will extractall the numbers in the file and compute the sum of the numbers.
'''

import re

file_name = input("Enter file name:")
if len(file_name) < 1 : file_name = 'numbers.txt'
file_handler = open(file_name)

number_sum = 0

for line in file_handler:
    numbers = re.findall('[0-9]+',line)
    if len(numbers) > 0:
        for number in numbers:
            number_sum += int(number)

print(number_sum)



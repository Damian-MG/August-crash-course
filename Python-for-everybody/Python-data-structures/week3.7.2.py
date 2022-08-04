# Write a program that reads from input a file name and then prints the lines matching an expression

count = 0
total = 0.0
file_name = input("Enter file name:")
file_handler = open(file_name)

for line in file_handler:
    if not line.startswith('X-DSPAM-Confidence:'): continue
    count += 1
    i = line.find('0')
    x = float(line[i:])
    total += x
avg = total / count

print ("Average spam confidence:",avg)

    

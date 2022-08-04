# Write a program that repeatedly reads numbers until the user enters "done". Once "done",
# is entered, print out the total, count, and average of the numbers. If the user enters
# anything other than a number, detect the mistake with try and except and print an error
# message and skip to the next number

total = 0.0
count = 0

while True:
    value = input("Enter a number:")
    if value == 'done':
        break
    try:
        value = float(value)
    except:
        print("Invalid input")
        continue
    
    count+=1
    total+=value

print(total, count, total/count)

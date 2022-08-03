# Write a program that repeatedly prompts a user for integer numbers until the user enters 'done'.
# Once 'done' is entered, print out the largest and smallest of the numbers.
# If the user enters anything other than a valid number catch it with a try/except and put out an appropriate message
# and ignore the number. Enter 7, 2, bob, 10, and 4 and match the output below.

largest = None
smallest = None

while True:
    number = input("Enter a number:")
    if number == 'done': break
    try:
        number = int(number)
        if largest is None or largest < number : largest = number
        if smallest is None or smallest > number : smallest = number
    except:
        print ("Invalid input")

print("Max is:",largest)
print("Min is:",smallest)

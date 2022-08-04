# Use find and string slicing to extract the portion of the string after the colon character
# and the use the float function to convert the extracted string into a FP number

str = 'X-DSPAM-Confidence: 0.8475'
colon_pos = str.find(':')
piece = str[colon_pos+2:]
value = float(piece)
print(value)

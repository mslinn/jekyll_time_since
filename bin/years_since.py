import datetime
import sys
from dateutil.parser import parse

# pip install python-dateutil

def years_since(datetime):
    today = datetime.date().today()
    years = today.year - datetime.year
    if today.month < datetime.month or (today.month == datetime.month and today.day < datetime.day):
        years -= 1
    return years

if len(sys.argv)==1:
  sys.exit("Error: A date must be provided.")

datetime = parse(sys.argv[1])
result = years_since(datetime)
print(result)

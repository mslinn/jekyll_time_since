import datetime
import sys
from dateutil.parser import parse

from dateutil import rrule
import datetime

def weeks_since(datetime):
    today = datetime.today()
    days = (today - datetime).days
    return int(days / 7)

def months_since(datetime):
    today = datetime.date().today()
    months = (today.month - datetime.month) + 12 * (today.year - datetime.year)
    return months

def years_since(datetime):
    today = datetime.date().today()
    years = today.year - datetime.year
    if today.month < datetime.month or (today.month == datetime.month and today.day < datetime.day):
        years -= 1
    return years

if len(sys.argv)==1 or not sys.argv[1] in ['week', 'month', 'year']:
  sys.exit("Error: 'week', 'month' or 'year' must be provided.")

if len(sys.argv)==2:
  sys.exit("Error: A date must be provided.")

try:
    datetime = parse(sys.argv[2])
except:
  sys.exit(f"Error: '{sys.argv[2]}' is not a valid date")

if sys.argv[1]=='month':
    result = months_since(datetime)
elif sys.argv[1]=='year':
    result = years_since(datetime)
elif sys.argv[1]=='week':
    result = weeks_since(datetime)
else:
  sys.exit("Error: unrecognized time unit.")
print(result)

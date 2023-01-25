import datetime
import sys
from dateutil.parser import parse

# pip install python-dateutil

def years_since(day):
    today = datetime.date.today()
    years = today.year - day.year
    if today.month < day.month or (today.month == day.month and today.day < day.day):
        years -= 1
    return years

date = datetime.date(parse(sys.argv[1]))
result = years_since(date)
print(result)

from django import template
from datetime import datetime

register = template.Library()

@register.filter
def dias(value):
    datenow = datetime.now().date()
    delta = value - datenow
    return delta.days

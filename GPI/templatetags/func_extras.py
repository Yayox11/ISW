from django import template

register = template.Library()

@register.filter
def dias(value,arg):
    delta = arg - value
    return delta.days

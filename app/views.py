# views.py
from django.shortcuts import render
from .models import Person

def display_name(request):
    person = Person.objects.get(id=1)  # You can change the query to retrieve the desired name
    return render(request, 'name_template.html', {'person': person})

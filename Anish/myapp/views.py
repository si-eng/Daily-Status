from unicodedata import name
from django.shortcuts import render
from django.http import HttpResponse


# Create your views here.
def index(request):
    dict = {'name':'Anish','place':'Himachal'}
    return render(request,'myfile.html', dict)

def  home(request):
    return HttpResponse("Welcome")
    
    
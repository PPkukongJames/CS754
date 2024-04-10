from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
def index(req):
    return HttpResponse("Hello world")

def index2(req):
    return HttpResponse("<h1>Hello world</h1>")
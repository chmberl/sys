from django.shortcuts import render,render_to_response
from django.http import HttpResponse
from django.template import loader,Context
# Create your views here.
"""
def index(req):
	t = loader.get_template("myweb.html")
	c = Context({})
	return HttpResponse(t.render(c))
"""
def index(req):
	return render_to_response("myweb.html",{})

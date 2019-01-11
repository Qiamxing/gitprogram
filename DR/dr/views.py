import hashlib
import random
import time
from django.http import HttpResponse
from django.shortcuts import render,redirect

# Create your views here.
from dr.models import User

def make_token():
    token = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))

    return md5.hexdigest()


def generate_password(password):

    sha = hashlib.sha256()

    sha.update(password.encode('utf-8'))

    return sha.hexdigest()


def index(request):
    if request.method == 'GET':
        name =None
        if request.session.get('token'):
            user = User.objects.all().filter(token=request.session.get('token'))
            if user.count():
                name = user.first().phone
        return render(request, 'index.html',{'name':name})


def goodlist(request):
    if request.method == 'GET':
        return render(request,'goodlist.html')


def goodinfo(request):
    return render(request,'goodinfo.html')


def goodsinfo(request):
    return render(request,'goodsinfo.html')


def login(request):
    if request.method == 'GET':
        return render(request,'login.html')

    elif request.method == 'POST':
        user = User.objects.all().filter(phone = request.POST.get('name')).filter(pwd=generate_password(request.POST.get('pwd')))
        if user.count():
            user = user.first()
            token = make_token()
            request.session['token'] = token
            user.token = token
            user.save()
            return redirect('dr:index')


def register(request):
    if request.method == 'GET':

        return render(request,'register.html')

    elif request.method == 'POST':

        user = User()
        user.phone = int(request.POST.get('name'))

        user.pwd = generate_password(request.POST.get('pwd'))
        token = make_token()
        user.token = token
        request.session['token'] = token

        user.save()
        return redirect('dr:index')

def shopcar(request):
    return render(request,'shopcar.html')


def logout(request):
    request.session.flush()

    return redirect('dr:index')
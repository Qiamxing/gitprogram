from django.shortcuts import render

# Create your views here.
def index(request):

    return render(request, 'index.html')


def goodlist(request):

    return render(request,'goodlist.html')


def goodinfo(request):
    return render(request,'goodinfo.html')


def goodsinfo(request):
    return render(request,'goodsinfo.html')


def login(request):
    return render(request,'login.html')


def register(request):
    return render(request,'register.html')


def shopcar(request):
    return render(request,'shopcar.html')
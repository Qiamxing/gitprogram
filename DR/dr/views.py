#coding:utf-8
import hashlib
import random
import time
from django.http import JsonResponse
from django.shortcuts import render,redirect
from django.views.decorators.csrf import csrf_exempt
from urllib.parse import parse_qs

# Create your views here.
from dr.models import User, Goodslist, Cart, Order, OrderGoods
from dr.alipay import alipay

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
        name =None
        if request.session.get('token'):
            user = User.objects.all().filter(token=request.session.get('token'))
            if user.count():
                name = user.first().phone
        goodslist = Goodslist.objects.all()[:10]
        return render(request, 'goodlist.html',{'name':name,'goodslist':goodslist})

def goodinfo(request,goodsid):
    name = None
    if request.method == 'GET':
        if request.session.get('token'):
            user = User.objects.all().filter(token=request.session.get('token'))
            if user.count():
                name = user.first().phone
    goodsid = int(goodsid)
    goods = Goodslist.objects.get(pk=goodsid)

    return render(request, 'goodinfo.html',{'name':name,'goods':goods})

def goodsinfo(request):
    if request.method == 'GET':
        name =None
        if request.session.get('token'):
            user = User.objects.all().filter(token=request.session.get('token'))
            if user.count():
                name = user.first().phone
        return render(request, 'goodsinfo.html',{'name':name})

def login(request):
    if request.method == 'GET':
        return render(request,'login.html')

    elif request.method == 'POST':
        print(request.POST)
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
    name = None
    cartlist = None

    if request.method == 'GET':

        if request.session.get('token'):

            user = User.objects.get(token=request.session.get('token'))

            if user:
                name = user.phone
                cartlist = Cart.objects.filter(user=user).exclude(num=0)

                if request.GET.get("goodsid"):
                    goodsid = int(request.GET.get("goodsid"))
                    goods = Goodslist.objects.get(pk=goodsid)
                    cart = Cart.objects.filter(user=user).filter(goods=goods)
                    if cart.count():
                        cart = cart.first()
                        cart.num = cart.num + 1
                        cart.save()
                    else :
                        cart = Cart()
                        cart.user = user
                        cart.goods = goods
                        cart.num = 1
                        cart.save()
                    return JsonResponse({'msg':"sucess"})





    return render(request,'shopcar.html',{'name':name,'cartlist':cartlist})


def logout(request):
    request.session.flush()

    return redirect('dr:index')


def test(request):
    return render(request,'test.html')


def addcart(request):
    cid = request.GET.get('cid')
    if cid:
        cart = Cart.objects.get(pk=cid)
        cart.num+=1
        cart.save()

    return JsonResponse({'msg':"sucess",'status':1,'num':cart.num})

def rmcart(request):
    cid = request.GET.get('cid')
    if cid:
        cart = Cart.objects.get(pk=cid)
        cart.num-=1
        cart.save()

    return JsonResponse({'msg':"sucess",'status':1,'num':cart.num})


def removecart(request):
    cid = request.GET.get('cid')
    if cid:
        cart = Cart.objects.get(pk=cid)
        cart.num =0
        cart.save()

    return JsonResponse({'msg': "sucess", 'status': 1, 'num': cart.num})


def change(request):
    cid = request.GET.get('cid')
    print(cid)
    if cid :
        cart = Cart.objects.get(pk=int(cid))
        checked = request.GET.get('checked')
        if checked == 'true':
            cart.goods.isselect = True
        else:
            cart.goods.isselect = False
        cart.goods.save()

    return JsonResponse({"msg":1})




def makeorder(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    order = Order()
    order.user = user
    order.orderid = int(time.time())
    order.save()

    carts = Cart.objects.filter(user=user).filter(isselect=True).exclude(num=0)
    for cart in carts:
        ordergoods = OrderGoods()
        ordergoods.order = order
        ordergoods.goods = cart.goods
        ordergoods.number = cart.num
        ordergoods.save()
        cart.delete()

    return render(request,'makeorder.html',{'order':order})



def appnotify(request):

    return JsonResponse({'msg':'sucess'})

@csrf_exempt
def returnview(request):

    if request.method == 'POST':
        body_str = request.body.decode('utf-8')
        post_data = parse_qs(body_str)
        post_dir = {}

        for key,value in post_data.items():
            post_dir[key] = value[0]

        out_trade_no = post_dir['out_trade_no']

        Order.objects.filter(orderid=out_trade_no).update(status=1)


    return redirect('dr:shopcar')


def pay(request):
    orderid = request.GET.get('orderid')
    order = Order.objects.get(orderid=orderid)

    sum = 0
    for ordergoods in order.ordergoods_set.all():
        sum += int(ordergoods.goods.price) * int(ordergoods.number)

    data = alipay.direct_pay(
        subject='ring',
        out_trade_no=orderid,
        total_amount=str(sum),
        return_url='http://39.105.127.218/returnview/'

    )
    alipayurl = 'https://openapi.a lipaydev.com/gateway.do?{data}'.format(data=data)

    return JsonResponse({'alipayurl':alipayurl})
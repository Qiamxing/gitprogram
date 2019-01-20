from django.db import models

class User(models.Model):
    phone = models.CharField(max_length=11)
    pwd = models.CharField(max_length=255)
    token = models.CharField(max_length=255)

class Goods(models.Model):
    name = models.CharField(max_length=100)
    price = models.IntegerField()
    num = models.IntegerField()
    user = models.ManyToManyField(User)

class Allimg(models.Model):

    name = models.CharField(max_length=100)
    adress = models.CharField(max_length=255)
    goods = models.ForeignKey(Goods,on_delete=None,null=True)

class Goodslist(models.Model):
    name = models.CharField(max_length=20)
    price = models.CharField(max_length=10)
    src = models.CharField(max_length=100)
    discript = models.CharField(max_length=100)
    sale = models.IntegerField(default=0)
    com = models.IntegerField(default=0)
    material1 = models.CharField(max_length=10)
    material2 = models.CharField(max_length=10)
    price1 = models.IntegerField(default=0)
    price2 = models.IntegerField(default=0)
    isselect = models.BooleanField(default=True)

class Goodsimg(models.Model):
    src = models.CharField(max_length=100)
    goods = models.ForeignKey(Goodslist)

class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goodslist)
    num = models.IntegerField()
    isselect = models.BooleanField(default=True)

class Order(models.Model):
    user = models.ForeignKey(User)
    status = models.IntegerField(default=0)
    createtime = models.DateTimeField(auto_now_add=True)
    orderid = models.CharField(max_length=256)

class OrderGoods(models.Model):

    order = models.ForeignKey(Order)
    goods = models.ForeignKey(Goodslist)

    number = models.IntegerField()
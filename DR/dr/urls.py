#coding:utf-8
from django.conf.urls import url

from dr import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^goodlist/$',views.goodlist,name='goodlist'),
    url(r'^goodinfo/(\d+)$',views.goodinfo,name='goodinfo'),
    url(r'^goodsinfo/$',views.goodsinfo,name='goodsinfo'),
    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^register/$',views.register,name='register'),
    url(r'^shopcar/$',views.shopcar,name='shopcar'),
    url(r'^test/$',views.test,name='test'),
    url(r'^addcart/$',views.addcart,name='addcart'),
    url(r'^rmcart/$',views.rmcart,name='rmcart'),
    url(r'^removecart/$',views.removecart,name='removecart'),
    url(r'^change/$',views.change,name='change'),
    url(r'^makeorder/$',views.makeorder,name='makeorder'),
    url(r'^appnotify/',views.appnotify,name='appnotify'),
    url(r'^returnview/$',views.returnview,name='returnview'),
    url(r'^pay/$',views.pay,name='pay')
]
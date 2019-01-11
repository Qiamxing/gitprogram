from django.conf.urls import url

from dr import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^goodlist/$',views.goodlist,name='goodlist'),
    url(r'^goodinfo/$',views.goodinfo,name='goodinfo'),
    url(r'^goodsinfo/$',views.goodsinfo,name='goodsinfo'),
    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^register/$',views.register,name='register'),
    url(r'^shopcar/$',views.shopcar,name='shopcar'),
]
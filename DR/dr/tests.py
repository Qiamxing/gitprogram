import random
import json
from django.test import TestCase

import os
import dr.models

def a():
    with open('static/json/goodlist.json','r') as f :
        jsondict = json.load(f)
        for i in jsondict :
            for j in i :
                goods = dr.models.Goodslist()
                goods.name = j['title']
                goods.price = j['price']
                goods.price1 = int(j['price1'])
                goods.price2 = int(j['price2'])
                goods.material2 = j['material2']

                goods.com = int(j['com'])
                goods.src = j['src']
                goods.index = j['index']
                goods.discript = j['discript']
                goods.material1 = j['material1']
                goods.sale = int(j['sale'])
                goods.save()
                if j.get('img') :
                    for k in j['img']:
                        img = dr.models.Goodsimg()
                        img.src = k['src']
                        img.goods = goods
                        img.save()




"""
{'material2': '白18K金', 
 'img': [{'src': 'images/2016060812454522d7889f26.jpg'},
         {'src': 'images/201509301425347b86245a0e.jpg'}, 
         {'src': 'images/201603301519256b9cccee8f.jpg'},
         {'src': 'images/20160620101350d2f9fcb5a8.jpg'}],
 'id': '1', 
 'price': '9999',
 'com': '756',
 'price2': '10008',
 'src': 'images/2016060812454522d7889f26.jpg',
 'price1': '9898',
 'index': '1',
 'discript': 'TRUE LOVE系列 典雅 40分 F色',
 'title': '黑骑士',
 'material1': 'PT950',
 'sale': '1341'}
"""



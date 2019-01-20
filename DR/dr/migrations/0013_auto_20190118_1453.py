# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-18 14:53
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dr', '0012_auto_20190116_0857'),
    ]

    operations = [
        migrations.AddField(
            model_name='goodslist',
            name='isselect',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='allimg',
            name='goods',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='dr.Goods'),
        ),
    ]
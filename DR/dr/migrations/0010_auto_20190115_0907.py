# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-15 09:07
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dr', '0009_auto_20190114_0913'),
    ]

    operations = [
        migrations.CreateModel(
            name='Goodsimg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('src', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Goodslist',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('price', models.CharField(max_length=10)),
                ('src', models.CharField(max_length=100)),
                ('discript', models.CharField(max_length=100)),
                ('sale', models.IntegerField(default=0)),
                ('com', models.IntegerField(default=0)),
                ('material1', models.CharField(max_length=10)),
                ('material2', models.CharField(max_length=10)),
                ('price1', models.IntegerField(default=0)),
                ('price2', models.IntegerField(default=0)),
            ],
        ),
        migrations.AlterField(
            model_name='allimg',
            name='goods',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='dr.Goods'),
        ),
        migrations.AddField(
            model_name='goodsimg',
            name='goods',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='dr.Goodslist'),
        ),
    ]

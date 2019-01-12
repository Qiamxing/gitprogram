from django.db import models

class User(models.Model):
    phone = models.CharField(max_length=11)
    pwd = models.CharField(max_length=255)
    token = models.CharField(max_length=255)

class imgbase(models.Model):
    name = models.CharField(max_length=100)
    adrss = models.CharField(max_length=255)

    class Meta:
        abstract = True

class lunbotu(imgbase):
     class Meta:

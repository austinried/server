# Generated by Django 3.0.3 on 2020-04-16 08:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('django_etesync', '0038_remove_collectionitemrevision_chunks'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='collection',
            name='mainItem',
        ),
    ]
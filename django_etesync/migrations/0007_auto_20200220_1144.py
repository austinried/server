# Generated by Django 3.0.3 on 2020-02-20 11:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('django_etesync', '0006_auto_20200220_1137'),
    ]

    operations = [
        migrations.AddField(
            model_name='collectionitemchunk',
            name='item',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='chunks', to='django_etesync.CollectionItem'),
            preserve_default=False,
        ),
        migrations.AlterUniqueTogether(
            name='collectionitemchunk',
            unique_together={('item', 'order')},
        ),
        migrations.RemoveField(
            model_name='collectionitemchunk',
            name='collection',
        ),
    ]

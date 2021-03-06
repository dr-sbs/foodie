# Generated by Django 4.0.2 on 2022-03-01 11:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0004_alter_restaurant_logo'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='address',
            field=models.CharField(blank=True, max_length=250),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='latitude',
            field=models.FloatField(blank=True, default=77.88888),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='restaurant',
            name='longitude',
            field=models.FloatField(blank=True, default=22.77777),
            preserve_default=False,
        ),
    ]

# Generated by Django 4.0.2 on 2022-03-24 14:21

from django.db import migrations, models
import django_better_admin_arrayfield.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0006_remove_restaurant_address_remove_restaurant_latitude_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='location',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.CharField(blank=True, max_length=500), size=3),
        ),
    ]

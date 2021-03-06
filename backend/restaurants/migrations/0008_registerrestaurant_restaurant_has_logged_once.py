# Generated by Django 4.0.2 on 2022-03-30 15:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0007_alter_restaurant_location'),
    ]

    operations = [
        migrations.CreateModel(
            name='RegisterRestaurant',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'verbose_name_plural': 'Register Restaurants',
            },
        ),
        migrations.AddField(
            model_name='restaurant',
            name='has_logged_once',
            field=models.BooleanField(default=False),
        ),
    ]

# Generated by Django 4.0.2 on 2022-05-05 11:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('reviews', '0002_alter_review_customer'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='review',
            name='sentiment_score',
        ),
    ]

# Generated by Django 4.0.2 on 2022-03-24 14:19

from django.db import migrations, models
import django_better_admin_arrayfield.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0005_alter_order_delivery_location'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='delivery_location',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.CharField(blank=True, max_length=500), size=3),
        ),
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('Placed', 'Placed'), ('Verified', 'Verified'), ('Processing', 'Processing'), ('Picking', 'Picking'), ('On the way', 'On the way'), ('Delivered', 'Delivered'), ('Cancelled', 'Cancelled')], default='Placed', max_length=20),
        ),
    ]

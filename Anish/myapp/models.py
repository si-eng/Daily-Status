from django.db import models

# Create your models here.
class Employee(models.Model):
    emp_id = models.AutoField
    emp_name = models.CharField(max_length=20)
    emp_contact = models.IntegerField(blank=True)
    emp_date = models.DateField()



    def __str__(self):
        return self.emp_name
        

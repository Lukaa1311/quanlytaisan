from django.db import models

# Create your models here.
from django.db import models

# Model User
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=255)
    email = models.EmailField(max_length=100)
    role = models.CharField(max_length=100)

    def __str__(self):
        return self.username

# Model Assets
class Assets(models.Model):
    assets_name = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    value = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=50)
    description = models.TextField()
    purchase_date = models.DateField()

    def __str__(self):
        return self.assets_name

# Model MaintenanceHistory
class MaintenanceHistory(models.Model):
    assets = models.ForeignKey(Assets, on_delete=models.CASCADE)
    maintenance_date = models.DateField()
    description = models.TextField()
    cost = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=50)

    class Meta:
        unique_together = ('assets', 'maintenance_date')

    def __str__(self):
        return f"Maintenance for {self.assets.assets_name} on {self.maintenance_date}"

# Model AssetsReport
class AssetsReport(models.Model):
    assets = models.ForeignKey(Assets, on_delete=models.CASCADE)
    report_date = models.DateField()
    report_type = models.CharField(max_length=100)
    content = models.TextField()

    class Meta:
        unique_together = ('assets', 'report_date')

    def __str__(self):
        return f"Report for {self.assets.assets_name} on {self.report_date}"

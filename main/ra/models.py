from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone

from .managers import UserBookmarkQuerySet


class Department (models.Model):
	abbv = models.CharField(max_length=50, null = False, blank= False, default='')
	name = models.CharField(max_length=200, null = False, blank= False)
	class Meta:
		db_table = "Department"

class User (AbstractUser):
	student_id = models.CharField(max_length=50, null = False, blank= False, unique=True, default='')
	department= models.ForeignKey(Department, null = False, blank = False, on_delete = models.CASCADE)

	REQUIRED_FIELDS = ['first_name', 'last_name','department','password']
	class Meta:
		db_table = "User"


class Admin (models.Model):
	user = models.ForeignKey(User, null = False, blank = False, on_delete = models.CASCADE)
	department= models.ForeignKey(Department, null = False, blank = False, on_delete = models.CASCADE)
	class Meta:
		db_table = "Admin"


class Folder(models.Model):
	name = models.CharField(max_length=25)
	user = models.ForeignKey(User, null = False, blank = False, on_delete = models.CASCADE, default=None)
	date_created = models.DateTimeField(default=timezone.now)
	is_removed = models.IntegerField(default=0)

	class Meta:
		db_table = "Folder"	

class Bookmark_detail (models.Model):
	websiteTitle = models.CharField(max_length = 1000, null = False)
	itemType = models.CharField(max_length = 50,null=False)
	url = models.CharField(max_length = 2000,null=False)
	title = models.CharField(max_length = 1000,null=False)
	subtitle = models.CharField(max_length = 1000,null=True)
	author =  models.CharField(max_length = 1000,blank= True)
	description =  models.CharField(max_length = 1000,blank= True)
	journalItBelongs = models.CharField(max_length = 1000,blank= True)
	volume = models.CharField( max_length = 50, blank= True )
	numOfCitation = models.CharField(max_length = 1000,blank= True)
	numOfDownload = models.CharField(max_length = 1000,blank= True)
	numOfPages = models.CharField(max_length = 1000,blank= True)
	edition =models.CharField(max_length = 20,blank= True)
	publisher = models.CharField(max_length = 1000, blank= True)
	publicationYear = models.CharField(max_length= 20,blank= True)
	DOI = models.CharField(max_length = 200,blank= True)	
	ISSN = models.CharField(max_length = 100,blank= True)

	objects = UserBookmarkQuerySet.as_manager()

	class Meta:
		db_table = "Bookmark_detail"

	def delete(self):
		self.isRemoved = 1
		self.date_removed = timezone.now()
		self.save()

		return self

class Group(models.Model):
	name = models.CharField(max_length=50) #add not null and not blank here
	owner = models.ForeignKey(User, related_name='User', on_delete = models.CASCADE)
	date_created = models.DateTimeField(auto_now_add= True)
	is_removed = models.IntegerField(default=0)
	member = models.ManyToManyField(User)
	class Meta:
		db_table = "Group"

	def get_members(self):
		member_list = self.member.all().values("username", "first_name","last_name")

		return member_list

		

class Bookmark(models.Model):
	user = models.ForeignKey(User, null = True, blank = True, on_delete = models.CASCADE)
	owner = models.ForeignKey(User,null = True, blank = True, related_name='owner', on_delete = models.CASCADE)
	group = models.ForeignKey(Group, null = True, blank = True, on_delete = models.CASCADE)
	folder = models.ForeignKey(Folder, null = True, blank = True, on_delete = models.CASCADE)
	bookmark = models.ForeignKey(Bookmark_detail, null = False, blank = False, on_delete = models.CASCADE)
	isFavorite = models.BooleanField(default=False)
	dateAccessed = models.DateTimeField(default = timezone.now)
	dateAdded = models.DateTimeField(auto_now_add = True )
	isRemoved = models.IntegerField(default = 0)	
	date_removed = models.DateTimeField(null = True)
	keyword= models.CharField(max_length = 200,blank= False, null=False, default="")


class Dissertation(models.Model):
	title = models.CharField(max_length=1000)
	abstract = models.CharField(max_length=2000)
	author = models.CharField(max_length=200)
	is_active = models.BooleanField(default = False)
	department = models.ForeignKey(Department, null = True, blank = False, on_delete = models.CASCADE) #edit null to False
	class Meta:
		db_table = "Dissertation"

# class Dissertation_authors(models.Model):
# 	first_name = models.CharField(max_length=50)
# 	last_name = models.CharField(max_length=30)

# 	class Meta:
# 		db_table = "Dissertation_authors"





# class Group_bookmark(models.Model):
# 	group =models.ForeignKey(User_group, null = False, blank = False, on_delete = models.CASCADE)
# 	bookmark = models.ForeignKey(Bookmark_detail, null = False, blank = False, on_delete = models.CASCADE)
# 	added_by = models.ForeignKey(User, null = False, blank = False, on_delete = models.CASCADE)
# 	date_added = models.DateTimeField(default=timezone.now)
# 	is_removed = models.IntegerField(default=0)
# 	date_removed = models.DateTimeField(blank=True,null = True)

# 	class Meta:
# 		db_table = "Group_bookmark"



class Site (models.Model):
	name = models.CharField(max_length= 100)
	url= models.CharField(max_length= 300)
	is_active = models.BooleanField(default=False)

	class Meta:
		db_table = "Site"	


class UserSite_access(models.Model):
	user = models.ForeignKey(User, null = True, blank = True, on_delete = models.CASCADE)
	site = models.ForeignKey(Site, null = False, blank = False, on_delete = models.CASCADE)
	date_of_access = models.DateTimeField(auto_now_add=True)

	class Meta:
		db_table = "UserSite_access"	

class User_login(models.Model):
	user = models.ForeignKey(User, null = False, blank = False, on_delete = models.CASCADE)
	date = models.DateTimeField(default=timezone.now)
	department = models.ForeignKey(Department, null = True, blank = False, on_delete = models.CASCADE) #change null to True
	class Meta:
		db_table = "User_login"	

class Headers (models.Model):
	text = models.CharField(max_length = 5000)

	class Meta:
		db_table = "Headers"


# class Practice (models.Model):
# 	text =  models.CharField(max_length = 5)
# 	time = models.DateTimeField(default=timezone.now)


# 	class Meta:
# 		db_table = "Practice"



# class Proxies (models.Model):
# 	proxy = models.CharField(max_length = 100)
# 	isUsed = models.BooleanField(default = False)

# 	class Meta:
# 		db_table = "Proxies"

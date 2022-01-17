from django import forms
from .models import *
from django.contrib.auth.forms import UserCreationForm 



		#fields = '__all__'

class CreateFolderForm(forms.ModelForm):
	class Meta:
		model = Folder
		fields = ('name',)

class LoginUser(UserCreationForm):
	class Meta:
		model = User
		fields = [ 'username', 'password' ]


class CreateUserForm(forms.ModelForm):
	class Meta:
		model = User
		# fields = ('first_name','last_name','username','password',)
		fields = [ 'first_name','last_name','username','password', "student_id"]
		

class UpdateUserForm(forms.ModelForm):
	class Meta:
		model = User
		# fields = ('first_name','last_name','username','password',)
		fields = [ 'first_name','last_name']
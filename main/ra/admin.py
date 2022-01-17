from django.contrib import admin

from . import models

admin.site.register(models.Department)
admin.site.register(models.User)
admin.site.register(models.Admin)
admin.site.register(models.Bookmark_detail)
admin.site.register(models.Bookmark)
admin.site.register(models.Dissertation)
admin.site.register(models.Group)
admin.site.register(models.Folder)
admin.site.register(models.Site)
admin.site.register(models.UserSite_access)
admin.site.register(models.Headers)


from django.db import models
from django.utils import timezone


class UserBookmarkQuerySet(models.QuerySet):
    def recently_added(self):
        seven_days_ago = timezone.now() - timezone.timedelta(days=7)
        return self.filter(dateAdded__gte=seven_days_ago)

    def recently_read(self):
        three_days_ago = timezone.now() - timezone.timedelta(days=3)
        return self.filter(dateAccessed__gte=three_days_ago)

    def favorites(self, favorite=True):
        return self.filter(isFavorite=favorite)

    def removed(self, removed=True):
        return self.filter(isRemoved=removed)

    def folder(self, folder):
        return self.filter(folders__id=folder)

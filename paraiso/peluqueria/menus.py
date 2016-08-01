#from django.core.urlresolvers import reverse

from menu import Menu, MenuItem

def profile_title(request):
    """
    Return a personalized title for our profile menu item
    """
    # we don't need to check if the user is authenticated because our menu
    # item will have a check that does that for us
    name = request.user.get_full_name() or request.user
    return "%s's Profile" % name

# Add two items to our main menu
Menu.add_item("main", MenuItem("Tools",
                               reverse("django.contrib.auth.views.login"),
                               weight=10,
                               icon="tools"))
Menu.add_item("main", MenuItem("Reports",
                               reverse("django.contrib.auth.views.login"),
                               weight=20,
                               icon="report"))
# Define children for the my account menu
myaccount_children = (
    MenuItem("Edit Profile",
             reverse("django.contrib.auth.views.login"),
             weight=10,
             icon="user"),
    MenuItem("Admin",
             reverse("admin:index"),
             weight=80,
             separator=True,
             check=
             lambda
             request: request.user.is_superuser),
    MenuItem("Logout",
             reverse("django.contrib.auth.views.logout_then_login"),
             weight=90,
             separator=True,
             icon="user"),
             )
# Add a My Account item to our user menu
Menu.add_item("user", MenuItem("My Account",
                               reverse("django.contrib.auth.views.login"),
                               weight=10,
                               children=myaccount_children))

from GPI.models import MyUser

class MyUserAuth(object):

    def authenticate(self, username = None, password = None):
        try:
            user = MyUser.objects.get(email = username)
            if user.check_password(password):
                print("Si existe el usuario!!! :)")
                return user
        except MyUser.DoesNotExist:
            print("No existe el usuario")
            return None

    def get_user(self,user_id):
        try:
            user = MyUser.objects(pk = user_id)
            if user.is_ative:
                return user
            return None
        except MyUser.DoesNotExist:
            return None



import 'package:mobx/mobx.dart';
part 'form.g.dart';
class FormStore=_FormStore with _$FormStore;
abstract class _FormStore with Store
{
  @observable
  String username='';

  @observable
  String email='';

  @observable
  String pass='';

  @observable
  String? usernameError;

  @observable
  String? emailError;

  @observable
  String? passError;

  @computed
  bool get isValid => username.isNotEmpty && email.isNotEmpty && pass.isNotEmpty;


  @action
  void validateUserName(String value)
  {
    if(value.isNotEmpty)
      {
        username=value;
        usernameError=null;
      }
    else
      {
        usernameError="Please Enter Your UserName";
      }
  }

  @action
  void validateEmail(String value)
  {
    if(value.isNotEmpty)
    {
      email=value;
      emailError=null;
    }
    else
    {
      emailError="Please Enter Your Email";
    }
  }

  @action
  void validatePassword(String value)
  {
    if(value.isNotEmpty)
    {
      pass=value;
      passError=null;
    }
    else
    {
      passError="Please Enter Your Password";
    }
  }
}
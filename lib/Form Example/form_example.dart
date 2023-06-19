import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/Form%20Example/form.dart';

class FormExample extends StatelessWidget {
  FormExample({Key? key}) : super(key: key);

  FocusNode userFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode submit = FocusNode();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final FormStore formStore = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Form Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(emailFocus);
                  },
                  focusNode: userFocus,
                  style: TextStyle(fontSize: 20),
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: userController,
                  decoration: InputDecoration(
                    errorText: formStore.usernameError,
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "UserName",
                    hintStyle: TextStyle(fontSize: 20),
                    isDense: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                            style: BorderStyle.none)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.purple.shade500)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: InputDecoration(
                    errorText: formStore.emailError,
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Email",
                    hintStyle: TextStyle(fontSize: 20),
                    isDense: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                            style: BorderStyle.none)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.purple.shade500)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  focusNode: passFocus,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  controller: passController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    errorText: formStore.passError,
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: 20),
                    isDense: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                            style: BorderStyle.none)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.purple.shade500)),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                focusNode: submit,
                onPressed: () {
                  formStore.validateUserName(userController.text.toString());

                  formStore.validateEmail(emailController.text.toString());

                  formStore.validatePassword(passController.text.toString());

                  if (formStore.isValid) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: BeveledRectangleBorder(),
                            icon: Icon(Icons.done,
                                color: Colors.purple, size: 25),
                            title: Text("SignUp Successful",
                                style: TextStyle(fontSize: 15)),
                          );
                        });
                  }
                },
                child: Text("Sign Up",
                    style:
                        TextStyle(fontSize: 20, color: Colors.purple.shade800)),
              )
            ],
          );
        },
      ),
    );
  }
}

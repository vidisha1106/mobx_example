import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/Form%20Example/form.dart';

class FormExample extends StatelessWidget {
  FormExample({Key? key}) : super(key: key);

  final FocusNode userFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  final FocusNode submit = FocusNode();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final FormStore formStore = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Form Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(emailFocus);
                  },
                  focusNode: userFocus,
                  style: const TextStyle(fontSize: 20),
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: userController,
                  decoration: InputDecoration(
                    errorText: formStore.usernameError,
                    errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "UserName",
                    hintStyle: const TextStyle(fontSize: 20),
                    isDense: true,
                    border: const UnderlineInputBorder(
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
                  style: const TextStyle(fontSize: 20),
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  decoration: InputDecoration(
                    errorText: formStore.emailError,
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Email",
                    hintStyle: const TextStyle(fontSize: 20),
                    isDense: true,
                    border: const UnderlineInputBorder(
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
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    errorText: formStore.passError,
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Password",
                    hintStyle: const TextStyle(fontSize: 20),
                    isDense: true,
                    border: const UnderlineInputBorder(
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
              const SizedBox(
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
                          return const AlertDialog(
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

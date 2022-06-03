import 'package:flutter/material.dart';
import 'package:pocho_project/login/components/customInputDecoration.dart';
import 'package:pocho_project/login/components/eyeController.dart';
import 'package:pocho_project/login/components/forgotpassword.dart';
import 'package:pocho_project/widgets/defaultButton.dart';

class formField extends StatefulWidget {
  formField({
    Key? key,
  }) : super(key: key);

  @override
  State<formField> createState() => _formFieldState();
}

class _formFieldState extends State<formField> {
  final _formKey = GlobalKey<FormState>();
  final obScure _obscure = obScure();
  // creating the text editing controller in for the authertification method of the firebase

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // email field here....
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: customInputDecoration(
              icon: Icons.email_outlined,
              press: () {},
              text: "Enter your email",
            ),
          ),
          // password field here....
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            decoration: customInputDecoration(
              icon: Icons.remove_red_eye_outlined,
              press: () {
                _obscure.updateIsObscure();
                setState(() {});
                print(_obscure.isObscure);
              },
              text: "Enter your password",
            ),
            obscureText: _obscure.isObscure,
          ),
          SizedBox(
            height: 20,
          ),
          // forgot password
          forgotPassword(
            press: () {},
          ),
          //
          // Login button
          SizedBox(
            height: 30,
          ),
          defaultButton(
            text: "Log in",
            press: () {
              print(_emailController.toString());
              print(_passwordController.toString());
            },
          ),
        ],
      ),
    );
  }
}

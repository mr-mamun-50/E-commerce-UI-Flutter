// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_damex/screens/app.dart';
import 'package:ecommerce_damex/screens/auth/sign_up.dart';
import 'package:ecommerce_damex/screens/components/colors.dart';
import 'package:ecommerce_damex/screens/components/components.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            ListView(
              children: [
                const SizedBox(height: 10),
                //   Welcome text
                const Text('Welcome',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                const Text('Please enter your data to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: mutedTextColor)),
                const SizedBox(height: 120),

                //   Form fields
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email
                      const Text('Email',
                          style: TextStyle(color: mutedTextColor)),

                      TextFormField(
                        controller: emailController,
                        validator: (value) =>
                            value!.isEmpty ? 'Email is required' : null,
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputDecoration('user@example.com'),
                      ),
                      const SizedBox(height: 20),

                      // Password
                      const Text('Password',
                          style: TextStyle(color: mutedTextColor)),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) => value!.length < 8
                            ? 'Password at least 8 character'
                            : null,
                        obscureText: true,
                        decoration: inputDecoration('********'),
                      ),
                      const SizedBox(height: 20),

                      // sign up link
                      SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'New here?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: darkTextColor),
                                ),
                                TextSpan(
                                  text: ' Create an account',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: darkTextColor),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp())),
                        ),
                      ),
                      const SizedBox(height: 170),

                      //   terms and conditions
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'By connecting your account confirm that you agree with our ',
                              style: TextStyle(
                                  color: mutedTextColor, fontSize: 13),
                            ),
                            TextSpan(
                              text: 'Term and Condition',
                              style:
                                  TextStyle(color: darkTextColor, fontSize: 13),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => AppLayout()),
                      (route) => false);
                },
                height: 50,
                color: primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

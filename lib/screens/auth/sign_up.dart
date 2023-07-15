// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_damex/screens/auth/login.dart';
import 'package:ecommerce_damex/screens/components/Colors.dart';
import 'package:ecommerce_damex/screens/components/components.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
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
                const Text('Sign Up',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                const SizedBox(height: 100),

                //   Form fields
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      const Text('Name',
                          style: TextStyle(color: mutedTextColor)),

                      TextFormField(
                        controller: nameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Email is required' : null,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration('John Doe'),
                      ),
                      const SizedBox(height: 20),

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

                      // Login link
                      SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: darkTextColor),
                                ),
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: darkTextColor),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                          onTap: () => Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Login()),
                              (route) => false),
                        ),
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
                onPressed: () {},
                height: 50,
                color: primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

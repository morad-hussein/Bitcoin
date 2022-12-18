


import 'package:end/view_model/provider/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LodinScreenState();
}

class _LodinScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  var _email = TextEditingController();
  var _password = TextEditingController();
  bool isHiddenPassword = true;
  bool _flag = true;

  void _ispsssword() {
    setState(() {
      if (isHiddenPassword == true) {
        isHiddenPassword = false;
      } else {
        isHiddenPassword = true;
      }
    });
  }



  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.black38,
                    filled: true,
                    label: Text('Email'),
                    labelStyle: TextStyle(
                      color: Colors.white70,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white70,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white70, width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: isHiddenPassword,
                  keyboardType: TextInputType.text,
                  controller: _password,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 3) {
                      return "Please enter your password";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.black38,
                    filled: true,
                    label: Text('Password'),
                    labelStyle: TextStyle(
                      color: Colors.white70,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white70,
                    ),
                    suffixIcon: InkWell(
                      onTap: _ispsssword,
                      child: Icon(
                        isHiddenPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white70,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white70, width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<AuthProvider>(context, listen: false)
                          .login(_email.text, _password.text);
                    }


                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Or",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .googleSignInMethod();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.jpg',
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ));
                    },
                    child: Text(
                      "Sign out ",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

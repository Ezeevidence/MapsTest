import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isHidden = true;

  void togglePassword() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Container(
              child: Column(

                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Welcome!",
                      style: TextStyle(
                        fontFamily: 'Basis',
                        color: Colors.white,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  const SizedBox(height: 20,),

                  TextFormField(
                    decoration: const InputDecoration(
                      hoverColor: Colors.white,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    cursorColor: Colors.white,
                    validator: (val) => val!.isEmpty ? 'Enter Email' : null,

                  ),

                  const SizedBox(height: 20,),

                  TextFormField(
                    decoration: InputDecoration(
                      hoverColor: Colors.white,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hintText: "Password(Min. 8 Characters)",
                      hintStyle: const TextStyle(
                          color: Colors.white
                      ),
                      suffix: InkWell(
                        child: isHidden? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                        onTap: togglePassword,
                      ),
                    ),
                    validator: (val) => val!.length < 8 ? 'Password too short.' : null,
                    obscureText: isHidden,
                    cursorColor: Colors.white,

                  ),

                  const SizedBox(height: 30,),

                  GestureDetector(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),

                  const SizedBox(height: 30,),

                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton
                        (
                        onPressed: () {

                        },
                        // color: Colors.yellow[200],
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30,),

                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "New User? Create a new Account",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),

                ],

              ),

            ),
          )),

    );
  }
}

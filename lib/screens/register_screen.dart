import 'package:flutter/material.dart';
import 'package:maps_test/services/auth.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);


  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final authenticate = Authenticate();

  bool isHidden = true;

  void togglePassword() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.deepPurple[700],

      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 15),
            child: Column(
              children: [

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child:
                    Image.asset('back.svg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),


                    child: Column(
                      children: [
                        const Text(
                            "Create a new account",
                            style: TextStyle(
                                fontFamily: 'Basis',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            )
                        ),

                        const SizedBox(height: 30,),

                        Center(
                          child: TextFormField(
                            decoration: const  InputDecoration(
                              hintText: "Enter email",
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                            cursorColor: Colors.white,
                            validator: (val) => val!.isEmpty ? 'Enter Email' : null,

                          ),
                        ),

                        const SizedBox(height: 20,),

                        Center(
                          child: TextFormField(
                            decoration: const  InputDecoration(
                              hintText: "Create Username",
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                            cursorColor: Colors.white,
                            validator: (val) => val!.isEmpty ? 'Enter Username' : null,

                          ),
                        ),

                        const SizedBox(height: 20,),


                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password(Min. 8 Characters)",
                            hintStyle: const TextStyle(
                                color: Colors.black
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

                        const SizedBox(height: 20,),

                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Referral code(optional) ",
                          ),
                        ),

                        const SizedBox(height: 20,),

                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                authenticate.signUpWithEmailAndPassword();
                              },

                              child: const Text(
                                "Register",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50,),


                        Center(
                          child: SizedBox(
                            height: 50.0,
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset("google.png"),
                                  ElevatedButton
                                    (
                                    onPressed: () {
                                      authenticate.signInWithGoogle();
                                    },
                                    child: const Text(
                                      "Sign In With Google",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )],
                              ),),
                          ),
                        ),
                      ]),
                  ),
                )
              ]),
          )
      ),
    );
  }
}

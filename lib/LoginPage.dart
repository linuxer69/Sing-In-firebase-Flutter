
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //txt controllers
  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();

  Future singin() async{
    await FirebaseAuth.instance.
    signInWithEmailAndPassword(email: _emailController.text,
        password: _passwdController.text);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 30,),
            Icon(Icons.phone_android,size: 100,),
            SizedBox(height: 30,),
            //Hello Again TXT
            Text("HELLO Again!",
              style: GoogleFonts.bebasNeue(fontSize: 36),
            ),
           SizedBox(height: 20,),

           //txt
            Text("Welcome Back you been missed",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),),
            SizedBox(height: 50,),

            //email txtfild
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                      controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email"
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),

            //passwd txtfild
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _passwdController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password"
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),

            // singin buttom

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: singin,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),

                  child: Center(child: Text("Sing In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),)),
                ),
              ),
            ),
            SizedBox(height: 20,),

            //not a membar ? register

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a members?",style: TextStyle(fontWeight: FontWeight.bold),),
                Text(" Register Now",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),),
              ],
            ),

          ],),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:demoproject/signup.dart';
import 'main.dart';



import 'home.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var myOnTap;
  bool? value = false;
  bool _obscureText = true;
  bool changeIcon= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ic_movie.png',
                    width: 120,
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Log In ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color:  Colors.blueAccent,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(

                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_outline_outlined,
                      color: Colors.blueAccent,
                    ),
                    labelText: 'Email',
                    hintText: ' Email',
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 1, color: Color(0xff0189A5)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color:  Colors.blueAccent,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState((){
                          _obscureText = !_obscureText;
                          changeIcon=!changeIcon;
                        });

                      },
                      child: changeIcon? Icon(Icons.visibility,color: Colors.blueAccent,): Icon(Icons.visibility_off,color: Colors.blueAccent,),

                    ),
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 1, color: Color(0xff0189A5)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Checkbox(

                      value: this.value,
                      onChanged: (bool? value){
                        setState((){
                          this.value = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child:const Text('Remember Me',style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(left: 94),
                    child: Text('Forgot Password ?',style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 135.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                    print('hello');
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  child: Ink(
                    decoration: BoxDecoration(
                        color:  Colors.blueAccent, borderRadius: BorderRadius.circular(24)),

                    child: Container(

                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                'Or Sign in with',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    // needed
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => myOnTap,
                      child: Image.asset(
                        "assets/ic_google.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),


                  Material(
                    // needed
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => myOnTap,
                      child: Image.asset(
                        "assets/ic_fb.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Material(
                    // needed
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => myOnTap,
                      child: Image.asset(
                        "assets/ic_twitter.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all( 24),
                    child: Text("Don't have an account ?",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Register();
                      },),);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text("Sign up ",style: TextStyle(
                        color:  Colors.blueAccent,


                        fontSize: 16,
                      ),),
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
import 'package:flutter/material.dart';
import 'loginpage.dart';

import 'loginpage.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();




  bool _obscureText = true;
  bool changeIcon= true;
  bool confirmObscure=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blueAccent,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SafeArea(
        child:SingleChildScrollView(

          child: Column(
            children: [
              txtfld('Enter Your Name  ', Icons.person,nameController),
              txtfld('Enter New Username ', Icons.person_outline_sharp,usernameController),
              txtfld('Enter your email ', Icons.mail,emailController),
              txtfld('Enter Contact Number', Icons.phone,contactController),

              pwfield('Enter Password',Icons.lock_outline,Icons.visibility,passwordController),
              pwfield('Confirm Password',Icons.lock,Icons.visibility,confirmPasswordController),

              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 135.0),
                child: ElevatedButton(
                  onPressed: (){
                    print(passwordController);
                    print(confirmPasswordController);
                    print(usernameController);
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
                          'Sign Up',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all( 24),
                    child: Text("Already have an account ?",style: TextStyle(
                      color: Colors.grey,


                      fontSize: 16,
                    ),),
                  ),
                ],
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context, MaterialPageRoute(builder: (context){
                        return Homepage();
                      },),);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text("Login",style: TextStyle(
                        color: Colors.blueAccent,


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

class pwfield extends StatefulWidget {
  pwfield(this.hintname,this.icon,this.suficon,this.controller);
  var hintname;
  var icon;
  var controller;
  var suficon;

  @override
  State<pwfield> createState() => _pwfieldState();
}

class _pwfieldState extends State<pwfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 24.0),

      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: widget.controller,

            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.icon,
                color:  Colors.blueAccent,
              ),
              suffixIcon: Icon(
                widget.suficon,
              ),


              hintText: widget.hintname,
              border: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 1, color: Color(0xff0189A5)),
                borderRadius: BorderRadius.circular(24),
              ),

            ),
          ),
        ],
      ),
    );
  }
}

class txtfld extends StatefulWidget {
  txtfld(this.hintname,this.icon,this.controller);
  var hintname;
  var icon;
  var controller;

  @override
  State<txtfld> createState() => _txtfldState();
}

class _txtfldState extends State<txtfld> {
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 24.0),

      child: Column(

        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: widget.controller,


            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.icon,
                color:  Colors.blueAccent,

              ),

              //labelText: 'Enter your Full Name',
              hintText: widget.hintname,
              border: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 1, color: Color(0xff0189A5)),
                borderRadius: BorderRadius.circular(24),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
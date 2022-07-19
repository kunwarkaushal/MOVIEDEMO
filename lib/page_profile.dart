
import 'package:flutter/material.dart';

class View extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,


          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/ic_logo.jpg'),
              radius: 60,
              child: Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.edit,color: Colors.green,),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "Kaushal Bahadur Kunwar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 4,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text("Flutter Developer",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 2,

              ),),
            ),

            SizedBox(
              height: 30,
            ),
            Card(
              color: Colors.blueAccent[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: Icon(Icons.call, color: Colors.blueAccent,),
                title: Text("+977 9862404141",style: TextStyle(color: Colors.black,),),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.blueAccent[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: Icon(Icons.mail, color: Colors.blueAccent,),
                title: Text("kaushalkunwar36@gmail.com",style: TextStyle(color: Colors.black,),),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.blueAccent[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.blueAccent,),
                title: Text("Balaju,Kathmandu",style: TextStyle(color: Colors.black,),),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.blueAccent[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: Icon(Icons.work, color: Colors.blueAccent),
                title: Text("Sanepa,Lalitpur",style: TextStyle(color: Colors.black,),),
              ),
            ),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
}

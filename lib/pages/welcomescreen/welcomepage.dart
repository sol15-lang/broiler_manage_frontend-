import 'package:lottie/lottie.dart';
import 'package:broilermanage/pages/loginpage/loginpage.dart';
import 'package:broilermanage/pages/signuppage/signuppage.dart';
import 'package:flutter/material.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              '  Welcome To \n Broiler Manage',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            SizedBox(height: 35),
            Lottie.asset('assets/lottie/Little Chicken.json',
            height: 300,
            width: 500
            ),
            SizedBox(height: 35),
            Text(
              '           Managing your \n broilers for quality results.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minWidth: 400,
              height: 50,
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Log In', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 30, child: Text('or', style: TextStyle(color: Colors.white,fontSize:20 ))),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              minWidth: 400,
              height: 50,
              textColor: Colors.white,
              child: Text('Register', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

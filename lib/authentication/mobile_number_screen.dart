import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'otp_verification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  bool isNumberEntered = false;

  // void _navigateToOTP() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => OTPVerificationScreen(
  //         mobileNumber: _mobileController.text,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Container(
            margin: EdgeInsets.all(50),
            decoration: const BoxDecoration(
             
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: Image.asset(
              'assets/images/allSports.png', 
              fit: BoxFit.cover,
             // height: 200,
            ),
          ),
          const SizedBox(height: 20),
      
          const Text(
            'Ready to Get Started?',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Explore all the features and dive into the world of sports management now!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
      
          // Mobile Number Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _mobileController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Mobile Number',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  isNumberEntered = value.length == 10;
                });
              },
            ),
          ),
      
          // Get OTP Button
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: (){
                 Get.to(() => OTPVerificationScreen(mobileNumber: _mobileController.text));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003572),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 170); 

    path.quadraticBezierTo(
        size.width / 2, size.height + 50, size.width, size.height - 40);

    path.lineTo(size.width, 0);

    path.close(); 
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

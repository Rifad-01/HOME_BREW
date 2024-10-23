import 'package:first_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            // shop name
            Center(
              child: Text(
                "HOME BREW",
                style:
                    GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.brown[800]),
              ),
            ),

            const SizedBox(height: 25),

            // icon
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 70,left:50,top:70 ,bottom: 25),
                child: Image.asset("images/machine.png",width: 150,height: 150,),
              ),
            ),
            

            const SizedBox(height: 25),
            // title
            Text(
              "WHERE EVERY SIP FEELS LIKE HOME",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 24, color: Colors.brown[800]),
            ),

            const SizedBox(height: 10),

            // subtitle
            Text("Experience the warmth of home with every sip of our carefully crafted coffee, anytime and anywhere",
            style: TextStyle(
              color: Colors.brown[700],
              height: 2,
            ),
             
            ),

            const SizedBox(height: 25),

            // get started button
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to the next page or perform an action
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: TextButton.styleFrom(
                   // Text color
                  backgroundColor: Colors.brown[900], // Background color
                  padding: const EdgeInsets.all(25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Enter shop",
                  selectionColor: Colors.brown,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

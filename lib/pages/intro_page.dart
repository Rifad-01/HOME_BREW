import 'package:first_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[600],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            // shop name
            Text(
              "HOME BREW",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),

            const SizedBox(height: 25),

            // icon
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset("images/machine.png",width: 125,height: 125,),
            ),

            const SizedBox(height: 25),
            // title
            Text(
              "WHERE EVERY SIP FEELS LIKE HOME",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 24, color: Colors.white),
            ),

            const SizedBox(height: 10),

            // subtitle
            Text("Experience the warmth of home with every sip of our carefully crafted coffee, anytime and anywhere",
            style: TextStyle(
              color: Colors.grey[300],
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
                  backgroundColor: Colors.brown[400], // Background color
                  padding: const EdgeInsets.all(25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Enter shop",
                  selectionColor: Color.fromRGBO(78, 52, 46, 1),
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

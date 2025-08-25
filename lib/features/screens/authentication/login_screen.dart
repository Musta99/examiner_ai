import 'package:examiner_ai/features/screens/authentication/signup_screen.dart';
import 'package:examiner_ai/features/screens/bottomNavigation/bottom_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Center(child: Text("Logo")),
                      ),
                      Text(
                        "Glad that you are back!",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Sign in to continue",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Color(0xff94A3B8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  ShadCard(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    backgroundColor: Color(0xff3C4044),
                    border: Border.all(width: 0),
                    child: Column(
                      spacing: 10,
                      children: [
                        Text(
                          "Sign in",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ShadInput(
                          decoration: ShadDecoration(
                            color: Color(0xff454D53),
                            border: ShadBorder.none,
                            secondaryFocusedBorder: ShadBorder.none,
                          ),
                          leading: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Iconsax.sms, color: Colors.white),
                          ),
                          placeholder: Text(
                            "Your email address",
                            style: GoogleFonts.roboto(color: Colors.grey),
                          ),
                          style: GoogleFonts.roboto(color: Colors.white),
                          cursorColor: Colors.white,
                        ),

                        ShadInput(
                          decoration: ShadDecoration(
                            color: Color(0xff454D53),
                            border: ShadBorder.none,
                            secondaryFocusedBorder: ShadBorder.none,
                          ),
                          leading: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Iconsax.lock, color: Colors.white),
                          ),
                          placeholder: Text(
                            "Your password",
                            style: GoogleFonts.roboto(color: Colors.grey),
                          ),
                          style: GoogleFonts.roboto(color: Colors.white),
                          cursorColor: Colors.white,
                        ),

                        ShadButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBar(),
                              ),
                            );
                          },
                          width: double.infinity,
                          gradient: LinearGradient(
                            colors: [Color(0xff3780F1), Color(0xff1A9E5B)],
                          ),
                          child: Text("Sign in"),
                        ),

                        SizedBox(height: 15),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "Don't have an account?  "),
                              TextSpan(
                                text: "Sign up",
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => SignupScreen(),
                                          ),
                                        );
                                      },
                                style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

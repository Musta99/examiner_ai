import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Skip",
                    style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
                  ),
                ),

                Expanded(
                  child: PageView(
                    controller: controller,
                    children: [
                      // First Page
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [Color(0xff314552), Color(0xff2E4840)],
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Iconsax.microphone,
                                size: 70,
                                color: Color(0xff3780F6),
                              ),
                            ),
                          ),

                          Text(
                            "AI Voice Examiner",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60),
                            child: Text(
                              "Experience realistic viva sessions with our advanced AI that asks contextual questions just like a real examiner.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                color: Color(0xff94A3B8),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Second Page
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [Color(0xff314552), Color(0xff2E4840)],
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Iconsax.sms,
                                size: 70,
                                color: Color(0xff3780F6),
                              ),
                            ),
                          ),

                          Text(
                            "Practice Q&A Sessions",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60),
                            child: Text(
                              "Engage in interactive question-answer sessions tailored to your subject and difficulty level.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                color: Color(0xff94A3B8),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Third Page
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [Color(0xff314552), Color(0xff2E4840)],
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Iconsax.add_circle,
                                size: 70,
                                color: Color(0xff3780F6),
                              ),
                            ),
                          ),

                          Text(
                            "Instant Feedback",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60),
                            child: Text(
                              "Get immediate, detailed feedback on your answers to improve your performance and confidence.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                color: Color(0xff94A3B8),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                DotsIndicator(
                  dotsCount: 3,
                  decorator: DotsDecorator(
                    activeSize: Size.fromRadius(6),
                    activeColor: Color(0xff3780F6),
                  ),
                  position:
                      currentPage.toDouble(), // 👈 instead of double.parse()
                  onTap: (position) {
                    setState(() {
                      currentPage = position.toInt();
                    });
                    controller.jumpToPage(currentPage);
                  },
                ),

                ShadButton(
                  onPressed: () {
                    setState(() {
                      if (currentPage < 2) {
                        // 👈 last valid index is 2
                        currentPage++;
                        controller.jumpToPage(currentPage);
                      } else {
                        // Navigate to home/login/etc. when onboarding is finished
                        print("No pages");
                      }
                    });
                  },
                  width: double.infinity,
                  gradient: LinearGradient(
                    colors: [Color(0xff3780F1), Color(0xff1A9E5B)],
                  ),
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

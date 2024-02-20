import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SLIDER_THREE_UI extends StatefulWidget {
  const SLIDER_THREE_UI({Key? key}) : super(key: key);

  @override
  State<SLIDER_THREE_UI> createState() => _SLIDER_THREE_UIState();
}

class _SLIDER_THREE_UIState extends State<SLIDER_THREE_UI> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/screen_three.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      color: const Color.fromARGB(0, 255, 193, 7),
                      child: Column(
                        children: [
                          Animate(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ).animate().move(delay: 500.ms).fade(delay: 500.ms),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.04,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.height * 0.0,
                            ),
                            child: TextField(
                              controller: _usernameController,
                              cursorColor: Colors.white,
                              cursorRadius: Radius.circular(100),
                              cursorHeight:
                                  MediaQuery.of(context).size.height * 0.04,
                              cursorWidth:
                                  MediaQuery.of(context).size.width * 0.001,
                              cursorOpacityAnimates: true,
                              showCursor: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: false,
                                fillColor: Colors.white,
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.white),
                                hintText: 'example@gmail.com',
                                hintStyle: GoogleFonts.kanit(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white54,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: MediaQuery.of(context).size.width *
                                        0.001,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: MediaQuery.of(context).size.width *
                                        0.001,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Username',
                                labelStyle: GoogleFonts.kanit(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                              style: TextStyle(
                                  color: Colors
                                      .white), // Set text color for entered text
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.0,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.height * 0.04,
                            ),
                            child: TextField(
                              obscureText: isObscureText,
                              controller: _passwordController,
                              cursorColor: Colors.white,
                              cursorRadius: Radius.circular(100),
                              cursorHeight:
                                  MediaQuery.of(context).size.height * 0.04,
                              cursorWidth:
                                  MediaQuery.of(context).size.width * 0.001,
                              cursorOpacityAnimates: true,
                              showCursor: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                // caretColor: Colors.white,
                                // selectionHandleColor: Colors.white,
                                hoverColor: Colors.white,
                                focusColor: Colors.white,
                                filled: false,
                                fillColor: Colors.white,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.password_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                suffixIcon: isObscureText
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObscureText = !isObscureText;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.visibility_off_rounded,
                                          color: Colors.white,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObscureText = !isObscureText;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.visibility_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                hintText: 'xxxxxxx',
                                hintStyle: GoogleFonts.kanit(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white54,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: MediaQuery.of(context).size.width *
                                        0.001,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: MediaQuery.of(context).size.width *
                                        0.001,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Password',
                                labelStyle: GoogleFonts.kanit(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ), // Set text color for entered text
                            ),
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_screen/views/splash/splash_UI.dart';

class SLIDER_THREE_UI extends StatefulWidget {
  const SLIDER_THREE_UI({Key? key}) : super(key: key);

  @override
  State<SLIDER_THREE_UI> createState() => _SLIDER_THREE_UIState();
}

class _SLIDER_THREE_UIState extends State<SLIDER_THREE_UI>
    with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscureText = true;
  bool isremember = true;
  bool isButtonClicked = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/screen_three_bg.jpg"),
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
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04,
                      bottom: MediaQuery.of(context).size.height * 0.0,
                    ),
                    child: Animate(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: MediaQuery.of(context).size.height * 0.001,
                              color: Colors.white,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        color: const Color.fromARGB(0, 255, 193, 7),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Align(
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
                            ).animate().fade(delay: 500.ms),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.04,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.0,
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
                                        MediaQuery.of(context).size.width *
                                            0.04,
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
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: Colors.white,
                                  ),
                                ),
                                style: TextStyle(
                                    color: Colors
                                        .white), // Set text color for entered text
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.0,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.00,
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
                                        MediaQuery.of(context).size.width *
                                            0.04,
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
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: Colors.white,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                ), // Set text color for entered text
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.002,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Row(
                                children: [
                                  Checkbox(
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return isremember
                                            ? Colors.blue
                                            : Colors
                                                .grey; // Change these colors as needed
                                      },
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    checkColor: Colors.white,
                                    value: isremember,
                                    onChanged: (value) {
                                      setState(() {
                                        isremember = value ?? false;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Remember me',
                                    style:
                                        GoogleFonts.kanit(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.185,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              SPLASH_UI(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            const begin = 0.0;
                                            const end = 1.0;
                                            var tween =
                                                Tween(begin: begin, end: end);
                                            var fadeAnimation =
                                                animation.drive(tween);
                                            return FadeTransition(
                                              opacity: fadeAnimation,
                                              child: child,
                                            );
                                          },
                                          transitionDuration:
                                              const Duration(milliseconds: 500),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Register Click me',
                                      style: GoogleFonts.kanit(
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.002,
                            ),
                            AnimatedButton(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.82,
                              text: 'Login',
                              isReverse: true,
                              selectedTextColor: Colors.black,
                              transitionType: TransitionType.LEFT_TO_RIGHT,
                              textStyle: GoogleFonts.kanit(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08),
                              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                              borderColor: Colors.white,
                              borderRadius: 15,
                              borderWidth: 0.5,
                              onPress: () {},
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.0,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.00,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      "Or",
                                      style: GoogleFonts.kanit(
                                          color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.white,
                                  child: IconButton(
                                    color: Colors.blue,
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.facebook,
                                      color: Colors.blue,
                                      size: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.white,
                                  child: IconButton(
                                    color: Colors.blue,
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.red,
                                      size: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.white,
                                  child: IconButton(
                                    color: Colors.blue,
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.github,
                                      color: Colors.black,
                                      size: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.white,
                                  child: IconButton(
                                    color: Colors.blue,
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.line,
                                      color: Colors.green,
                                      size: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                          ],
                        ),
                      ).animate().fade(delay: 500.ms),
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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_screen/views/Authandiation/email.dart';
import 'package:slider_screen/views/Authandiation/phone.dart';
import 'package:slider_screen/views/splash/splash_UI.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class LoginRegisterCard extends StatefulWidget {
  @override
  _LoginRegisterCardState createState() => _LoginRegisterCardState();
}

class _LoginRegisterCardState extends State<LoginRegisterCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool isCardOneVisible = true;

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

  void toggleCards() {
    setState(() {
      isCardOneVisible = !isCardOneVisible;
      print('clivk');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_page.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.matrix([
              1, 0, 0, 0, 0, // Red channel
              0, 1, 0, 0, 0, // Green channel
              0, 0, 1, 0, 0, // Blue channel
              0, 0, 0, 1, 0, // Alpha channe
            ]),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1), // Shadow color
              blurRadius: 10.0, // Blur radius
              spreadRadius: 5.0, // Spread radius
              offset: Offset(0, 5), // Shadow offset
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: MediaQuery.of(context).size.width * 0.00,
            sigmaY: MediaQuery.of(context).size.height * 0.00,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: Animate(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
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
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              padding: EdgeInsets.all(3),
                              color: Colors.transparent,
                              child: TabBar(
                                dividerColor: Colors.transparent,
                                indicatorColor: Colors.redAccent,
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.white,
                                controller: _tabController,
                                indicatorSize: TabBarIndicatorSize.tab,
                                automaticIndicatorColorAdjustment: true,
                                tabs: [
                                  Container(
                                    width: double.infinity,
                                    child: Animate(
                                      child: Tab(
                                        child: Text(
                                          'Login',
                                          style: GoogleFonts.kanit(),
                                        ),
                                        icon: Icon(
                                          FontAwesomeIcons.userAlt,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ).animate().fade(delay: 2.ms),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: Animate(
                                      child: Tab(
                                        child: Text(
                                          "Regiter",
                                          style: GoogleFonts.kanit(),
                                        ),
                                        icon: Icon(
                                          FontAwesomeIcons.fileSignature,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ).animate().fade(delay: 2.ms),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: isCardOneVisible
                                              ? Card_EMAIL(
                                                  onCardTap: toggleCards)
                                              : Animate(
                                                  child: Card_PHONE(
                                                      onCardTap: toggleCards),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        // Your register page content
                                        Text('Register Page Content'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ).animate().fade(delay: 2.ms),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginRegisterCard(),
    debugShowCheckedModeBanner: false,
  ));
}

class Card_EMAIL extends StatefulWidget {
  final VoidCallback onCardTap;

  const Card_EMAIL({required this.onCardTap});

  @override
  State<Card_EMAIL> createState() => _Card_EMAILState();
}

class _Card_EMAILState extends State<Card_EMAIL> {
  @override
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscureText = true;
  bool isremember = true;
  bool isButtonClicked = false;
  Widget build(BuildContext context) {
    return Animate(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              'Login with Email',
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            TextButton(
              onPressed: () {
                widget.onCardTap();
              },
              style: TextButton.styleFrom(
                primary: Colors.black, // Background color
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Login with Phone',
                style: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.redAccent,
                  decoration: TextDecoration.combine([
                    TextDecoration.underline,
                  ]),
                  decorationColor: Colors.redAccent,
                  decorationThickness: 2.0,
                ),
              ),
            ),
          ]),
          TextField(
            controller: _usernameController,
            selectionControls: emptyTextSelectionControls,
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(100),
            cursorHeight: MediaQuery.of(context).size.height * 0.035,
            cursorWidth: MediaQuery.of(context).size.width * 0.001,
            cursorOpacityAnimates: true,
            showCursor: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: false,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.person, color: Colors.white),
              hintText: 'example@gmail.com',
              hintStyle: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white54,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: MediaQuery.of(context).size.width * 0.001,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: MediaQuery.of(context).size.width * 0.001,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Username',
              labelStyle: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white,
              ),
            ),
            style: TextStyle(
                color: Colors.white), // Set text color for entered text
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextField(
            obscureText: isObscureText,
            controller: _passwordController,
            selectionControls: emptyTextSelectionControls,
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(100),
            cursorHeight: MediaQuery.of(context).size.height * 0.035,
            cursorWidth: MediaQuery.of(context).size.width * 0.001,
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
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white54,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: MediaQuery.of(context).size.width * 0.001,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: MediaQuery.of(context).size.width * 0.001,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Password',
              labelStyle: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
            ), // Set text color for entered text
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return isremember
                        ? Colors.blue
                        : Colors.grey; // Change these colors as needed
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
                style: GoogleFonts.kanit(color: Colors.white),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SPLASH_UI(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = 0.0;
                        const end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);
                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                child: Text(
                  'Forgot your password?',
                  style: GoogleFonts.kanit(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.002,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.black, // Text color
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              // Handle button press
              print('Button pressed!');
            },
            child: Text('Press Me'),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
              bottom: MediaQuery.of(context).size.height * 0.00,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Or",
                    style: GoogleFonts.kanit(color: Colors.white),
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
                child: IconButton(
                  onPressed: () {},
                  icon: Center(
                    child: Icon(FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        size: MediaQuery.of(context).size.width * 0.1),
                  ),
                ),
              ),
              Card(
                child: IconButton(
                  onPressed: () {},
                  icon: Center(
                    child: Icon(FontAwesomeIcons.google,
                        color: Colors.red,
                        size: MediaQuery.of(context).size.width * 0.1),
                  ),
                ),
              ),
              Card(
                child: IconButton(
                  onPressed: () {},
                  icon: Center(
                    child: Icon(FontAwesomeIcons.line,
                        color: Colors.green,
                        size: MediaQuery.of(context).size.width * 0.1),
                  ),
                ),
              ),
              Card(
                child: IconButton(
                  onPressed: () {},
                  icon: Center(
                    child: Icon(FontAwesomeIcons.github,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fade(delay: 2.ms);
  }
}

class Card_PHONE extends StatefulWidget {
  final VoidCallback onCardTap;
  const Card_PHONE({required this.onCardTap});

  @override
  State<Card_PHONE> createState() => _Card_PHONEState();
}

class _Card_PHONEState extends State<Card_PHONE> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();

  bool isObscureText = true;
  bool isSender = true;
  bool isremember = true;
  bool isButtonClicked = false;
  bool isButtonLock = false;

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextButton(
              onPressed: () {
                widget.onCardTap();
              },
              child: Text(
                'Login with Email',
                style: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.redAccent,
                  decoration: TextDecoration.combine([
                    TextDecoration.underline,
                    TextDecoration.underline,
                  ]),
                  decorationColor: Colors.redAccent,
                  decorationThickness: 2.0,
                ),
              ),
            ),
            Text(
              'Login with Phone',
              style: GoogleFonts.kanit(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ]),
          Form(
            key: _phoneFormKey,
            child: TextFormField(
              controller: _phone,
              cursorColor: Colors.white,
              enableSuggestions: false,
              keyboardType: TextInputType.number,
              selectionControls: emptyTextSelectionControls,
              inputFormatters: [
                LengthLimitingTextInputFormatter(12),
                phoneformat(),
              ],
              autocorrect: false,
              textAlignVertical: TextAlignVertical.center,
              cursorRadius: Radius.circular(100),
              cursorHeight: MediaQuery.of(context).size.height * 0.04,
              cursorWidth: MediaQuery.of(context).size.width * 0.001,
              cursorOpacityAnimates: true,
              showCursor: true,
              decoration: InputDecoration(
                suffixIcon: _phoneFormKey.currentState?.validate() == false
                    ? IconButton(
                        icon: Icon(
                          FontAwesomeIcons.play,
                          color: isSender == true ? Colors.white : Colors.grey,
                        ),
                        onPressed: () async {
                          if (_phoneFormKey.currentState?.validate() ?? false) {
                            await Future.delayed(Duration(milliseconds: 1));
                            setState(() {
                              isSender = false;
                            });
                          } else {
                            showAboutDialog(context: context);
                          }
                        },
                      )
                    : Icon(
                        FontAwesomeIcons.play,
                        color: Colors.grey,
                      ),
                filled: false,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.person, color: Colors.white),
                hintText: '000-000-0000',
                hintStyle: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.white54,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: MediaQuery.of(context).size.width * 0.001,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: MediaQuery.of(context).size.width * 0.001,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Phone',
                labelStyle: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: GoogleFonts.kanit(color: Colors.amber),
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(100),
                    cursorHeight: MediaQuery.of(context).size.height * 0.035,
                    cursorWidth: MediaQuery.of(context).size.width * 0.001,
                    cursorOpacityAnimates: true,
                    showCursor: true,
                    selectionControls: emptyTextSelectionControls,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey),
                      border: OutlineInputBorder(
                        gapPadding: MediaQuery.of(context).size.width * 0.02,
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: MediaQuery.of(context).size.width * 0.001,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: GoogleFonts.kanit(color: Colors.amber),
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(100),
                    cursorHeight: MediaQuery.of(context).size.height * 0.035,
                    cursorWidth: MediaQuery.of(context).size.width * 0.001,
                    cursorOpacityAnimates: true,
                    showCursor: true,
                    selectionControls: emptyTextSelectionControls,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey),
                      border: OutlineInputBorder(
                        gapPadding: MediaQuery.of(context).size.width * 0.02,
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: MediaQuery.of(context).size.width * 0.001,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: GoogleFonts.kanit(color: Colors.amber),
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(100),
                    cursorHeight: MediaQuery.of(context).size.height * 0.035,
                    cursorWidth: MediaQuery.of(context).size.width * 0.001,
                    cursorOpacityAnimates: true,
                    showCursor: true,
                    selectionControls: emptyTextSelectionControls,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey),
                      border: OutlineInputBorder(
                        gapPadding: MediaQuery.of(context).size.width * 0.02,
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: MediaQuery.of(context).size.width * 0.001,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: GoogleFonts.kanit(color: Colors.amber),
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(100),
                    cursorHeight: MediaQuery.of(context).size.height * 0.035,
                    cursorWidth: MediaQuery.of(context).size.width * 0.001,
                    cursorOpacityAnimates: true,
                    showCursor: true,
                    selectionControls: emptyTextSelectionControls,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey),
                      border: OutlineInputBorder(
                        gapPadding: MediaQuery.of(context).size.width * 0.02,
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: MediaQuery.of(context).size.width * 0.001,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: GoogleFonts.kanit(color: Colors.amber),
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(100),
                    cursorHeight: MediaQuery.of(context).size.height * 0.035,
                    cursorWidth: MediaQuery.of(context).size.width * 0.001,
                    cursorOpacityAnimates: true,
                    showCursor: true,
                    selectionControls: emptyTextSelectionControls,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey),
                      border: OutlineInputBorder(
                        gapPadding: MediaQuery.of(context).size.width * 0.02,
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: MediaQuery.of(context).size.width * 0.001,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: GoogleFonts.kanit(color: Colors.amber),
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(100),
                    cursorHeight: MediaQuery.of(context).size.height * 0.035,
                    cursorWidth: MediaQuery.of(context).size.width * 0.001,
                    cursorOpacityAnimates: true,
                    showCursor: true,
                    selectionControls: emptyTextSelectionControls,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey),
                      border: OutlineInputBorder(
                        gapPadding: MediaQuery.of(context).size.width * 0.02,
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: MediaQuery.of(context).size.width * 0.001,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return isremember
                        ? Colors.blue
                        : Colors.grey; // Change these colors as needed
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
                style: GoogleFonts.kanit(color: Colors.white),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SPLASH_UI(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = 0.0;
                        const end = 1.0;
                        var tween = Tween(begin: begin, end: end);
                        var fadeAnimation = animation.drive(tween);
                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                child: Text(
                  'Forgot your password?',
                  style: GoogleFonts.kanit(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.002,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('SENT OTP TO PHONE'),
          ),
        ],
      ),
    ).animate().fade(delay: 2.ms);
  }
}

class phoneformat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Filter out non-digits
    String formattedValue = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Add dashes to format as 000-000-0000
    if (formattedValue.length > 3 && formattedValue.length < 7) {
      formattedValue =
          '${formattedValue.substring(0, 3)}-${formattedValue.substring(3)}';
    } else if (formattedValue.length > 6) {
      formattedValue =
          '${formattedValue.substring(0, 3)}-${formattedValue.substring(3, 6)}-${formattedValue.substring(6)}';
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

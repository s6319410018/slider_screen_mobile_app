import 'package:flutter/material.dart';
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
            image: AssetImage("assets/images/screen_three_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
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
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors
                      .white, // Change this color to the desired border color
                  width: 1.0, // You can adjust the border width
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              child: Card(
                color: Colors.transparent,
                elevation: 0, // Set elevation to 0 to remove the shadow
                child: Column(
                  children: [
                    Card(
                      child: TabBar(
                        dividerColor: Colors.white,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              10)), // Set border radius// Set the color of the sele

                          color: Colors
                              .black, // Set the color of the selected tab indicator
                          // Add other properties as needed
                        ),
                        indicatorColor: Colors.red,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            text: '\t\t\t\t\t\t\tLogin\t\t\t\t\t\t',
                            icon: Icon(
                              FontAwesomeIcons.userAlt,
                              color: Colors.white,
                            ),
                          ),
                          Tab(
                            text: '\t\t\t\t\tRegister\t\t\t\t\t',
                            icon: Icon(
                              FontAwesomeIcons.fileSignature,
                              color: Colors.white,
                            ),
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
                              top: MediaQuery.of(context).size.height * 0.02,
                              right: MediaQuery.of(context).size.width * 0.05,
                              left: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: isCardOneVisible
                                      ? Animate(
                                          child:
                                              Card_EMAIL(onCardTap: toggleCards)
                                                  .animate()
                                                  .fade(delay: 2.ms))
                                      : Card_PHONE(onCardTap: toggleCards),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Your register page content
                                Text('Register Page Content'),
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
          ],
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('Email'),
          TextButton(
              onPressed: () {
                widget.onCardTap();
              },
              child: Text('Phone login')),
        ]),
        TextField(
          controller: _usernameController,
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(100),
          cursorHeight: MediaQuery.of(context).size.height * 0.04,
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
          style:
              TextStyle(color: Colors.white), // Set text color for entered text
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        TextField(
          obscureText: isObscureText,
          controller: _passwordController,
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(100),
          cursorHeight: MediaQuery.of(context).size.height * 0.04,
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
          onPressed: () {},
          child: Text('test'),
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
    );
  }
}

class Card_PHONE extends StatefulWidget {
  final VoidCallback onCardTap;
  const Card_PHONE({required this.onCardTap});

  @override
  State<Card_PHONE> createState() => _Card_PHONEState();
}

class _Card_PHONEState extends State<Card_PHONE> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardTap, // Use widget.onCardTap here
      child: Card(
        color: Colors.amber,
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Card Two Content',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

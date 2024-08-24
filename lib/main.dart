import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool val = true;
  final GlobalKey _formKey = GlobalKey<FormState>();

  // Function to launch URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final GlobalKey _about = GlobalKey();
  final GlobalKey home = GlobalKey();
  final GlobalKey projects = GlobalKey();
  final GlobalKey contactme = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    // Step 4: Scroll to the section with the given key
    final context = key.currentContext!;
    Scrollable.ensureVisible(
      context,
      duration: Duration(seconds: 2),
      curve: Curves.slowMiddle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: val ? Colors.black : Colors.white,
          shadowColor: Color(0xffB336FF),
          elevation: 10,
          title: Padding(
            padding: const EdgeInsets.only(right: 400, left: 60),
            child: Text(
              "Welcome!",
              style: TextStyle(color: Color(0xffB336FF), fontSize: 20),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _scrollToSection(home);
              },
              child: Text(
                "HOME",
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    val ? Colors.white : Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                _scrollToSection(_about);
              },
              child: Text(
                "ABOUT",
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    val ? Colors.white : Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                _scrollToSection(projects);
              },
              child: Text(
                "PROJECTS",
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    val ? Colors.white : Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                onPressed: () {
                  _scrollToSection(contactme);
                },
                child: Text(
                  "CONTACT ME",
                  style: TextStyle(fontSize: 15, fontFamily: 'Bebas Neue'),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      val ? Colors.white : Colors.black),
                ),
              ),
            ),
            Transform.scale(
              scale: 0.64,
              child: Switch(
                value: val,
                onChanged: (value) {
                  setState(() {
                    val = value;
                  });
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            key: home,
            height: 100000,
            padding: EdgeInsets.symmetric(vertical: 220, horizontal: 190),
            color: val ? Colors.black : Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 168.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 122,
                        backgroundImage: AssetImage(
                            "assets/images/WhatsApp Image 2024-08-24 at 9.07.06 AM.jpeg"),
                      ),
                      SizedBox(width: 100),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "I AM",
                                style: TextStyle(
                                    fontSize: 52,
                                    color: val ? Colors.white : Colors.black),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                "DHIPIN M K",
                                style: TextStyle(
                                    fontSize: 52, color: Color(0xffB336FF)),
                              ),
                            ],
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            "As a Flutter Developer Intern,Passionate about creating seamless cross-platform mobile apps.",
                            style: TextStyle(
                                fontSize: 12,
                                color: val ? Colors.white : Colors.black),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _launchURL("https://github.com/Dhipin03");
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.github,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  _launchURL(
                                      "https://www.linkedin.com/in/dhipin-m-k-67a887272/"); // Replace with your LinkedIn profile URL
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                  onTap: () {
                                    _launchURL(
                                        "mailto:example@example.com"); // Replace with your email address
                                  },
                                  child: Icon(
                                    Icons.mail_outline,
                                    color: Colors.grey.shade500,
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 352),
                  Container(
                    key: _about,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21.0, top: 200),
                          child: Text(
                            "About Me",
                            style: TextStyle(
                                color: val ? Colors.white : Colors.black,
                                fontSize: 32),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          textAlign: TextAlign.justify,
                          """ I hold a B.Tech in Computer Science and Engineering, with a strong focus on mobile app development. My expertise is in leveraging Flutter to build high-performance, cross-platform applications. I am committed to continuous learning and excel in problem-solving, aiming to deliver intuitive and efficient user experiences. My goal is to innovate and stay at the forefront of the ever-evolving mobile technology landscape.""",
                          style: TextStyle(
                              color: val ? Colors.white : Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 370),
                  Container(
                    key: projects,
                    height: 800,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21.0, top: 32),
                          child: Text(
                            "Projects",
                            style: TextStyle(
                                color: val ? Colors.white : Colors.black,
                                fontSize: 32),
                          ),
                        ),
                        SizedBox(height: 52),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(12)),
                              height: 240,
                              width: 375,
                              child: Column(
                                children: [
                                  Text(
                                    "Speech Emotion Detection",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    textAlign: TextAlign.justify,
                                    "This project explores methodologies and experiments for implementing a Speech Emotion Detection system, bridging the gap between human emotions in speech and machine understanding.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              CircleBorder()),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey.shade700)),
                                      onPressed: () {
                                        _launchURL(
                                            "https://github.com/Dhipin03/Speech_Emotion-detection");
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.github,
                                        color: Colors.grey.shade500,
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(width: 21),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(12)),
                              height: 240,
                              width: 375,
                              child: Column(
                                children: [
                                  Text(
                                    "Share plate,(food Donation App)",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    textAlign: TextAlign.justify,
                                    "This Android app links food donors with charities and individuals in need. It allows users to post surplus food for donation, with features for real-time notifications and location-based search.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              CircleBorder()),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey.shade700)),
                                      onPressed: () {
                                        _launchURL(
                                            "https://github.com/Dhipin03/Shareplate_final");
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.github,
                                        color: Colors.grey.shade500,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(12)),
                              height: 240,
                              width: 375,
                              child: Column(
                                children: [
                                  Text(
                                    "Dice Roll APP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    textAlign: TextAlign.justify,
                                    "This app simulates dice rolls with a simple tap, offering a realistic and interactive experience. Users can roll one or more dice and instantly view the results, making it perfect for games and decision-making.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              CircleBorder()),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey.shade700)),
                                      onPressed: () {
                                        _launchURL(
                                            "https://github.com/Dhipin03/Dice_Roll");
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.github,
                                        color: Colors.grey.shade500,
                                      ))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(52),
                    height: 1800,
                    key: contactme,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21.0, top: 32),
                          child: Text(
                            "Contact Me",
                            style: TextStyle(
                                color: val ? Colors.white : Colors.black,
                                fontSize: 32),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        val ? Colors.black54 : Colors.white70,
                                  ),
                                  style: TextStyle(
                                      color: val ? Colors.white : Colors.black),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        val ? Colors.black54 : Colors.white70,
                                  ),
                                  style: TextStyle(
                                      color: val ? Colors.white : Colors.black),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    labelText: 'Message',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor:
                                        val ? Colors.black54 : Colors.white70,
                                  ),
                                  style: TextStyle(
                                      color: val ? Colors.white : Colors.black),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your message';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder()),
                                      foregroundColor:
                                          WidgetStatePropertyAll(Colors.white),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.grey.shade700)),
                                  onPressed: () {},
                                  child: Text('Submit'),
                                ),
                              ],
                            ),
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

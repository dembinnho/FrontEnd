import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location_front/search_field.dart';
import 'package:location_front/ui/location_page.dart';
import 'package:location_front/ui/login_page.dart';
import 'package:location_front/ui/sign_up_page.dart';
import 'package:location_front/utils/image_handler.dart';

import '../widgets/movie_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.isConnected = false, required this.token}) : super(key: key);
  final ImageHandler imageHandler = ImageHandler();
  final bool isConnected;
  final String token;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Locations',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200.0),
                    child: SearchField(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  SvgPicture.asset(
                    'question_mark.svg',
                    width: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Register: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage()));
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 10),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                                },
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 10),
                                )),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to Location',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Discover all locations and more',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage()));

                          /// TODO loginpage
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  LocationPage(isConnected: widget.isConnected, token: widget.token,))); // todo locationPage
                        },
                        child: const Text(
                          'Locations',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.1,
              color: const Color.fromRGBO(101, 190, 195, 1), // 101, 190, 195
              child: Row(),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Click on locations if you wish to see locations', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text('Investors:'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  PresentationTile(
                    title: 'ESILV',
                    picture: 'esilv.jpeg',
                  ),
                  PresentationTile(
                    title: 'Pole LDV',
                    picture: 'pole.png',
                  ),
                  PresentationTile(
                    title: 'Express Batiment',
                    picture: 'express.jpeg',
                  ),
                ]),
          ),
        ],
      ),
    ));
  }
}

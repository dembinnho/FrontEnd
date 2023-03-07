import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location_front/models/location.dart';
import 'package:location_front/search_field.dart';
import 'package:location_front/ui/add_location_page.dart';
import 'package:location_front/ui/login_page.dart';
import 'package:location_front/ui/sign_up_page.dart';
import 'package:location_front/utils/image_handler.dart';
import 'package:http/http.dart' as http;

class LocationTile extends StatelessWidget {
  const LocationTile({Key? key, required this.location}) : super(key: key);
  final Location location;
  Future<void> _showMyDialog({required BuildContext context, required Location location}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Détails'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                const Text('annee_tournage:'),
                Text(location.annee_tournage.toString()),
                const Text('type_tournage:'),
                Text(location.type_tournage),
                const Text('nom_producteur:'),
                Text(location.nom_producteur),
                const Text('adresse_lieu:'),
                Text(location.adresse_lieu),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showMyDialog(context: context, location: location);
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Film:'),
              Text(location.nom_tournage),
              const Text('Realisateur:'),
              Text(location.nom_realisateur),
              const Text('Lieu tournage:'),
              Text(location.adresse_lieu)
            ],
          ),
        ),
      ),
    );
  }
}


class LocationPage extends StatefulWidget {
  LocationPage({Key? key, this.isConnected = false, required this.token}) : super(key: key);
  final ImageHandler imageHandler = ImageHandler();
  final bool isConnected;
  final String token;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Future<List<dynamic>> getLocation() async {
    //get Url
    List<dynamic> locations = [];
    var response = await http.get(
      Uri.parse('https://secure-web-dev-backend-lwkp.onrender.com/locations?offset=0&limit=100'),
      headers: {
        'Authorization':
            'Bearer ${widget.token}'
      },
    );
    locations = jsonDecode(response.body);
    return locations;
  }

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
                      //if (admin)
                    /*  TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  AddLocationPage(token: widget.token)));
                        },
                        child: const Text(
                          'Add Location',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              decoration: TextDecoration.underline),
                        ),
                      ), */
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
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          widget.isConnected ?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Click on any location tile to obtain details"),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 200,
                  child: FutureBuilder<List<dynamic>>(
                    future: getLocation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none &&
                          snapshot.hasData == false) {
                        return const Text("no data", style: TextStyle(color: Colors.black),);
                      }
                      if (snapshot.data?.length == 0) {
                        return const Text("no data", style: TextStyle(color: Colors.black),);
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Scrollbar(
                          controller: ScrollController(initialScrollOffset: 0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              var loc = snapshot.data?[index];
                              if (snapshot.data?[index] != null) {
                                Location location = Location.fromJson(loc);
                                return LocationTile(location: location,);
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                      );
                    } ),
                ),
              ],
            ),
          ) :
          const Text('You need to be logged in to see locations'),
        ],
      ),
    ));
  }
}

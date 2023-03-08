import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location_front/models/location.dart';
import 'package:location_front/search_field.dart';
import 'package:location_front/ui/login_page.dart';
import 'package:location_front/ui/sign_up_page.dart';
import 'package:location_front/utils/image_handler.dart';
import 'package:http/http.dart' as http;


class AddLocationPage extends StatefulWidget {
  AddLocationPage({Key? key, required this.token}) : super(key: key);
  final ImageHandler imageHandler = ImageHandler();
  final String token;

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  final _formKey = GlobalKey<FormState>();

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
                      'Add Locations',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Add location to database"),
                const SizedBox(height: 20,),
                Form(
                 key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

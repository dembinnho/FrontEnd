import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location_front/ui/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:location_front/widgets/form_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String token = '';
  String snackBarMessage = '';
  final _formKey = GlobalKey<FormState>();

  final _userNameTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();

  final _focusPassword = FocusNode();

   bool _isProcessing = false;
  bool valueFirst = false;

  void clearForm() {
    setState(() {
      _userNameTextController.clear();
      _passwordTextController.clear();
    });
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Future<bool> logIn({
    required String userName,
    required String password,
  }) async {
    //get Url
    var response =
        await http.post(Uri.parse('https://secure-web-dev-backend-lwkp.onrender.com/users/login'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              "username": userName,
              "password": password,
            }));


    if (response.statusCode == 200) {
      snackBarMessage = 'Welcome !';
      token = jsonDecode(response.body)["jwt"];
      return true;
    }
    if(response.statusCode == 401) {
      snackBarMessage = 'Credentials are not valid';
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                        'Hello !',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            const Text(
                              'Welcome to Location',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            const Text(
                              'Discover all locations and more ..',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Row(
                      children: [
                        Image.network(
                          'https://www.esilv.fr/ecole-ingenieur/wp-content/uploads/2020/09/logo-esilv-b-150.png',
                          width: 55,

                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height * 0.001),
                      const Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height * 0.001),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        EmailFormField(
                            emailTextController: _userNameTextController,
                            focusEmail: _focusEmail),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        PasswordFormField(
                            passwordTextController: _passwordTextController,
                            focusPassword: _focusPassword),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.purpleAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              maximumSize: Size(
                                  MediaQuery.of(context).size.width * 0.2, 58),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.2, 58),
                            ),
                            onPressed: () async {
                              if (_userNameTextController.text.isEmpty) {
                                snackBarMessage = "Username is blank please fill in";
                                SnackBar snackBar =  SnackBar(content: Text(snackBarMessage));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                return;
                              }
                              if (_passwordTextController.text.isEmpty) {
                                snackBarMessage = "Password is blank please fill in";
                                SnackBar snackBar =  SnackBar(content: Text(snackBarMessage));

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                return;
                              }
                              setState(() {
                                _isProcessing = true;
                              });
                              if (await logIn(
                                password: _passwordTextController.text,
                                userName: _userNameTextController.text,
                              )) {
                                setState(() {
                                  _isProcessing = false;
                                });
                                SnackBar snackBar =  SnackBar(
                                    content: Text(
                                        snackBarMessage));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomePage(isConnected: true, token: token, )));
                              } else {
                                setState(() {
                                  _isProcessing = false;
                                });
                                SnackBar snackBar =  SnackBar(
                                    content: Text(
                                        snackBarMessage));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _isProcessing
                            ? const CircularProgressIndicator()
                            : Container()
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
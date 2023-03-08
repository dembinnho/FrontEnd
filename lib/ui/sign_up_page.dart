import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:location_front/ui/home_page.dart';
import 'package:location_front/ui/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:location_front/widgets/form_fields.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String snackBarMessage = '';
  bool _isProcessing = false;

  Future<bool> signIn({
    required String userName,
    required String password,
    required String role,
  }) async {
    var response =
        await http.post(Uri.parse('https://secure-web-dev-backend-lwkp.onrender.com/users/register'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              "username": userName,
              "password": password,
              "role": role
            }));
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      snackBarMessage = "Successfully signed in, register now !";
      //return Location.fromJson(jsonDecode(response.body));
      return true;
    }
    else {
      snackBarMessage = response.body;
      return false;

    }
  }

  String serverResponse = 'Server response';
  final _userNameTextController = TextEditingController();
  final _roleController = TextEditingController();

  final _passwordTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusRole = FocusNode();
  final _focusPassword = FocusNode();

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
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: TextButton(
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 16,
                                        color: Colors.blueAccent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const LoginPage()));
                                  },
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Want to try without an account ?",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height:
                            MediaQuery.of(context).size.height * 0.001,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: TextButton(
                                child: const Text(
                                  'Try it',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 16,
                                      color: Colors.blueAccent),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>  HomePage(token: 'token')));
                                },
                              )),
                        ],
                      )
                    ],
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
                          width: 100,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Image.asset('assets/esilv.jpeg', width: 55,),

                        Image.network(
                          'https://www.mondedesgrandesecoles.fr/wp-content/uploads/1-206.jpg',
                          width: 100,
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
                        'Sign up',
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
                        UserNameFormField(
                            userNameTextController: _userNameTextController,
                            focusUsername: _focusEmail),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        PasswordFormField(
                            passwordTextController: _passwordTextController,
                            focusPassword: _focusPassword),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        RoleNameFormField(
                            userNameTextController: _roleController,
                            focusUsername: _focusRole),
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
                              if (_roleController.text.isEmpty) {
                                snackBarMessage = "Role is blank please fill in";
                                SnackBar snackBar =  SnackBar(content: Text(snackBarMessage));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                return;
                              }
                              setState(() {
                                _isProcessing = true;
                              });
                              if (await signIn(
                                password: _passwordTextController.text,
                                userName: _userNameTextController.text,
                                role: _roleController.text
                              )) {
                                setState(() {
                                  _isProcessing = false;
                                });
                                SnackBar snackBar =  SnackBar(content: Text(snackBarMessage));

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                              }
                              else {
                                setState(() {
                                  _isProcessing = false;
                                });
                                SnackBar snackBar =  SnackBar(content: Text(snackBarMessage));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            },
                            child: const Text(
                              'Sign me up !',
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

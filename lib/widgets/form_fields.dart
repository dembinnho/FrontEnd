import 'package:flutter/material.dart';

class RoleNameFormField extends StatelessWidget {
  const RoleNameFormField({
    Key? key,
    required TextEditingController userNameTextController,
    required FocusNode focusUsername,
  })  : _emailTextController = userNameTextController,
        _focusEmail = focusUsername,
        super(key: key);

  final TextEditingController _emailTextController;
  final FocusNode _focusEmail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 58,
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: "role",
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        controller: _emailTextController,
        focusNode: _focusEmail,
      ),
    );
  }
}

class UserNameFormField extends StatelessWidget {
  const UserNameFormField({
    Key? key,
    required TextEditingController userNameTextController,
    required FocusNode focusUsername,
  })  : _emailTextController = userNameTextController,
        _focusEmail = focusUsername,
        super(key: key);

  final TextEditingController _emailTextController;
  final FocusNode _focusEmail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 58,
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: "username",
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        controller: _emailTextController,
        focusNode: _focusEmail,
      ),
    );
  }
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key? key,
    required TextEditingController passwordTextController,
    required FocusNode focusPassword,
  })  : _passwordTextController = passwordTextController,
        _focusPassword = focusPassword,
        super(key: key);

  final TextEditingController _passwordTextController;
  final FocusNode _focusPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 58,
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: 'password',
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        obscureText: true,
        controller: _passwordTextController,
        focusNode: _focusPassword,
      ),
    );
  }
}

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key? key,
    required TextEditingController emailTextController,
    required FocusNode focusEmail,
  })  : _emailTextController = emailTextController,
        _focusEmail = focusEmail,
        super(key: key);

  final TextEditingController _emailTextController;
  final FocusNode _focusEmail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 58,
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: "userName",
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        controller: _emailTextController,
        focusNode: _focusEmail,
      ),
    );
  }
}

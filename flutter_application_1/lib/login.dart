// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _errormessage = 'Please enter username and password as same';

  final _formkey = GlobalKey<FormState>();
  // ignore: unused_field
  final bool _isdatamatched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'User Name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid!! Please fill the username ';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Invalid!! Please fill the password  ';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 28),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  checklogin(context);
                                } else {
                                  // ignore: avoid_print

                                  // ignore: avoid_print
                                  print('Data empty!!');
                                }
                              },
                              icon: const Icon(Icons.check),
                              label: const Text('Login'),
                            ),
                          ),
                          Image.asset(
                            'lib/assets/images/login page.jpg',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void checklogin(BuildContext ctx) async {
    final _username = _usernameController.text;

    final _password = _passwordController.text;

    if (_username == _password) {
      // ignore: avoid_print
      print('Username password matched');

      //Alert Dilog

//GO to home
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      // ignore: avoid_print
      print('Username password doesnot match');
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('Username and password not matching!!'),
              content: Text(_errormessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          });
    }
  }
}

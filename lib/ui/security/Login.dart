import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:intellihealth/ui/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  bool _errorState = false;
  String _errorMessage = "";

  String email = "";
  String password = "";

  TextEditingController? _usernameController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  Future<void> login() async {
    // Aquí iría la lógica de autenticación
    // Ejemplo de autenticación simple para fines ilustrativos
    if (email == "admin@example.com" && password == "1234") {
      navigateTo(widget: const Home());
    } else {
      setState(() {
        _errorState = true;
        _errorMessage = "Email o contraseña incorrectos";
      });
    }
  }

  void navigateTo({required Widget widget}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        ((route) => false));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                height: 200,
                child: Image.asset(
                  'assets/Logo-IntelliHealth.png',
                  width: 450,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 40),
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _usernameController,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFF000000),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFF000000),
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(20),
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      obscureText: !_passwordVisible,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFF000000),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFF000000),
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(20),
                        isDense: true,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_errorState)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () async {
                  await login();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[700],
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
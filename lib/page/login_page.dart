import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";

  void _login(BuildContext context) {
    // Validasi inputan username dan password
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _usernameController.text == username &&
        _passwordController.text == password) {
      // Navigate ke halaman Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(username: _usernameController.text)),
      );
    } else {
      setState(() {
        _errorMessage = "Username atau password salah!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  'WELCOME TO BMI CALCULATOR',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Image.asset(
                  'assets/page1.jpg',
                  width: 400,
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 8.0),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Masuk'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum memiliki akun? '),
                  GestureDetector(
                    onTap: () {
                      // Navigate ke halaman Register
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

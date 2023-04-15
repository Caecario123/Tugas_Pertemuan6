import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

String username = "";
String password = "";

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isusernameValid = true;
  bool _isPasswordValid = true;

  void _register(BuildContext context) {
    // Validasi input username dan password
    if (_usernameController.text.isEmpty) {
      setState(() {
        _isusernameValid = false;
      });
    } else {
      setState(() {
        _isusernameValid = true;
      });
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _isPasswordValid = false;
      });
    } else {
      setState(() {
        _isPasswordValid = true;
      });
    }

    // Jika semua input valid, simpan data username dan password ke dalam variabel global
    if (_isusernameValid && _isPasswordValid) {
      username = _usernameController.text;
      password = _passwordController.text;

      // Navigate ke halaman Login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
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
                  'DAFTAR',
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
                  errorText:
                      _isusernameValid ? null : 'username tidak boleh kosong',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  errorText:
                      _isPasswordValid ? null : 'Password tidak boleh kosong',
                ),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () => _register(context),
                child: Text('Daftar'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah memiliki akun! '),
                  GestureDetector(
                    onTap: () {
                      // Navigate ke halaman Login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Masuk',
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

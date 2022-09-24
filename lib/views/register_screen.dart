import 'dart:io';

import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../utils/snackbar_show.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widht = MediaQuery.of(context).size.width;
    AuthProvider _authProvider = Provider.of<AuthProvider>(context, listen: false);

    void registerHandler() async {
      var fullname = _fullnameController.text.toString();
      var email = _emailController.text.toString();
      var password = _passwordController.text.toString();
      var confirmPassword = _confirmPasswordController.text.toString();
      var username = _usernameController.text.toString();
      if(fullname.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || username.isEmpty){
        snackBarShow("Form tidak boleh kosong", context);
      }else if(password.length < 8){
        snackBarShow("Jumlah karakter password tidak boleh dibawah 8", context);
      }else{
        if(password == confirmPassword){
          var result = await _authProvider.register(
            name: fullname,
            email: email,
            username: username,
            password: password,
          );
          if(result){
            Navigator.pushNamed(context, '/login');
          }else{
            snackBarShow("Gagal mendaftar", context);
          }
        }else{
          snackBarShow("Password tidak sama", context);
        }
      }
    }

    Widget body() {
      return Consumer<AuthProvider>(builder: (context, authProvider,_){
        return ListView(
          children: [

            const SizedBox(
              height: 20,
            ),
            //title
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Registrasi',
                  style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 18,
                      color: Colors.white
                  ),
                )
              ],
            ),

            //Form
            Container(
              margin: const EdgeInsets.only(
                top: 48,
                bottom: 20,
                right: 25,
                left: 25,
              ),
              child: Column(
                children: [
                  //fullname
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Lengkap',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        decoration: BoxDecoration(
                            color: backgroundColor2, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _fullnameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Nama Lengkap',
                                    hintStyle: primaryTextStyle.copyWith(
                                      color: secondaryTextColor,
                                      fontWeight: regular,
                                    )),
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  //email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        decoration: BoxDecoration(
                            color: backgroundColor2, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Email',
                                    hintStyle: primaryTextStyle.copyWith(
                                      color: secondaryTextColor,
                                      fontWeight: regular,
                                    )),
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  //username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        decoration: BoxDecoration(
                            color: backgroundColor2, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _usernameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Username',
                                    hintStyle: primaryTextStyle.copyWith(
                                      color: secondaryTextColor,
                                      fontWeight: regular,
                                    )),
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  //password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        decoration: BoxDecoration(
                            color: backgroundColor2, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _passwordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Password',
                                    hintStyle: primaryTextStyle.copyWith(
                                      color: secondaryTextColor,
                                      fontWeight: regular,
                                    )),
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  //confirm password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Konfirmasi Password',
                        style: primaryTextStyle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                        decoration: BoxDecoration(
                            color: backgroundColor2, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _confirmPasswordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Konfirmasi Password',
                                    hintStyle: primaryTextStyle.copyWith(
                                      color: secondaryTextColor,
                                      fontWeight: regular,
                                    )),
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),


                ],
              ),
            ),

            //Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 86),
              child: authProvider.isLoading ? Center(child: CircularProgressIndicator(),):
              TextButton(
                onPressed: () {
                  registerHandler();
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 57, vertical: 9),
                  child: Text(
                    'Daftar',
                    style: primaryTextStyle.copyWith(
                        color: Colors.white, fontWeight: medium, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),

            //Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: primaryTextStyle.copyWith(fontWeight: regular, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Masuk',
                    style: primaryTextStyle.copyWith(
                      color: primaryColor,
                      fontWeight: semiBold,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      });

    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          toolbarHeight: 70,
          backgroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Register",
            style: primaryTextStyle.copyWith(
                fontSize: 16, color: Colors.white, fontWeight: medium),
          ),
        ),
      ),
      body: body(),
    );
  }
}

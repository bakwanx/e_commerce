import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../utils/snackbar_show.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController(text: '');
  TextEditingController _passwordController = TextEditingController(text: '');
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    void handleSignIn() async {
      setState((){
        _isLoading = true;
      });
      var result = await authProvider.login(
          email: _emailController.text,
          password: _passwordController.text
      );

      if(result){
        Navigator.pushNamed(context, '/main-screen');
        setState((){
          _isLoading = false;
        });
      }else{
        snackBarShow("Gagal login", context);
        setState((){
          _isLoading = false;
        });

      }
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(left: 22, top: height * 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: primaryTextStyle.copyWith(
                  color: primaryColor, fontWeight: semiBold, fontSize: 32),
            ),
            Text(
              'Aplikasi E-Shoes',
              style: primaryTextStyle.copyWith(
                  color: primaryTextColor, fontWeight: regular, fontSize: 16),
            )
          ],
        ),
      );
    }

    Widget form() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //email
            Container(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
              decoration: BoxDecoration(
                  color: backgroundColor6, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Email',
                          hintStyle: primaryTextStyle.copyWith(
                            color: primaryTextColor,
                            fontWeight: regular,
                          )),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            //password
            Container(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
              decoration: BoxDecoration(
                  color: backgroundColor6, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Password',
                            hintStyle: primaryTextStyle.copyWith(
                                color: primaryTextColor,
                                fontWeight: regular)
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget btnLogin() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 86),
        child: !_isLoading ? TextButton(
          onPressed: handleSignIn,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 9),
            child: Text(
              'Masuk',
              style: primaryTextStyle.copyWith(
                  color: Colors.white, fontWeight: medium, fontSize: 16),
            ),
          ),
        ) : const Center(child: CircularProgressIndicator()),
      );
    }

    Widget btnRegis() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum punya akun? ',
            style: primaryTextStyle.copyWith(fontWeight: regular, fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Daftar',
              style: primaryTextStyle.copyWith(
                color: primaryColor,
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          //background and title
          title(),

          const SizedBox(
            height: 40,
          ),
          //form
          form(),
          const SizedBox(
            height: 62,
          ),
          //button
          btnLogin(),
          const SizedBox(
            height: 9,
          ),
          //btnRegis
          btnRegis()
        ],
      ),
    );
  }

}

import 'package:easytrip/theme/app_color.dart';
import 'package:easytrip/view/auth/forgot/forgot_pass_page.dart';
import 'package:easytrip/view/auth/register/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;
  bool? rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: Image.asset(
                'assets/small_logo_black.png',
                width: MediaQuery.sizeOf(context).width * 0.5,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColor.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.grey)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColor.yellow,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: showPassword,
              obscuringCharacter: '•',
              // style: TextStyle(fontSize: 30),
              // scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: AppColor.grey),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Image.asset(
                        !showPassword
                            ? 'assets/eye.png'
                            : 'assets/eye_slash.png',
                      )),
                ),
                suffixIconConstraints:
                    BoxConstraints(maxHeight: 40, maxWidth: 40),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColor.grey)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColor.yellow,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    child: ListTileTheme(
                      horizontalTitleGap: 0,
                      child: CheckboxListTile(
                        side: BorderSide(color: AppColor.grey, width: 1.5),
                        title: Text("Remember me",
                            style: TextStyle(
                                color: AppColor.grey,
                                fontWeight: FontWeight.w700)),
                        value: rememberMe,
                        activeColor: AppColor.yellow,
                        dense: true,

                        contentPadding: EdgeInsets.zero,
                        onChanged: (newValue) {
                          setState(() {
                            rememberMe = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassPage()));
                    },
                    child: Text('Forgot Password',
                        style: TextStyle(
                            color: AppColor.grey, fontWeight: FontWeight.w700)),
                  )
                ],
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              child: Text('Create Account'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: AppColor.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

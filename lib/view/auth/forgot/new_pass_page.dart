import 'package:easytrip/theme/app_color.dart';
import 'package:easytrip/theme/textTheme.dart';
import 'package:flutter/material.dart';

class NewPassPage extends StatefulWidget {
  const NewPassPage({super.key});

  @override
  State<NewPassPage> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
  bool showPassword = true;
  bool showNewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forgot Password', style: myTheme.textTheme.titleMedium),
                  SizedBox(height: 8),
                  Text(
                    'Create New Password',
                    style: myTheme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 56),
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
                  SizedBox(height: 24),
                  TextFormField(
                    obscureText: showNewPassword,
                    obscuringCharacter: '•',
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      labelStyle: TextStyle(color: AppColor.grey),
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                showNewPassword = !showNewPassword;
                              });
                            },
                            child: Image.asset(
                              !showNewPassword
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
                  SizedBox(height: 20),
                  Text("your password must include at least one symbol and be 8 or more characters long.",
                      style: myTheme.textTheme.labelMedium),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                foregroundColor: Colors.black,
                backgroundColor: AppColor.yellow,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

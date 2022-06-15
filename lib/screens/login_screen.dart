import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instgram_clone/responsive/mobile_screen_layout.dart';
import 'package:instgram_clone/responsive/responsive_layout_screen.dart';
import 'package:instgram_clone/responsive/web_screen_layout.dart';
import 'package:instgram_clone/utils/colors.dart';
import 'package:instgram_clone/widgets/text_field.dart';
import 'package:instgram_clone/resources/auth_methods.dart';
import 'package:instgram_clone/utils/utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
  }

  void navigateToSignUp() {
    Navigator.pushNamed(context, '/signUp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //logo
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              //textfield for email
              TextFieldInput(
                  controller: _emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24.0,
              ),
              //textfield for password
              TextFieldInput(
                controller: _passController,
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              //button for signIn
              InkWell(
                onTap: loginUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text("log in"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  //button for signUp
                  GestureDetector(
                    onTap: navigateToSignUp,
                    child: Container(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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

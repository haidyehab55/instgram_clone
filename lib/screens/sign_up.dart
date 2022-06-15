import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instgram_clone/responsive/mobile_screen_layout.dart';
import 'package:instgram_clone/responsive/responsive_layout_screen.dart';
import 'package:instgram_clone/responsive/web_screen_layout.dart';
import 'package:instgram_clone/utils/utils.dart';
import '../utils/colors.dart';
import '../widgets/text_field.dart';
import 'package:instgram_clone/resources/auth_methods.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      name: _userNameController.text,
      email: _emailController.text,
      password: _passController.text,
      bio: _bioController.text,
      file: _image!,
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

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void navigateToLogIn() {
    Navigator.pushNamed(context, '/login');
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
              Stack(
                children: <Widget>[
                  _image != null
                      ?
                      // picture of the user
                      CircleAvatar(
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: Colors.red,
                          radius: 64.0,
                        )
                      : const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://i.stack.imgur.com/l60Hf.png"),
                          backgroundColor: Colors.red,
                          radius: 64.0,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              //text field for user name
              TextFieldInput(
                  controller: _userNameController,
                  hintText: "Enter your name",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 24.0,
              ),
              //text field for bio information
              TextFieldInput(
                  controller: _bioController,
                  hintText: "Enter your information",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 24.0,
              ),
              //text field for email
              TextFieldInput(
                  controller: _emailController,
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24.0,
              ),
              //text field for password
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
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text("Sign Up"),
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
                    child: const Text("Already have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  //button for signUp
                  GestureDetector(
                    onTap: navigateToLogIn,
                    child: Container(
                      child: const Text(
                        "Log In",
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

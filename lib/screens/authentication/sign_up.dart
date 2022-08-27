import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './login.dart';
import '../main/navbar.dart';
import '../../shared/widgets/button.dart';
import '../../shared/widgets/form_field.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/dimensions.dart';
import '../../shared/constants/text_styles.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: Kdimensions.paddingAll,
        color: Kcolors.background,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: Kdimensions.paddingAll,
                child: Text(
                  "Sign up",
                  style: KtextStyle.headline,
                ),
              ),
              Kdimensions.verticleSpacing,
              Form(
                key: formKey,
                child: Column(
                  children: [
                    KformField(
                      controller: name,
                      cursorColor: Kcolors.primary,
                      hintText: "Enter your Name here",
                      label: const Text("Name"),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.user,
                        color: Kcolors.primary,
                      ),
                      fillColor: Kcolors.dark,
                      filled: true,
                    ),
                    Kdimensions.verticleSpacing,
                    KformField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Example@Mail.com",
                      label: const Text("Email"),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.envelope,
                        color: Kcolors.primary,
                      ),
                      fillColor: Kcolors.dark,
                      filled: true,
                      validator: (text) => text == null || text.isEmpty
                          ? 'Email can\'t be empty'
                          : !EmailValidator.validate(text)
                              ? 'Enter Valid Email'
                              : null,
                    ),
                    Kdimensions.verticleSpacing,
                    KformField(
                      controller: password,
                      obscureText: true,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.lock,
                        color: Kcolors.primary,
                      ),
                      hintText: "Enter your password",
                      label: const Text("Password"),
                      fillColor: Kcolors.dark,
                      filled: true,
                      validator: (value) => value!.isEmpty
                          ? "Password must not be Empty"
                          : value.length < 8
                              ? "Password must be at least 8 character"
                              : null,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                      ), //TODO:To be removed
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                  ),
                  const Icon(
                    FontAwesomeIcons.arrowRightLong,
                  ),
                ],
              ),
              Kdimensions.verticleSpacing,
              Kbutton(
                text: 'Sign Up',
                onPressed: () {
                  formKey.currentState!.validate()
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NavBar();
                            },
                          ),
                        )
                      : print("can not validate the form");
                },
              ),
              const Spacer(),
              const Center(
                child: Text("Or sign up with social account"),
              ),
              Kdimensions.verticleSpacing,
              Row(
                //TODO:To be changed
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 92,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/icons/Google.svg"),
                      ),
                    ),
                  ),
                  Kdimensions.horizontalSpacing,
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 92,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/icons/Facebook.svg"),
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

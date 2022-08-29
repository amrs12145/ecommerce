import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';

import './forget_password.dart';
import '../main/navbar.dart';
import '../../shared/widgets/button.dart';
import '../../shared/widgets/form_field.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/dimensions.dart';
import '../../shared/constants/text_styles.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Kcolors.background,
      body: Padding(
        padding: Kdimensions.paddingAll,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: KtextStyle.headline,
              ),
              Kdimensions.verticleSpacing,
              Form(
                key: formKey,
                child: Column(
                  children: [
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
                      "Forget your password?", //TODO:To be removed
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ),
                      );
                    },
                  ),
                  const Icon(FontAwesomeIcons.arrowRightLong),
                ],
              ),
              Kdimensions.verticleSpacing,
              Kbutton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBar(),
                      ),
                    );
                  }),
              const Spacer(),
              const Center(
                child: Text("Or login with social account"),
              ),
              Kdimensions.verticleSpacing,
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0, top: 8),
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

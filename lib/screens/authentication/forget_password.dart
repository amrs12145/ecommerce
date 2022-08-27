import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';

import '../../shared/widgets/button.dart';
import '../../shared/widgets/form_field.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/dimensions.dart';
import '../../shared/constants/text_styles.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

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
              const Text(
                "Forget Password",
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
                  ],
                ),
              ),
              Kdimensions.verticleSpacing,
              Kbutton(
                text: 'Send',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

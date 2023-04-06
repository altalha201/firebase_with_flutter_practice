import 'package:firebase_with_flutter_practice/UI/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/text_styles.dart';
import '../utility/ui_utility.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/dual_text_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailET = TextEditingController();
  final TextEditingController _firstNameET = TextEditingController();
  final TextEditingController _lastNameET = TextEditingController();
  final TextEditingController _passET = TextEditingController();
  final GlobalKey<FormState> _createKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _createKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Join With Us", style: titleStyle(),),
                    const SizedBox(height: 32.0,),
                    AppTextField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Enter Your First Name";
                          }
                          return null;
                        },
                        hint: "First Name",
                        controller: _firstNameET
                    ),
                    const SizedBox(height: 16.0,),
                    AppTextField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Enter Your Last Name";
                          }
                          return null;
                        },
                        hint: "Last Name",
                        controller: _lastNameET
                    ),
                    const SizedBox(height: 16.0,),
                    AppTextField(
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter Your Email";
                        }
                        return null;
                      },
                      hint: "Email",
                      controller: _emailET
                    ),
                    const SizedBox(height: 16.0,),
                    AppTextField(
                        validator: (value) {
                          if ((value?.isEmpty ?? true) || ((value?.length ?? 0) < 8)) {
                            return "Enter Password with 8 or more characters";
                          }
                          return null;
                        },
                        obscureText: true,
                        hint: "Password",
                        controller: _passET
                    ),
                    const SizedBox(height: 32.0,),
                    AppElevatedButton(
                        onTap: () {

                        },
                        child: UIUtility.proceedIcon
                    ),
                    const SizedBox(height: 48.0,),
                    DualTextWidget(
                        onTap: () {
                          Get.back();
                        },
                        question: "Have an account?",
                        todo: "Log In"
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_with_flutter_practice/ui/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/text_styles.dart';
import '../utility/ui_utility.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/background.dart';
import '../widgets/dual_text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailET = TextEditingController();
  final TextEditingController _passET = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Start With", style: titleStyle(),),
                const SizedBox(height: 32.0,),
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
                GetBuilder<LoginController>(builder: (controller) {
                  return AppElevatedButton(
                      onTap: () async {
                        if (_loginKey.currentState!.validate()) {
                          var result = await controller.login(_emailET.text.trim(), _passET.text);
                          if (result) {
                            Get.offAllNamed("/home");
                          }
                        }
                      },
                      child: controller.inProgress
                            ? UIUtility.whiteProgress()
                            : UIUtility.proceedIcon
                  );
                }),
                const SizedBox(height: 48.0,),
                DualTextWidget(
                  onTap: () {
                    Get.toNamed("/create");
                  },
                  question: "Have no account?",
                  todo: "Create Account"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

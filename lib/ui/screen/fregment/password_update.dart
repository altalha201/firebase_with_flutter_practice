import 'package:firebase_with_flutter_practice/UI/widgets/app_elevated_button.dart';
import 'package:firebase_with_flutter_practice/UI/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          AppTextField(hint: "New Password", controller: TextEditingController()),
          const SizedBox(height: 16.0,),
          AppTextField(
              hint: "Confirm Password",
              controller: TextEditingController()
          ),
          const SizedBox(height: 32.0,),
          AppElevatedButton(onTap: () {}, child: const Text("Update Password"))
        ],
      ),
    );
  }
}

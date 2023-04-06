import 'package:firebase_with_flutter_practice/UI/utility/application_colors.dart';
import 'package:firebase_with_flutter_practice/UI/widgets/app_elevated_button.dart';
import 'package:firebase_with_flutter_practice/UI/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {

              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: ApplicationColor.colorBlue,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Text("Photo", style: TextStyle(color: ApplicationColor.colorWhite),),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ApplicationColor.colorWhite,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: const Text("", style: TextStyle(overflow: TextOverflow.ellipsis))
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16.0,),
            AppTextField(
              hint: "Email",
              controller: TextEditingController(),
              readOnly: true,
            ),
            const SizedBox(height: 16.0,),
            AppTextField(
              hint: "First Name",
              controller: TextEditingController()
            ),
            const SizedBox(height: 16.0,),
            AppTextField(
                hint: "Last Name",
                controller: TextEditingController()
            ),
            const SizedBox(height: 32.0,),
            AppElevatedButton(onTap: () {}, child: const Text("Update Info"))
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/theme_data.dart';
import 'package:isports/team/about_team.dart';

class TeamProfile extends StatefulWidget {
  const TeamProfile({super.key});

  @override
  State<TeamProfile> createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProfileCreationHeader(
                title: 'Set up profile',
                subtitle:
                    'Personalize your profile to unlock a tailored sports experience!'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Icon(
                    Icons.person_outline,
                    size: 40,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getLabel("Team Name*"),
                    SizedBox(height: 8), // Small gap before input
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Team Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Team name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    getLabel("Email(Optional)"),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),

                    getLabel("Mobile Number"),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _mobileController,
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16),

                    PrimaryButton(
                      text: 'Next',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(() => AboutTeam());
                        }
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

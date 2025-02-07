import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isports/organiser/personal_info.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/theme_data.dart';

class OrganizerCreateAccount extends StatefulWidget {
  const OrganizerCreateAccount({super.key});

  @override
  State<OrganizerCreateAccount> createState() => _OrganizerCreateAccountState();
}

class _OrganizerCreateAccountState extends State<OrganizerCreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
                      getLabel("Name of Organisation*"),
                      SizedBox(height: 8), // Small gap before input
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Organisation Name",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your full name";
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

                      getLabel("Role in the Organisation*"),
                      SizedBox(height: 8), // Small gap before input
                      TextFormField(
                        controller: _roleController,
                        decoration: InputDecoration(
                          hintText: "Role",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Role";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      getLabel("Organisation Website(Optional)"),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _urlController,
                        decoration: InputDecoration(
                          hintText: "Website URL",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),

                      getLabel("Years Of Experience*"),
                      SizedBox(height: 8), // Small gap before input
                      DropdownMenu(
                          inputDecorationTheme: const InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          width: double.infinity,
                          trailingIcon: Icon(Icons.arrow_drop_down_sharp),
                          label: Text('Select'),
                          dropdownMenuEntries: []),
                      SizedBox(height: 16),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                text: 'Next',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(() => OrganizerPersonalInfo());
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

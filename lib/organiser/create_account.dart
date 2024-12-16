import 'package:flutter/material.dart';
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
                      color: secondaryColor,
                    ),
                    child: Icon(
                      Icons.person_outline,
                      size: 40,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              getLabel('Name of Organization*'),
              SizedBox(
                height: 8,
              ),
              TextField(decoration: getInputDecoration('Organization name')),
              SizedBox(
                height: 16,
              ),
              getLabel('Email (Optional)'),
              SizedBox(
                height: 8,
              ),
              TextField(decoration: getInputDecoration('Email')),
              SizedBox(
                height: 16,
              ),
              getLabel('Mobile Number'),
              SizedBox(
                height: 8,
              ),
              TextField(decoration: getInputDecoration('Mobile Number')),
              SizedBox(
                height: 16,
              ),
              getLabel('Role in the Organization*'),
              SizedBox(
                height: 8,
              ),
              TextField(decoration: getInputDecoration('Role')),
              SizedBox(
                height: 16,
              ),
              getLabel('Organization Website (optional)'),
              SizedBox(
                height: 8,
              ),
              TextField(decoration: getInputDecoration('Website URL')),
              SizedBox(
                height: 16,
              ),
              getLabel('Years of Experience*'),
              SizedBox(
                height: 8,
              ),
              DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  width: double.infinity,
                  trailingIcon: Icon(Icons.arrow_drop_down_sharp),
                  label: Text('Select'),
                  dropdownMenuEntries: []),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrganizerPersonalInfo(),
                        ));
                  }),
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

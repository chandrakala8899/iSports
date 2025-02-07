import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isports/player/select_sport.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/theme_data.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String? _selectedGender = 'Male';

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

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
                        shape: BoxShape.circle, color: Colors.grey[300]),
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
                    getLabel("Full Name*"),
                    SizedBox(height: 8), // Small gap before input
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Full Name",
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
                    getLabel("Date Of Birth"),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _dobController,
                      decoration: InputDecoration(
                        hintText: "DD-MM-YYYY",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your date of birth";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    getLabel("Gender*"),
                    SizedBox(height: 8), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text("Male"),
                          ],
                        ),
                        SizedBox(width: 16), 
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text("Female"),
                          ],
                        ),
                        SizedBox(width: 16), 
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Others',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text("Others"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    getLabel("Tell Us about yourself*"),
                    SizedBox(height: 8),
                    TextFormField(
                      maxLines:
                          5, // Allows multiple lines (5 lines in this case)
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Adds a border
                        contentPadding:
                            EdgeInsets.all(12), // Adds padding inside the field
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    getLabel("Country*"),
                    SizedBox(height: 8),
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
                      height: 16,
                    ),

                    getLabel("City"),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "City",
                        border: OutlineInputBorder(),
                      ),
                      
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: 16),
              PrimaryButton(
                text: 'Next',
                onTap: () {
                  if(_formKey.currentState!.validate()){
                    Get.to(()=> SelectSport());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

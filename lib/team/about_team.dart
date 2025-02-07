import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isports/shared/commonWidgets.dart';

import '../shared/constants.dart';
import '../shared/primary_button.dart';
import '../shared/selection_item_chip.dart';
import 'more_about_team.dart';

class AboutTeam extends StatefulWidget {
  const AboutTeam({super.key});

  @override
  State<AboutTeam> createState() => _AboutTeamState();
}

class _AboutTeamState extends State<AboutTeam> {
  final _formKey = GlobalKey<FormState>();
  List<SportType> sportTypes = [];
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
                  title: 'Set Up Your Profile',
                  subtitle: 'Personalize your profile'),
              SizedBox(
                height: 12,
              ),
              _buildSportsForm(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffE8F0FE)),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getLabel("Team Type*"),
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

                        getLabel("Age Group*"),
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

                        getLabel("Team Size*"),
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

                        getLabel("About Team*"),
                        SizedBox(height: 8),
                        TextFormField(
                          maxLines:
                              8, // Allows multiple lines (5 lines in this case)
                          decoration: InputDecoration(
                            border: OutlineInputBorder(), // Adds a border
                            contentPadding: EdgeInsets.all(
                                12), // Adds padding inside the field
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        PrimaryButton(
                          text: 'Next',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(() => MoreAboutTeam());
                            }
                          },
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSportsForm() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffE8F0FE)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel('Choose the sports*'),
            Wrap(
              children: [
                SelectionItemChip(
                    label: 'Cricket',
                    onTap: () => toggleSportType(SportType.cricket),
                    isSelected: sportTypes.contains(SportType.cricket)),
                SelectionItemChip(
                    label: 'Football',
                    onTap: () => toggleSportType(SportType.football),
                    isSelected: sportTypes.contains(SportType.football)),
                SelectionItemChip(
                    label: 'Badminton',
                    onTap: () => toggleSportType(SportType.badminton),
                    isSelected: sportTypes.contains(SportType.badminton)),
                SelectionItemChip(
                    label: 'Kabaddi',
                    onTap: () => toggleSportType(SportType.kabaddi),
                    isSelected: sportTypes.contains(SportType.kabaddi)),
                SelectionItemChip(
                    label: 'Hockey',
                    onTap: () => toggleSportType(SportType.hockey),
                    isSelected: sportTypes.contains(SportType.hockey)),
                SelectionItemChip(
                    label: 'Basketball',
                    onTap: () => toggleSportType(SportType.basketball),
                    isSelected: sportTypes.contains(SportType.basketball)),
                SelectionItemChip(
                    label: 'Chess',
                    onTap: () => toggleSportType(SportType.chess),
                    isSelected: sportTypes.contains(SportType.chess)),
                SelectionItemChip(
                    label: 'Table Tennis',
                    onTap: () => toggleSportType(SportType.tableTennis),
                    isSelected: sportTypes.contains(SportType.tableTennis)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toggleSportType(SportType type) {
    setState(() {
      if (sportTypes.contains(type)) {
        sportTypes.remove(type);
      } else {
        sportTypes.add(type);
      }
    });
  }
}

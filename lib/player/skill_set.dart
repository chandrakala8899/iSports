import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/secondary_button.dart';
import 'package:isports/shared/selection_item_chip.dart';
import 'package:isports/shared/theme_data.dart';

import '../shared/constants.dart';
import 'player_privacy_settings.dart';

class SkillSet extends StatefulWidget {
  const SkillSet({super.key});

  @override
  State<SkillSet> createState() => _SkillSetState();
}

class _SkillSetState extends State<SkillSet> {
  bool addSecondaryRole = false;
  RoleType roleType = RoleType.player;
  ExperienceLevel experienceLevel = ExperienceLevel.beginner;
  CoachingLevel coachingLevel = CoachingLevel.junior;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                getProfileCreationHeader(
                    title: 'Showcase Your Skills and Set Your Game!',
                    subtitle:
                        'Define your expertise and set your rate for each sport to get matched with the right opportunities.'),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffE8F0FE)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cricket',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                        SizedBox(height: 16),
                        getLabel('Primary Role*'),
                        SizedBox(height: 8),
                        Wrap(
                          children: [
                            SelectionItemChip(
                                label: 'Player',
                                onTap: () => setRoleType(RoleType.player),
                                isSelected: roleType == RoleType.player),
                            SelectionItemChip(
                                label: 'Coach',
                                onTap: () => setRoleType(RoleType.coach),
                                isSelected: roleType == RoleType.coach),
                          ],
                        ),
                        SizedBox(height: 16),
                        getLabel('Position*'),
                        SizedBox(height: 8),
                        DropdownMenu(
                            inputDecorationTheme: const InputDecorationTheme(
                              filled: true,
                              fillColor: Colors.white,
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
                        getLabel('Secondary Position*'),
                        SizedBox(height: 8),
                        DropdownMenu(
                            inputDecorationTheme: const InputDecorationTheme(
                              filled: true,
                              fillColor: Colors.white,
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
                        getLabel('Select your experience level*'),
                        SizedBox(height: 8),
                        Wrap(
                          children: [
                            SelectionItemChip(
                                label: 'Beginner',
                                onTap: () => setExperienceLevel(
                                    ExperienceLevel.beginner),
                                isSelected: experienceLevel ==
                                    ExperienceLevel.beginner),
                            SelectionItemChip(
                                label: 'Intermediate',
                                onTap: () => setExperienceLevel(
                                    ExperienceLevel.intermediate),
                                isSelected: experienceLevel ==
                                    ExperienceLevel.intermediate),
                            SelectionItemChip(
                                label: 'Advanced',
                                onTap: () => setExperienceLevel(
                                    ExperienceLevel.advanced),
                                isSelected: experienceLevel ==
                                    ExperienceLevel.advanced),
                          ],
                        ),
                        SizedBox(height: 16),
                        getLabel('Team (if your team is already registered)'),
                        SizedBox(height: 8),
                        DropdownMenu(
                            inputDecorationTheme: const InputDecorationTheme(
                              filled: true,
                              fillColor: Colors.white,
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
                        getLabel('Mention your rate card details*'),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: getDropDownBox('Hourly')),
                            SizedBox(width: 8),
                            Expanded(child: getDropDownBox('500')),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: getDropDownBox('Monthly')),
                            SizedBox(width: 8),
                            Expanded(child: getDropDownBox('5000')),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: getDropDownBox('Type')),
                            SizedBox(width: 8),
                            Expanded(child: getDropDownBox('Price')),
                          ],
                        ),
                        SizedBox(height: 8),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              '+ Add More',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (!addSecondaryRole)
                  SecondaryButton(
                      text: 'Add Secondary Role',
                      onTap: () {
                        setState(() {
                          addSecondaryRole = true;
                        });
                      }),
                if (addSecondaryRole) getSecondaryRoleWidget(),
                SizedBox(height: 30),
                PrimaryButton(
                    text: 'Next', onTap: () => Get.to(() => PlayerPrivacySettings())),
                SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }

  Widget getDropDownBox(String value) {
    return DropdownMenu(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        width: double.infinity,
        trailingIcon: Icon(Icons.arrow_drop_down_sharp),
        label: Text(value),
        dropdownMenuEntries: []);
  }

  Widget getSecondaryRoleWidget() {
    return Stack(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xffE8F0FE)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getLabel('Secondary Role*'),
              SizedBox(height: 8),
              Wrap(
                children: [
                  SelectionItemChip(
                      label: 'Player',
                      onTap: () => setRoleType(RoleType.player),
                      isSelected: roleType == RoleType.player),
                  SelectionItemChip(
                      label: 'Coach',
                      onTap: () => setRoleType(RoleType.coach),
                      isSelected: roleType == RoleType.coach),
                ],
              ),
              SizedBox(height: 16),
              getLabel('Specialization*'),
              SizedBox(height: 8),
              DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  width: double.infinity,
                  trailingIcon: Icon(Icons.arrow_drop_down_sharp),
                  label: Text('Select'),
                  dropdownMenuEntries: []),
              SizedBox(height: 16),
              getLabel('Years of Experience*'),
              SizedBox(height: 8),
              DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  width: double.infinity,
                  trailingIcon: Icon(Icons.arrow_drop_down_sharp),
                  label: Text('Select'),
                  dropdownMenuEntries: []),
              SizedBox(height: 16),
              getLabel('Level of coaching*'),
              SizedBox(height: 8),
              Wrap(
                children: [
                  SelectionItemChip(
                      label: 'Junior',
                      onTap: () => setCoachingLevel(CoachingLevel.junior),
                      isSelected: coachingLevel == CoachingLevel.junior),
                  SelectionItemChip(
                      label: 'Intermediate',
                      onTap: () => setCoachingLevel(CoachingLevel.intermediate),
                      isSelected: coachingLevel == CoachingLevel.intermediate),
                  SelectionItemChip(
                      label: 'Professional',
                      onTap: () => setCoachingLevel(CoachingLevel.professional),
                      isSelected: coachingLevel == CoachingLevel.professional),
                ],
              ),
              SizedBox(height: 16),
              getLabel('Team (if your team is already registered)'),
              SizedBox(height: 8),
              DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  width: double.infinity,
                  trailingIcon: Icon(Icons.arrow_drop_down_sharp),
                  label: Text('Select'),
                  dropdownMenuEntries: []),
              SizedBox(height: 16),
              getLabel('Specialized Skills*'),
              SizedBox(height: 8),
              TextField(
                maxLines: 5,
                decoration: getInputDecoration(''),
              ),
              SizedBox(height: 16),
              getLabel('Mention your rate card details*'),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: getDropDownBox('Hourly')),
                  SizedBox(width: 8),
                  Expanded(child: getDropDownBox('500')),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: getDropDownBox('Monthly')),
                  SizedBox(width: 8),
                  Expanded(child: getDropDownBox('5000')),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: getDropDownBox('Type')),
                  SizedBox(width: 8),
                  Expanded(child: getDropDownBox('Price')),
                ],
              ),
              SizedBox(height: 8),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '+ Add More',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primaryColor),
                  )),
              SizedBox(height: 16),
              getLabel('Coaching License*'),
              SizedBox(height: 8),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: PrimaryButton(
                    text: 'Upload',
                    onTap: () {},
                    borderRadius: 30,
                  )),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
      //position icon top right
      Positioned(
        top: 8,
        right: 9,
        child: IconButton(
            onPressed: () {
              setState(() {
                addSecondaryRole = false;
              });
            },
            icon: Icon(Icons.delete_outline_outlined,
                color: Colors.red, size: 24)),
      ),
    ]);
  }

  void setRoleType(RoleType type) {
    setState(() {
      roleType = type;
    });
  }

  void setExperienceLevel(ExperienceLevel type) {
    setState(() {
      experienceLevel = type;
    });
  }

  void setCoachingLevel(CoachingLevel type) {
    setState(() {
      coachingLevel = type;
    });
  }
}

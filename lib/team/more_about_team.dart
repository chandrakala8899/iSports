import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../organiser/privacy_settings.dart';
import '../shared/commonWidgets.dart';
import '../shared/constants.dart';
import '../shared/primary_button.dart';
import '../shared/selection_item_chip.dart';
import '../shared/theme_data.dart';

class MoreAboutTeam extends StatefulWidget {
  const MoreAboutTeam({super.key});

  @override
  State<MoreAboutTeam> createState() => _MoreAboutTeamState();
}

class _MoreAboutTeamState extends State<MoreAboutTeam> {
  List<EventsType> eventTypes = [];
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
                  title: 'A Little Bit More...',
                  subtitle: 'Personalize your profile'),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffE8F0FE)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getLabel('Total matches played till date'),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                        decoration: getInputDecoration(
                            'Total matches played till date')),
                    SizedBox(
                      height: 16,
                    ),
                    _buildTournamentTypeForm(),
                    SizedBox(
                      height: 16,
                    ),
                    _buildLocationForm(),
                    SizedBox(
                height: 16,
              ),
              _buildSocialMediaForm(),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  text: 'Next',
                  onTap: () => Get.to(() => OrganizerPrivacySettings())),
              SizedBox(
                height: 50,
              ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

_buildSocialMediaForm() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffE8F0FE)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel('Social Media Links'),
            SizedBox(height: 8),
            TextField(decoration: getInputDecoration('Facebook')),
            SizedBox(height: 8),
            TextField(decoration: getInputDecoration('Instagram')),
            SizedBox(height: 8),
            TextField(decoration: getInputDecoration('Twitter')),
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
    );
  }

  
  Container _buildLocationForm() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffE8F0FE)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel('Country*'),
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
              height: 16,
            ),
            getLabel('City'),
            SizedBox(
              height: 8,
            ),
            TextField(decoration: getInputDecoration('City')),
          ],
        ),
      ),
    );
  }

  Container _buildTournamentTypeForm() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffE8F0FE)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel('Type of Matches Played'),
            Wrap(
              children: [
                SelectionItemChip(
                    label: 'Tournaments',
                    onTap: () =>
                        toggleEventTypeSelection(EventsType.tournaments),
                    isSelected: eventTypes.contains(EventsType.tournaments)),
                SelectionItemChip(
                    label: 'Leagues',
                    onTap: () => toggleEventTypeSelection(EventsType.leagues),
                    isSelected: eventTypes.contains(EventsType.leagues)),
                SelectionItemChip(
                    label: 'Charity Matches',
                    onTap: () =>
                        toggleEventTypeSelection(EventsType.charityMatches),
                    isSelected: eventTypes.contains(EventsType.charityMatches)),
                SelectionItemChip(
                    label: 'Multi-Sports',
                    onTap: () =>
                        toggleEventTypeSelection(EventsType.multiSports),
                    isSelected: eventTypes.contains(EventsType.multiSports)),
                SelectionItemChip(
                    label: 'Friendly Matches',
                    onTap: () =>
                        toggleEventTypeSelection(EventsType.friendlyMatches),
                    isSelected:
                        eventTypes.contains(EventsType.friendlyMatches)),
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  void toggleEventTypeSelection(EventsType type) {
    setState(() {
      if (eventTypes.contains(type)) {
        eventTypes.remove(type);
      } else {
        eventTypes.add(type);
      }
    });
  }
}

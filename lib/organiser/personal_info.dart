import 'package:flutter/material.dart';
import 'package:isports/organiser/privacy_settings.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/selection_item_chip.dart';
import 'package:isports/shared/theme_data.dart';

class OrganizerPersonalInfo extends StatefulWidget {
  const OrganizerPersonalInfo({super.key});

  @override
  State<OrganizerPersonalInfo> createState() => _OrganizerPersonalInfoState();
}

class _OrganizerPersonalInfoState extends State<OrganizerPersonalInfo> {
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
              _buildTournamentTypeForm(),
              SizedBox(
                height: 16,
              ),
              _buildSportsForm(),
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrganizerPrivacySettings(),
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
            getLabel('Operating Country*'),
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
                    label: 'Cricket', onTap: () {}, isSelected: true),
                SelectionItemChip(
                    label: 'Football', onTap: () {}, isSelected: true),
                SelectionItemChip(
                    label: 'Badminton', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Kabaddi', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Hockey', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Basketball', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Chess', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Table Tennis', onTap: () {}, isSelected: false)
              ],
            ),
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
            getLabel('Total Events Organized Till Date*'),
            SizedBox(
              height: 8,
            ),
            TextField(decoration: getInputDecoration('Total events')),
            SizedBox(
              height: 16,
            ),
            getLabel('Type of events Organized*'),
            Wrap(
              children: [
                SelectionItemChip(
                    label: 'Tournaments', onTap: () {}, isSelected: true),
                SelectionItemChip(
                    label: 'Leagues', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Charity Matches', onTap: () {}, isSelected: true),
                SelectionItemChip(
                    label: 'Multi-Sports', onTap: () {}, isSelected: true),
                SelectionItemChip(
                    label: 'Friendly Matches', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Others', onTap: () {}, isSelected: false)
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
}

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isports/organiser/privacy_settings.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/constants.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/selection_item_chip.dart';
import 'package:isports/shared/theme_data.dart';

class OrganizerPersonalInfo extends StatefulWidget {
  const OrganizerPersonalInfo({super.key});

  @override
  State<OrganizerPersonalInfo> createState() => _OrganizerPersonalInfoState();
}

class _OrganizerPersonalInfoState extends State<OrganizerPersonalInfo> {
  List<EventsType> eventTypes = [];
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
                  onTap: () => Get.to(OrganizerPrivacySettings())),
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
                SelectionItemChip(
                    label: 'Others',
                    onTap: () => toggleEventTypeSelection(EventsType.others),
                    isSelected: eventTypes.contains(EventsType.others)),
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

  void toggleEventTypeSelection(EventsType type) {
    setState(() {
      if (eventTypes.contains(type)) {
        eventTypes.remove(type);
      } else {
        eventTypes.add(type);
      }
    });
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

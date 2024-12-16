import 'package:flutter/material.dart';
import 'package:isports/organiser/subscription.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/selection_item_chip.dart';
import 'package:isports/shared/theme_data.dart';

class OrganizerPrivacySettings extends StatefulWidget {
  const OrganizerPrivacySettings({super.key});

  @override
  State<OrganizerPrivacySettings> createState() =>
      _OrganizerPrivacySettingsState();
}

class _OrganizerPrivacySettingsState extends State<OrganizerPrivacySettings> {
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
                  title: 'Privacy Settings',
                  subtitle: 'Controls what others can see from your profile'),
              SizedBox(height: 16),
              _buildProfileVisibility(),
              SizedBox(height: 24),
              _buildToggleOptions(),
              SizedBox(height: 24),
              _buildWhoCanSeeSection(),
              SizedBox(height: 16),
              _buildShowAlertsOption(),
              SizedBox(height: 24),
              PrimaryButton(
                  text: 'Submit',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrganizationSubscription(),
                        ));
                  }),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildProfileVisibility() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffF2F6F8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel('Profile Visibility*'),
            SizedBox(
              height: 8,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                SelectionItemChip(
                    label: 'Public', onTap: () {}, isSelected: true),
                SelectionItemChip(
                    label: 'Private', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'Only My Team', onTap: () {}, isSelected: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleOptions() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Display your email and phone number to other users',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff231F20)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Switch(
              value: true,
              onChanged: (bool val) {},
              activeColor: primaryColor,
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Allow connection requests from other users',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff231F20)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Switch(
              value: true,
              onChanged: (bool val) {},
              activeColor: primaryColor,
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Allow teams and players to find your profile when searching for event organizers or tournaments',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff231F20)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Switch(
              value: false,
              onChanged: (bool val) {},
              activeColor: primaryColor,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildWhoCanSeeSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffF2F6F8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLabel('Set who can send you direct messages*'),
            SizedBox(
              height: 8,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                SelectionItemChip(
                    label: 'Everyone', onTap: () {}, isSelected: true),
                SelectionItemChip(
                    label: 'Teams', onTap: () {}, isSelected: false),
                SelectionItemChip(
                    label: 'None', onTap: () {}, isSelected: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowAlertsOption() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Allow alerts via emails & in-app notifications',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff231F20)),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Switch(
          value: false,
          onChanged: (bool val) {},
          activeColor: primaryColor,
        )
      ],
    );
  }
}

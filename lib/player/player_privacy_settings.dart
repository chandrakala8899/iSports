import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isports/organiser/subscription.dart';

import '../shared/commonWidgets.dart';
import '../shared/constants.dart';
import '../shared/primary_button.dart';
import '../shared/selection_item_chip.dart';
import '../shared/theme_data.dart';

class PlayerPrivacySettings extends StatefulWidget {
  const PlayerPrivacySettings({super.key});

  @override
  State<PlayerPrivacySettings> createState() => _PlayerPrivacySettingsState();
}

class _PlayerPrivacySettingsState extends State<PlayerPrivacySettings> {
  ProfileVisibilityType _profileVisibilityType = ProfileVisibilityType.public;
  MessageAccessType _accessType = MessageAccessType.everyone;
  bool _showEmailAndPhoneNumber = false;
  bool _connectionRequestFromOthers = false;
  bool _allowSearch = false;
  bool _receiveInvitations = false;
  bool _willingToTravel = false;
  bool _enableAlerts = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
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
              SizedBox(height: 24),
              // _buildShowAlertsOption(),
              // SizedBox(height: 24),
              PrimaryButton(
                  text: 'Next',
                  onTap: () => Get.to(() => OrganizationSubscription())),
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
                    label: 'Public',
                    onTap: () =>
                        setProfileVisibility(ProfileVisibilityType.public),
                    isSelected:
                        _profileVisibilityType == ProfileVisibilityType.public),
                SelectionItemChip(
                    label: 'Private',
                    onTap: () =>
                        setProfileVisibility(ProfileVisibilityType.private),
                    isSelected: _profileVisibilityType ==
                        ProfileVisibilityType.private),
                SelectionItemChip(
                    label: 'Only Team',
                    onTap: () =>
                        setProfileVisibility(ProfileVisibilityType.myTeam),
                    isSelected:
                        _profileVisibilityType == ProfileVisibilityType.myTeam),
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
              value: _showEmailAndPhoneNumber,
              onChanged: (bool val) {
                setState(() {
                  _showEmailAndPhoneNumber = val;
                });
              },
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
              value: _connectionRequestFromOthers,
              onChanged: (bool val) {
                setState(() {
                  _connectionRequestFromOthers = val;
                });
              },
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
                'Receive invitations to join events, tournaments',
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
              value: _receiveInvitations,
              onChanged: (bool val) {
                setState(() {
                  _receiveInvitations = val;
                });
              },
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
                'Willing to traveling for events or coaching assignments',
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
              value: _willingToTravel,
              onChanged: (bool val) {
                setState(() {
                  _willingToTravel = val;
                });
              },
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
                'Allow teams or players to find your profile when searching for players or coaches',
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
              value: _allowSearch,
              onChanged: (bool val) {
                setState(() {
                  _allowSearch = val;
                });
              },
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
              value: _allowSearch,
              onChanged: (bool val) {
                setState(() {
                  _allowSearch = val;
                });
              },
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
                    label: 'Everyone',
                    onTap: () =>
                        setMessageAccessType(MessageAccessType.everyone),
                    isSelected: _accessType == MessageAccessType.everyone),
                SelectionItemChip(
                    label: 'Teammates',
                    onTap: () => setMessageAccessType(MessageAccessType.teams),
                    isSelected: _accessType == MessageAccessType.teams),
                SelectionItemChip(
                    label: 'None',
                    onTap: () => setMessageAccessType(MessageAccessType.none),
                    isSelected: _accessType == MessageAccessType.none),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setProfileVisibility(ProfileVisibilityType type) {
    setState(() {
      _profileVisibilityType = type;
    });
  }

  void setMessageAccessType(MessageAccessType type) {
    setState(() {
      _accessType = type;
    });
  }
}

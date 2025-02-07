import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isports/organiser/create_account.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/constants.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/selection_item_chip.dart';
import 'package:isports/team/team_profile.dart';

import '../player/profile_setup.dart';

class ProfileCreate extends StatefulWidget {
  const ProfileCreate({super.key});

  @override
  State<ProfileCreate> createState() => _ProfileCreateState();
}

class _ProfileCreateState extends State<ProfileCreate> {
  ProfileType profileType = ProfileType.individual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProfileCreationHeader(
                title: 'General Details',
                subtitle:
                    'Set up profile picture'),
            SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffE8F0FE)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Account Type*',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      children: [
                        SelectionItemChip(
                            label: 'Individual',
                            onTap: () => setProfileType(ProfileType.individual),
                            isSelected: profileType == ProfileType.individual),
                        SelectionItemChip(
                            label: 'Team Account',
                            onTap: () =>
                                setProfileType(ProfileType.teamAccount),
                            isSelected: profileType == ProfileType.teamAccount),
                        SelectionItemChip(
                            label: 'Event Organizer',
                            onTap: () =>
                                setProfileType(ProfileType.eventOrganizer),
                            isSelected:
                                profileType == ProfileType.eventOrganizer),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            PrimaryButton(
              text: 'Next',
              //onTap: () => Get.to(OrganizerCreateAccount())
              onTap: () {
                if (profileType == ProfileType.individual) {
                  Get.to(() => ProfileSetup());
                } else if (profileType == ProfileType.teamAccount) {
                  Get.to(() => TeamProfile());
                } else {
                  Get.to(() => OrganizerCreateAccount());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void setProfileType(ProfileType type) {
    setState(() {
      profileType = type;
    });
  }
}

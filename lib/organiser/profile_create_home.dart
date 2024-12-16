import 'package:flutter/material.dart';
import 'package:isports/organiser/create_account.dart';
import 'package:isports/player/skill_set.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/selection_item_chip.dart';

class OrganizerProfileCreate extends StatefulWidget {
  const OrganizerProfileCreate({super.key});

  @override
  State<OrganizerProfileCreate> createState() => _OrganizerProfileCreateState();
}

class _OrganizerProfileCreateState extends State<OrganizerProfileCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SkillSet(),
              ));
        },
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProfileCreationHeader(
                title: 'Set up profile',
                subtitle:
                    'Personalize your profile to unlock a tailored sports experience!'),
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
                            onTap: () {},
                            isSelected: false),
                        SelectionItemChip(
                            label: 'Team Account',
                            onTap: () {},
                            isSelected: false),
                        SelectionItemChip(
                            label: 'Event Organizer',
                            onTap: () {},
                            isSelected: true)
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrganizerCreateAccount(),
                    ));
              },
              isDisabled: false,
            ),
          ],
        ),
      ),
    );
  }
}

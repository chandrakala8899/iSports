import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isports/shared/commonWidgets.dart';

import '../shared/constants.dart';
import '../shared/primary_button.dart';
import '../shared/selection_item_chip.dart';
import 'skill_set.dart';

class SelectSport extends StatefulWidget {
  const SelectSport({super.key});

  @override
  State<SelectSport> createState() => _SelectSportState();
}

class _SelectSportState extends State<SelectSport> {
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
                  title: 'Set up profile',
                  subtitle: 'Personalize your profile'),
              SizedBox(
                height: 16,
              ),
              _buildSportsForm(),

              PrimaryButton(
                text: 'Next',
                onTap: () => Get.to(() => SkillSet()),
              ),
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

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
   final List<String> sportsList = [
    "Cricket",
    "Football",
    "Badminton",
    "Kabaddi",
    "Hockey",
    "Basketball",
    "Chess",
    "Table tennis"
  ];

  List<String> selectedSports = ["Cricket", "Football"]; 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepIndicator(),
            const SizedBox(height: 20),
            _buildTitle(),
            const SizedBox(height: 20),
            _buildSportsList(),
            _buildNextButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// **App Bar**
  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  /// **Step Indicator (Progress Bar)**
  Widget _buildStepIndicator() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(height: 4, color: Colors.blue),
        ),
        Expanded(
          flex: 7,
          child: Container(height: 4, color: Colors.grey[300]),
        ),
      ],
    );
  }

  /// **Title Section**
  Widget _buildTitle() {
    return const Text(
      "Select the sports you play",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  /// **Sports List with Checkboxes**
  Widget _buildSportsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: sportsList.length,
      
        itemBuilder: (context, index) {
          return _buildSportsItem(sportsList[index]);
        },
      ),
    );
  }

  /// **Individual Sports Item**
  Widget _buildSportsItem(String sport) {
    bool isSelected = selectedSports.contains(sport);

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ? selectedSports.remove(sport) : selectedSports.add(sport);
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical:4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sport, style: const TextStyle(fontSize: 16)),
            Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  value == true
                      ? selectedSports.add(sport)
                      : selectedSports.remove(sport);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// **Next Button**
  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
           Get.to(() => SkillSet());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF003572),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: const Text(
          'Next',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
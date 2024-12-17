import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isports/models/subscription_model.dart';
import 'package:isports/organiser/payment_details.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/theme_data.dart';

enum Plans { basic, premium, pro }

List<String> basicPlanBenefits = [
  'Access to create and manage standard events',
  'Limited participant and team registration',
  'Basic event analytics and reporting',
  'Connect with players and teams'
];

List<String> premiumPlanBenefits = [
  'Unlimited event creation and management',
  'Advanced analytics and insights for event performance',
  'Priority support for event-related queries',
  'Custom branding options for events'
];

const List<String> proPlanBenefits = [
  'VIP access to exclusive event hosting opportunities',
  'Advanced marketing tools and strategies',
  'Featured listing for events to increase visibility',
  'Analytics for participant engagement and satisfaction'
];

class OrganizationSubscription extends StatefulWidget {
  const OrganizationSubscription({super.key});

  @override
  State<OrganizationSubscription> createState() =>
      _OrganizationSubscriptionState();
}

class _OrganizationSubscriptionState extends State<OrganizationSubscription> {
  var selectedPlan = Plans.premium;

  Map<Plans, SubscriptionModel> subscriptions = {
    Plans.basic: SubscriptionModel(
        planName: 'Basic Plan',
        yearlyPrice: 0,
        monthlyPrice: 0,
        benefits: basicPlanBenefits,
        planType: Plans.basic),
    Plans.premium: SubscriptionModel(
        planName: 'Premium Plan',
        yearlyPrice: 9600,
        monthlyPrice: 800,
        benefits: premiumPlanBenefits,
        planType: Plans.premium),
    Plans.pro: SubscriptionModel(
        planName: 'Pro Plan',
        yearlyPrice: 12000,
        monthlyPrice: 1000,
        benefits: proPlanBenefits,
        planType: Plans.pro),
  };

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
                  title: 'Subscription Plan',
                  subtitle:
                      'Provide your financial details for making and receiving payments'),
              SizedBox(height: 24),
              _buildSubscription(subscriptions[Plans.basic]!),
              SizedBox(height: 24),
              _buildSubscription(subscriptions[Plans.premium]!),
              SizedBox(height: 24),
              _buildSubscription(subscriptions[Plans.pro]!),
              SizedBox(height: 24),
              PrimaryButton(
                text: 'Next',
                onTap: () => Get.to(OrganizerPaymentDetails(
                    subscriptionModel: subscriptions[selectedPlan]!)),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscription(SubscriptionModel subscription) {
    return _buildPlanCard(
        name: subscription.planName,
        yearlyAmount: subscription.yearlyPrice,
        benefits: subscription.benefits,
        monthlyAmount:
            (subscription.monthlyPrice) > 0 ? subscription.monthlyPrice : null,
        planType: subscription.planType);
  }

  _buildPlanCard({
    required String name,
    required double yearlyAmount,
    double? monthlyAmount,
    required List<String> benefits,
    required Plans planType,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = planType;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: selectedPlan == planType ? primaryColor : Color(0xffE8F0FE)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPlanHeader(planType, name),
              SizedBox(
                height: 8,
              ),
              _buildAmountSection(planType, yearlyAmount, monthlyAmount),
              SizedBox(height: 16),
              Text(
                'Benefits',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: selectedPlan == planType ? Colors.white : primaryColor,
                ),
              ),
              SizedBox(height: 8),
              _buildBenefits(planType, benefits),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTitle(String name, {bool reverse = false}) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: reverse ? Colors.white : primaryColor),
    );
  }

  Widget _buildPlanHeader(Plans planType, String name) {
    return Row(
      children: [
        Expanded(child: getTitle(name, reverse: selectedPlan == planType)),
        selectedPlan == planType
            ? Icon(
                Icons.radio_button_checked,
                color: Colors.white,
              )
            : Icon(Icons.radio_button_off_outlined)
      ],
    );
  }

  Widget _buildAmountSection(
      Plans planType, double yearlyAmount, double? monthlyAmount) {
    final bool isSelected = selectedPlan == planType;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AmountDisplay(
          currencySymbol: '₹',
          amount: yearlyAmount,
          period: '/ year',
          isSelected: isSelected,
        ),
        if (monthlyAmount != null)
          AmountDisplay(
            currencySymbol: '₹',
            amount: monthlyAmount,
            period: '/ month',
            isSelected: isSelected,
            amountStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : primaryColor,
            ),
            periodStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : const Color(0xFF697586),
            ),
          ),
      ],
    );
  }

  Widget _buildBenefits(Plans planType, List<String> benefits) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: benefits.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                '\u2022 ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: selectedPlan == planType
                        ? Colors.white
                        : Color(0xff697586)),
              ),
              Expanded(
                child: Text(benefits[index],
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: selectedPlan == planType
                            ? Colors.white
                            : Color(0xff697586))),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:isports/organiser/subscription.dart';

class SubscriptionModel {
  final String planName;
  final double yearlyPrice;
  final double monthlyPrice;
  final List<String> benefits;
  final Plans planType;

  SubscriptionModel(
      {required this.planName,
      required this.yearlyPrice,
      required this.monthlyPrice,
      required this.benefits,
      required this.planType});
}

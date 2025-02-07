import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isports/models/subscription_model.dart';
import 'package:isports/organiser/setup_completed.dart';
import 'package:isports/organiser/subscription.dart';
import 'package:isports/shared/commonWidgets.dart';
import 'package:isports/shared/constants.dart';
import 'package:isports/shared/primary_button.dart';
import 'package:isports/shared/selection_item_chip.dart';
import 'package:isports/shared/theme_data.dart';

class OrganizerPaymentDetails extends StatefulWidget {
  final SubscriptionModel subscriptionModel;

  const OrganizerPaymentDetails({super.key, required this.subscriptionModel});

  @override
  State<OrganizerPaymentDetails> createState() =>
      _OrganizerPaymentDetailsState();
}

class _OrganizerPaymentDetailsState extends State<OrganizerPaymentDetails> {
  PaymentMode _paymentMode = PaymentMode.creditOrDebit;

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
                  title: 'Payment Details',
                  subtitle:
                      'Enter your payment details to finalize your subscription and unlock exclusive access to all features!'),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:  Color(0xFFAACC46)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected plan',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Goal Assist (${widget.subscriptionModel.planName})',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      _buildAmountSection(
                        widget.subscriptionModel.planType,
                        widget.subscriptionModel.yearlyPrice,
                        widget.subscriptionModel.monthlyPrice,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
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
                      getLabel('Select your preferred payment mode*'),
                      SizedBox(height: 16),
                      Wrap(
                        children: [
                          SelectionItemChip(
                              label: 'Credit/Debit',
                              onTap: () =>
                                  setPaymentMode(PaymentMode.creditOrDebit),
                              isSelected:
                                  _paymentMode == PaymentMode.creditOrDebit),
                          SelectionItemChip(
                              label: 'UPI',
                              onTap: () => setPaymentMode(PaymentMode.upi),
                              isSelected: _paymentMode == PaymentMode.upi),
                        ],
                      ),
                      SizedBox(height: 24),
                      getLabel('Credit/ Debit Card Number*'),
                      SizedBox(height: 8),
                      TextField(decoration: getInputDecoration('Card Number')),
                      SizedBox(height: 24),
                      getLabel('Name on Card*'),
                      SizedBox(height: 8),
                      TextField(decoration: getInputDecoration('Name on card')),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getLabel('Expiry Date*'),
                                SizedBox(height: 8),
                                TextField(
                                    decoration:
                                        getInputDecoration('Card Number')),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getLabel('CVV*'),
                                SizedBox(height: 8),
                                TextField(
                                    decoration:
                                        getInputDecoration('Card Number')),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              PrimaryButton(
                text: 'Pay now',
                onTap: () => Get.to(SetupCompleted()),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountSection(
      Plans planType, double yearlyAmount, double? monthlyAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AmountDisplay(
          currencySymbol: '₹',
          amount: yearlyAmount,
          period: '/ year',
          isSelected: true,
        ),
        if (monthlyAmount != null)
          AmountDisplay(
            currencySymbol: '₹',
            amount: monthlyAmount,
            period: '/ month',
            isSelected: true,
            amountStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
            periodStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          ),
      ],
    );
  }

  void setPaymentMode(PaymentMode mode) {
    setState(() {
      _paymentMode = mode;
    });
  }
}

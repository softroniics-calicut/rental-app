import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Paymentui extends StatefulWidget {
  const Paymentui({super.key});

  @override
  State<Paymentui> createState() => _PaymentuiState();
}

class _PaymentuiState extends State<Paymentui> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Now"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CreditCardForm(
              onCreditCardModelChange: (CreditCardModel data) {}, // Required
              themeColor: Colors.red,
              obscureCvv: true,
              obscureNumber: true,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              enableCvv: true,
              cardNumberValidator: (String? cardNumber) {},
              expiryDateValidator: (String? expiryDate) {},
              cvvValidator: (String? cvv) {},
              cardHolderValidator: (String? cardHolderName) {},
              onFormComplete: () {
                // callback to execute at the end of filling card data
              },
              cardNumberDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card Holder',
              ),
              cardHolderName: '',
              cardNumber: '',
              cvvCode: '',
              expiryDate: '',
              formKey: _formKey,
            ),
            ElevatedButton(
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text("Payment successfully"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text("Pay Now"))
          ],
        ),
      ),
    );
  }
}

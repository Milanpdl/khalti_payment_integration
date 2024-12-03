import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SafeArea(
          child: Text(
            "Payment with khalti",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 111, 19, 209)),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  payWithKhaltiInApp();
                },
                child: const Text(
                  "Khalti Payment",
                  style: TextStyle(color: Color.fromARGB(255, 111, 19, 209)),
                ))
          ],
        ),
      ),
    );
  }

  payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 1000,
          productIdentity: 'Product Id',
          productName: 'productName'),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Payment Successful"),
            actions: [
              SimpleDialogOption(
                child: const Text("Ok"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint("Cancelled");
  }
}

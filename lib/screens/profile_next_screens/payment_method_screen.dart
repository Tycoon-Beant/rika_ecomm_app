import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _selectedValue = 1;
  String _selectedName = 'Credit Card';
  String _selectedIcon = 'assets/images/creditcard.png';

  final List<Map<String, dynamic>> paymentMethods = [
    {'value': 1, 'name': 'Credit Card', 'icon': 'assets/images/creditcard.png'},
    {'value': 2, 'name': 'Paypal', 'icon': 'assets/images/paypal.png'},
    {'value': 3, 'name': 'Visa', 'icon': 'assets/images/visa.png'},
    {'value': 4, 'name': 'Google Pay', 'icon': 'assets/images/google_pay.png'},
  ];

  void _selectPaymentMethod(int value) {
    setState(() {
      _selectedValue = value;
      _selectedName =
          paymentMethods.firstWhere((e) => e['value'] == value)['name'];
      _selectedIcon =
          paymentMethods.firstWhere((e) => e['value'] == value)['icon'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context, {
                'name': _selectedName,
                'icon': _selectedIcon,
              });
            },
            child: Image.asset('assets/images/arrow.png'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(children: [
                Text('Payment Methods',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                ...paymentMethods.map((method) {
                  return Card(
                    shadowColor: Colors.grey.shade100,
                    color: context.colorScheme.onTertiary,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(method['icon'], scale: 0.8),
                              const SizedBox(width: 10),
                              Text(method['name'],
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                          Radio(
                            value: method['value'],
                            groupValue: _selectedValue,
                            onChanged: (value) =>
                                _selectPaymentMethod(value as int),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ]),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                onPressed: () {
                  Navigator.pop(context, {
                    'name': _selectedName,
                    'icon': _selectedIcon,
                  });
                },
                child: Text(
                  "Confirm Payment Method",
                  style: context.theme.titleMedium!.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

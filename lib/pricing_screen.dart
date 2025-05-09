import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  bool isMonthly = true;
  int selectedMonthlyIndex = 0;
  int selectedYearlyIndex = 0;

  final List<Map<String, dynamic>> monthlyPlans = [
    {
      'title': 'Free',
      'price': '0.00',
      'isPopular': false,
    },
    {
      'title': 'Starter',
      'price': '7.49',
      'isPopular': true,
    },
    {
      'title': 'Pro',
      'price': '11.49',
      'isPopular': false,
    },
  ];

  final List<Map<String, dynamic>> yearlyPlans = [
    {
      'title': 'Free',
      'price': '0.00',
      'isPopular': false,
    },
    {
      'title': 'Starter',
      'price': '9.99',
      'isPopular': true,
    },
    {
      'title': 'Pro',
      'price': '19.99',
      'isPopular': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFEAEAE9), width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Toggle Button
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F3F8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      left: isMonthly ? 6 : null,
                      right: isMonthly ? null : 6,
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 60) * 0.5 - 6,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isMonthly = true),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Monthly',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: isMonthly ? Colors.black : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isMonthly = false),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Yearly',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: !isMonthly ? Colors.black : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Pricing Plans
              ...List.generate(
                3,
                (index) {
                  final plan = isMonthly ? monthlyPlans[index] : yearlyPlans[index];
                  final isSelected = isMonthly
                      ? index == selectedMonthlyIndex
                      : index == selectedYearlyIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isMonthly) {
                          selectedMonthlyIndex = index;
                        } else {
                          selectedYearlyIndex = index;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? Colors.black
                              : const Color(0xFFF3F3F2),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    plan['title'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  if (plan['isPopular'])
                                    Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2EBB9),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Text(
                                        'Popular',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              RichText(
                                text: TextSpan(
                                  text: '\$${plan['price']} ',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: '/month',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF838388),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.black
                                    : const Color(0xFF838388),
                                width: 2,
                              ),
                              color: isSelected ? Colors.black : Colors.transparent,
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              // Get Started Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';

class InterestChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  static String routeName = "/choose_interest";

  const InterestChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFE21220) : Color(0xFF2C2C2C), 
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onContinue;

  const ActionButtons({super.key, required this.onSkip, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // skip button
        Expanded(
          child: TextButton(
            onPressed: onSkip,
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF2C2C2C),
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45)
              ),
            ),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(width: 15),
        
        // continue button
        Expanded(
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE21220),
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
            ),
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
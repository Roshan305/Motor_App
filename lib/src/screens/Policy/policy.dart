import 'package:flutter/material.dart';
import 'package:motor_app/src/utils/textstyle.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MotorApp - Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Effective Date: Feb 2024',
              style: DesignText.title,
            ),
            const SizedBox(height: 16.0),
            Text(
              'At MotorApp, we are committed to protecting your privacy. This Privacy Policy outlines how we collect, use, disclose, and safeguard your personal information when you use the PetPal application ("App").',
              style: DesignText.body,
            ),
            const SizedBox(height: 16.0),
            Text(
              '1. Information We Collect',
              style: DesignText.title,
            ),
            const SizedBox(height: 8.0),
            Text(
              'User Information: When you register on the App, we collect information such as your name, email address, contact number.',
              style: DesignText.body,
            ),
            const SizedBox(height: 16.0),
            Text(
              '2. How We Use Your Information',
              style: DesignText.title,
            ),
            const SizedBox(height: 8.0),
            Text(
              'User Experience: We use collected information to enhance your experience on the App, personalize content.',
              style: DesignText.body,
            ),
            Text(
              'Customer Support: We use your information to respond to inquiries, provide customer support, and address technical issues.',
              style: DesignText.body,
            ),
            Text(
              'Security: Collected data helps us monitor and secure the App, detect and prevent fraudulent activities, and enforce our Terms and Conditions.',
              style: DesignText.body,
            ),
            const SizedBox(height: 16.0),
            // Add other sections similarly
            Text(
              'By using the MotorApp application, you consent to the terms outlined in this Privacy Policy. If you do not agree with these terms, please refrain from using the App.',
              style: DesignText.bodyItalic,
            ),
          ],
        ),
      ),
    );
  }
}

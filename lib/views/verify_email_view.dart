import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify email'),
      ),
      body: Column(children: [
        const Text(
            "We've send you an email verification, please open it to verify your account"),
        const Text(
            "If you havn't receive a verification yet, press the button below"),
        TextButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            user?.sendEmailVerification();
          },
          child: const Text('Send email verification'),
        ),
        TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            if(context.mounted){
            Navigator.of(context).pushNamedAndRemoveUntil(
              registerRoute,
              (route) => false,
            );
            }
          },
          child: const Text('Restart'),
        )
      ]),
    );
  }
}

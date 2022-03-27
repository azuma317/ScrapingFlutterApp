import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final infoTextProvider = StateProvider<String>((ref) => '');

final emailProvider = StateProvider<String>((ref) => '');

final passwordProvider = StateProvider<String>((ref) => '');

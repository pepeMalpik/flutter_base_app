import 'dart:convert';

import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _data = '';
  Login? login;
  void _checkStorage() async {
    final data =
        await StorageHelper().readSecureData(AppConstants.loginStorageKey);
    if (data != null) {
      login = LoginModel.fromJson(json.decode(data));
    }
    setState(() {
      _data = data ?? '...';
    });
  }

  @override
  void initState() {
    super.initState();
    _checkStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hola'.hardcoded)),
      body: Center(
        child: Text(login?.tokenType ?? ''),
      ),
    );
  }
}

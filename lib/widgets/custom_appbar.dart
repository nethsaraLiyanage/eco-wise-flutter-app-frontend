import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/home_dp.png',
        width: 75,
        height: 75,
        fit: BoxFit.cover,
      ),
      title: const Text(
        'Hello',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        'Oshada Nanayakkara',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: InkWell(
        child: Image.asset('assets/images/home_bell.png'),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListTile(
      leading: Image.asset(
        'assets/images/home_dp.png',
        width: size.width * 0.165,
        height: size.width * 0.165,
        fit: BoxFit.cover,
      ),
      title: Text(
        'Hello',
        style: TextStyle(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Oshada Nanayakkara',
        style: TextStyle(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size.width * 0.198,
          height: size.width * 0.198,
          child: Image.asset('assets/images/home_bell.png'),
        ),
      ),
    );
  }
}

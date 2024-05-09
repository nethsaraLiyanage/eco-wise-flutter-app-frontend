import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/providers/user_id_provider.dart';
import 'package:eco_wise/config/config.dart';
import 'package:eco_wise/screens/home_screen.dart';

class IssueScreen extends ConsumerStatefulWidget {
  const IssueScreen({super.key});

  @override
  ConsumerState<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends ConsumerState<IssueScreen> {
  final userIssue = TextEditingController();
  String dropDownValue = 'Select Priority';

  void _onSubmit() async {
    final id = ref.watch(userIdProvider);
    // print(id);

    final response = await http.post(
      Uri.parse('${apiUrl}report-issues'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          "title": "title",
          "description": userIssue.text,
          "userId": id,
          "status": dropDownValue,
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Issue reported succesfully!'),
        ),
      );

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => HomeScreen(),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/issue.png'),
              Text(
                'Report an Issue',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
              ),
              Text(
                'What do you want to report',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(
                height: 45,
              ),
              Text(
                'A brief description of the problem',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
              ),
              Container(
                width: size.width * 0.786,
                height: size.height * 0.143,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: TextField(
                  controller: userIssue,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Prioritize this issue',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 7),
                width: size.width * 0.784,
                height: size.height * 0.061,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 246, 246, 246),
                ),
                child: DropdownButton<String>(
                  value: dropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 124, 124, 124)),
                  underline: Container(height: 0),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Select Priority',
                      child: Text('Select Priority'),
                    ),
                    DropdownMenuItem(
                      value: 'Critical',
                      child: Text('Critical'),
                    ),
                    DropdownMenuItem(
                      value: 'Medium',
                      child: Text('Medium'),
                    ),
                    DropdownMenuItem(
                      value: 'Low',
                      child: Text('Low'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: size.width * 0.458,
                  ),
                  CustomElevatedButton(
                    onButtonPressed: _onSubmit,
                    height: 41,
                    width: 132,
                    childWidget: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

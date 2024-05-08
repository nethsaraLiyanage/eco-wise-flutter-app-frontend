import 'package:flutter/material.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key});

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  final userIssue = TextEditingController();

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
              )
            ],
          ),
        ),
      ),
    );
  }
}

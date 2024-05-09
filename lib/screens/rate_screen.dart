import 'dart:convert';

import 'package:eco_wise/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:eco_wise/screens/home_screen.dart';
import 'package:eco_wise/screens/issue_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/providers/user_id_provider.dart';

class RateScreen extends ConsumerStatefulWidget {
  const RateScreen({super.key});

  @override
  ConsumerState<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends ConsumerState<RateScreen> {
  var userRating = 0.0;
  final userComment = TextEditingController();

  void _onBack() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
        (route) => false);
  }

  void _onReport() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => IssueScreen(),
      ),
    );
  }

  void _onPublishFeedback() async {
    final id = ref.watch(userIdProvider);
    // print(id);
    if (userComment.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse('${apiUrl}feedback'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{
            "content": userComment.text,
            "userId": id,
            "feedbackAmount": userRating.toString(),
          },
        ),
      );

      final msg = jsonDecode(response.body)['message'];

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a comment'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: _onBack,
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/rate_success.png'),
              Text(
                'Collected',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
              Text(
                'Thank you for choosing us',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                height: 45,
              ),
              Text(
                'Rate Us!',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                    ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'How did we do?',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  RatingBar.builder(
                      initialRating: 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 4,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (ctx, _) => const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 12, 134, 1),
                          ),
                      onRatingUpdate: (rating) {
                        userRating = rating;
                      })
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comment, if any?',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                  ),
                  Container(
                    width: size.width * 0.842,
                    height: size.height * 0.105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: userComment,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Say something here...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: _onReport,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/rate_report.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Report this collector',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomElevatedButton(
                  onButtonPressed: _onPublishFeedback,
                  height: 61,
                  width: 275,
                  childWidget: Text(
                    'Publish Feedback',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

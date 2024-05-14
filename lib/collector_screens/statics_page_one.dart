import 'package:eco_wise/collector_screens/statics_page_three.dart';
import 'package:eco_wise/collector_screens/statics_page_two.dart';
import 'package:flutter/material.dart';
class StaticsPageOne extends StatefulWidget {
  const StaticsPageOne({super.key});

  @override
  State<StaticsPageOne> createState() => _StaticsPageOneState();
}

class _StaticsPageOneState extends State<StaticsPageOne> {
  
  _onTap(String tappedOn, BuildContext context) {
    if (tappedOn == 'Two') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const StaticsPageThree(),
        ),
      );
    }
    if (tappedOn == 'Three') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const StaticsPageTwo(),
        ),
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistics',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: null,
              child: Image.asset('assets/images/statimg01.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top:80),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap:() => {_onTap('Two', context)},
                            child: Image.asset('assets/images/statimg02.png'),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap:() => {_onTap('Three', context)},
                            child: Image.asset('assets/images/statimg03.png'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap:() => {_onTap('Two', context)},
                            child: Image.asset('assets/images/statimg04.png'),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: null,
                            child: Image.asset('assets/images/statimg05.png'),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            
            )
          ],
        ),
      ),
    );
  }
}

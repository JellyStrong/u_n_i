import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class Screen extends StatelessWidget {
//   const Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[100],
//       body: SafeArea(
//           top: true,
//           bottom: false,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _DDay(
//                 onHeartPressed: () {}, firstDay: null,
//               ),
//               _CoupleImage()
//             ],
//           )),
//     );
//   }
// }

class _DDay extends StatelessWidget {
  DateTime firstDayz = DateTime.now();
  final now = DateTime.now();

  final DateTime firstDay;
  final GestureTapCallback onHeartPressed;
  _DDay(
      {super.key,
      required this.onHeartPressed,
      required this.firstDay}); //상위에서 함수 입력받기
  //String str = DateFormat("yy/MM/dd").format(firstDay);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.0,
        ),
        Text(
          "유앤아이",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text('${firstDay.year}.${firstDay.month}.${firstDay.day}'),
        SizedBox(
          height: 16.0,
        ),
        IconButton(
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite,
          ),
          iconSize: 60.0,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
            "D+ ${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}")
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'assets/img/middle_image.png',
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}  

//상태관리
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // DateTime firstDay = DateTime.now();
  DateTime firstDay = DateTime.utc(2022, 10, 9);

  void onHeartPressed() {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            color: Colors.white,
            child: CupertinoDatePicker(
              onDateTimeChanged: (value) {
                setState(() {
                  firstDay = value;
                });
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DDay(
                onHeartPressed: onHeartPressed,
                firstDay: firstDay,
              ),
              _CoupleImage()
            ],
          )),
    );
  }
}

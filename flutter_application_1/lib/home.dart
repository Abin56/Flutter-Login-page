import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final List<Widget> Listof = const [
    Text(
      'ASUS',
      style: TextStyle(fontFamily: 'font1'),
    ),
    Text(
      'Infinity',
      style: TextStyle(fontFamily: 'font1'),
    ),
    Text(
      'IPhone',
    ),
    Text(
      'IQOO',
      style: TextStyle(fontFamily: 'font1'),
    ),
    Text(
      'M I',
      style: TextStyle(fontFamily: 'font1'),
    ),
    Text(
      'Oneplus',
      style: TextStyle(fontFamily: 'font1'),
    ),
    Text(
      'OPPO',
      style: TextStyle(fontFamily: 'font4'),
    ),
    Text(
      'Realme',
      style: TextStyle(fontFamily: 'font1'),
    ),
    Text(
      'Samsung',
      style: TextStyle(fontFamily: 'font4'),
    ),
    Text(
      'Vivo',
      style: TextStyle(fontFamily: 'font1'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          const Padding(
            padding: EdgeInsets.all(0),
            child: Center(
                child: Text(
              'Signout',
              style: TextStyle(fontSize: 18),
            )),
          ),
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Listof[index],
                  leading: Container(
                    height: 80,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: index % 2 == 0
                          ? BorderRadius.circular(10.0)
                          : BorderRadius.circular(100.0),
                    ),
                    child: ClipRRect(
                      borderRadius: index % 2 == 0
                          ? BorderRadius.circular(12.0)
                          : BorderRadius.circular(100.0),
                      child: Image.asset(
                        "lib/assets/images2/image$index.png",
                        fit: BoxFit.contain,
                        width: 50,
                      ),
                    ),
                  ),
                  // leading: index % 2 == 0
                  //     ? CircleAvatar(
                  //         backgroundImage:
                  //             AssetImage('lib/assets/images2/image$index.png'),
                  //       )
                  //     : ClipRRect(
                  //         borderRadius: BorderRadius.circular(2),
                  //         child: Image.asset(
                  //           'lib/assets/images2/image$index.png',
                  //           fit: BoxFit.contain,
                  //           // color: Colors.grey,
                  //           width: 50,
                  //         ),
                  //       ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: Listof.length)),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}

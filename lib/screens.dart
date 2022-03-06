import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitDialog(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Navigator',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan, onPrimary: Colors.cyan),
                child: const Text(
                  'Go next',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showExitDialog(BuildContext context) async => await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Question'),
          content: const Text('Do you want to exit?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
          ],
        ),
      );
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          textDirection: TextDirection.ltr,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, onPrimary: Colors.cyan),
              onPressed: () {
                int result = 42;
                Navigator.of(context).pop();
                buildShowDialog(context, result);
              },
              child: const Text(
                'Return 42',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, onPrimary: Colors.cyan),
              onPressed: () {
                String result = ' AbErVaLIG';
                Navigator.of(context).pop();
                buildShowDialog(context, result);
              },
              child: const Text(
                'Return AbErVaLIG',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context, result) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Returning value'),
          content: Text('Return $result'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });

    Fluttertoast.showToast(
      msg: "Decrementado",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void increment() {
    setState(() {
      count++;
    });

    Fluttertoast.showToast(
      msg: "Incrementado",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  bool get isZero => count == 0;
  bool get isMax => count == 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Contador',
            style: TextStyle(
              fontSize: 48,
              fontFamily: 'DotGothic16',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            isZero
                ? 'VALOR MÍNIMO ALCANÇADO'
                : isMax
                    ? 'VALOR MÁXIMO ALCANÇADO'
                    : 'valor mínimo 0 | valor máximo 50',
            style: const TextStyle(
              fontSize: 19,
              fontFamily: 'DotGothic16',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(64.0),
            child: Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 128,
                fontFamily: 'DotGothic16',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isZero ? null : decrement,
                style: TextButton.styleFrom(
                  backgroundColor: isZero ? Colors.blueGrey : Colors.white,
                  primary: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  '-1',
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'DotGothic16',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              TextButton(
                onPressed: isMax ? null : increment,
                style: TextButton.styleFrom(
                  backgroundColor: isMax ? Colors.blueGrey : Colors.white,
                  primary: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  '+1',
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'DotGothic16',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

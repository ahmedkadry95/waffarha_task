// import 'dart:isolate';
//
// import 'package:flutter/material.dart';
//
// void heavyTask(SendPort sendPort) {
//   int result = 0;
//   for (var i = 0; i <= 10000; i++) {
//     result = i;
//     print(result);
//   }
//   sendPort.send(result);
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// /////////////////////////////////
// /////////////////////////////////
// /////////////////////////////////
// /////////////////////////////////
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   startHeavyTask() async {
//     try {
//       ReceivePort receivePort = ReceivePort();
//       await Isolate.spawn(heavyTask, receivePort.sendPort);
//       receivePort.listen((message) {
//         print('result: $message');
//         setState(() {
//           _counter = message;
//         });
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             ElevatedButton(
//               onPressed: () => startHeavyTask(),
//               child: Text(
//                 'Do some heavy task',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:waffarha_task/core/di/dependency_injection.dart';
import 'package:waffarha_task/core/routing/app_router.dart';
import 'package:waffarha_task/task_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  runApp(
    TaskApp(
      appRouter: AppRouter(),
    ),
  );
}

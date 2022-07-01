import 'package:flutter/material.dart';
import 'package:iqbal_proyek_akhir/pages/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent)),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

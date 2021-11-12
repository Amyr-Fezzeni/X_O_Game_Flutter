import 'package:flutter/material.dart';
import 'package:x_o_game/Pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:x_o_game/provider/provider_game.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderGame()),],
    
    child: const MyApp(),
  ),);
}

class ProviderTheme {
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO Game',
      theme: context.watch<ProviderGame>().themeData,
      home: const HomePage(),
    );
  }
}

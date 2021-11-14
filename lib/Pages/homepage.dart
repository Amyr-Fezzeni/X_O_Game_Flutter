import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
import 'package:x_o_game/Costum%20Widgets/game_matrice.dart';
import 'package:x_o_game/Costum%20Widgets/menu.dart';
import 'package:x_o_game/Costum%20Widgets/popup.dart';
import 'package:x_o_game/Pages/settings.dart';
import 'package:x_o_game/provider/provider_game.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "X/O Game",
            style: GoogleFonts.dancingScript(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          overlayOpacity: 0.74,
          animationSpeed: 300,
          overlayColor: Colors.brown[900],
          children: [
            SpeedDialChild(
                backgroundColor: context.watch<ProviderGame>().buttonColor,
                foregroundColor: context.read<ProviderGame>().nightMode
                    ? Colors.black
                    : Colors.white,
                child: const Icon(Icons.settings),
                label: 'Settings',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                }),
            SpeedDialChild(
                backgroundColor: context.watch<ProviderGame>().buttonColor,
                foregroundColor: context.read<ProviderGame>().nightMode
                    ? Colors.black
                    : Colors.white,
                child: const Icon(Icons.accessibility_new_sharp),
                label: 'Change Names',
                onTap: () async {
                  await PopUp.changeNames(context);
                }),
            SpeedDialChild(
                backgroundColor: context.watch<ProviderGame>().buttonColor,
                foregroundColor: context.read<ProviderGame>().nightMode
                    ? Colors.black
                    : Colors.white,
                child: const Icon(Icons.android),
                label: 'Play with JARVIS',
                onTap: () {
                  context.read<ProviderGame>().newGame();
                  context.read<ProviderGame>().gameMode(true);
                }),
            SpeedDialChild(
                backgroundColor: context.watch<ProviderGame>().buttonColor,
                foregroundColor: context.read<ProviderGame>().nightMode
                    ? Colors.black
                    : Colors.white,
                child: const Icon(Icons.accessibility_new),
                label: 'Two player mode',
                onTap: () {
                  context.read<ProviderGame>().newGame();
                  context.read<ProviderGame>().gameMode(false);
                }),
            SpeedDialChild(
                backgroundColor: context.watch<ProviderGame>().buttonColor,
                foregroundColor: context.read<ProviderGame>().nightMode
                    ? Colors.black
                    : Colors.white,
                child: const Icon(Icons.refresh_outlined),
                label: 'Reset Game',
                onTap: () {
                  context.read<ProviderGame>().resetGame();
                }),
          ]),
      body: Container(
        color: context.watch<ProviderGame>().bgcolor,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: const [MatriceGame(), Menu()],
          ),
        ),
      ),
    );
  }
}

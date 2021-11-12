import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
import 'package:x_o_game/provider/provider_game.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Settings",
              style: GoogleFonts.dancingScript(
                fontSize: 30,
              ),
            ),
          ),
        ),
        body: Container(
          color: context.watch<ProviderGame>().bgcolor,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        Text("Night Mode",
                            style: GoogleFonts.dancingScript(
                              fontSize: 20,
                            )),
                        Switch(
                            value: context.watch<ProviderGame>().nightMode,
                            onChanged: (value) {
                              if (value == true) {
                                context.read<ProviderGame>().setDarkMode();
                              } else {
                                context.read<ProviderGame>().setLightMode();
                              }
                            })
                      ])))
            ],
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:x_o_game/provider/provider_game.dart';

class PopUp {
  static Future<void> showMyDialog(
      dynamic context, String msg, bool win) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        msg,
                        style: GoogleFonts.nunito(
                            fontSize: 30,
                            color: context.watch<ProviderGame>().textcolor),
                      ),
                      Visibility(
                          visible: !win,
                          child: Icon(
                            Icons.warning_amber_rounded,
                            size: 50,
                            color: context.watch<ProviderGame>().textcolor,
                          )),
                      Visibility(
                          visible: win,
                          child: Image.asset(
                            "assets/images/congratulation.gif",
                            width: 70,
                          )),
                      Visibility(
                        visible: win,
                        child: Text(
                          "New Game ?",
                          style: GoogleFonts.nunito(
                              fontSize: 30,
                              color: context.watch<ProviderGame>().textcolor),
                        ),
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Container(
                      color: context.watch<ProviderGame>().buttonColor,
                      width: 60,
                      child: Center(
                        child: Text(
                          'OK',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            color: context.read<ProviderGame>().nightMode ? Colors.black :Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> changeNames(dynamic context) async {
    String name1 = "";
    String name2 = "";
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: context.read<ProviderGame>().player1name,
                        ),
                        autocorrect: true,
                        onChanged: (value) {
                          name1 = value;
                        },
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 30,
                      color: context.watch<ProviderGame>().buttonColor,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<ProviderGame>()
                              .changePlayerName(name1, 1);
                        },
                        child: Text(
                          "Change",
                          style: GoogleFonts.nunito(
                              fontSize: 12, color: context.read<ProviderGame>().nightMode ? Colors.black :Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: context.read<ProviderGame>().player2name,
                        ),
                        autocorrect: true,
                        onChanged: (value) {
                          name2 = value;
                        },
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 30,
                      color: context.watch<ProviderGame>().buttonColor,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<ProviderGame>()
                              .changePlayerName(name2, 2);
                        },
                        child: Text(
                          "Change",
                          style: GoogleFonts.nunito(
                              fontSize: 12, color: context.read<ProviderGame>().nightMode ? Colors.black :Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Container(
                width: 60,
                height: 30,
                color: context.watch<ProviderGame>().buttonColor,
                child: Center(
                  child: Text(
                    'OK',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: context.read<ProviderGame>().nightMode ? Colors.black :Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

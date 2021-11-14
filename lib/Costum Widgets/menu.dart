import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
import 'package:x_o_game/provider/provider_game.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      // height: 50,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.07, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: !context.watch<ProviderGame>().Ai,
              child: Center(
                child: Text(
                    "${context.watch<ProviderGame>().player == "X" ? 
                      context.watch<ProviderGame>().player1name : 
                      context.watch<ProviderGame>().player2name} turns !", style: GoogleFonts.nunito(
                        fontSize: 14,
                      ),),
              )),
          Text(
            "${context.watch<ProviderGame>().player1name} : ${context.watch<ProviderGame>().player_1}",
            style: GoogleFonts.nunito(
              fontSize: 20,
            ),
          ),
          Text(
            "${context.watch<ProviderGame>().player2name} : ${context.watch<ProviderGame>().player_2}",
            style: GoogleFonts.nunito(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

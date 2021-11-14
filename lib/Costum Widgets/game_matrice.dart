import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
import 'package:x_o_game/Costum%20Widgets/popup.dart';
import 'package:x_o_game/provider/provider_game.dart';

class MatriceGame extends StatefulWidget {
  const MatriceGame({Key? key}) : super(key: key);

  @override
  _MatriceGameState createState() => _MatriceGameState();
}

class _MatriceGameState extends State<MatriceGame> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double spacing = size.width * 0.006;
    double boxSize = size.width > 400 ? 356 : size.width * 0.89;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: boxSize,
        height: boxSize,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: context.watch<ProviderGame>().boardColor[index],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: TextButton(
                onPressed: () async {
                  context.read<ProviderGame>().Ai ?
                  context.read<ProviderGame>().autoPlay(context, index) :
                  context.read<ProviderGame>().insertValue(context, index);
                },
                child: Text(
                  context.watch<ProviderGame>().board[
                          context.read<ProviderGame>().boardDict[index]![0]]
                      [context.read<ProviderGame>().boardDict[index]![1]],
                  style: GoogleFonts.dancingScript(
                      color: Colors.white, fontSize: 40),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

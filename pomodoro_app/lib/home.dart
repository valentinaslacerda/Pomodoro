import 'package:flutter/material.dart';
import 'colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.vermelho,
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Pomodoro',
                      style: TextStyle(color: MyColors.texto, fontSize: 12.54)),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.btnVermelho,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text('Short Break',
                      style: TextStyle(color: MyColors.texto, fontSize: 12.54)),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.btnVermelho,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text('Long Break',
                      style: TextStyle(color: MyColors.texto, fontSize: 12.54)),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.btnVermelho,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 39),
            Center(
              child: Container(
                height: 250,
                width: 340,
                alignment: Alignment.center,
                color: MyColors.containerP,
                child: Text('25:00',
                    style: TextStyle(
                        color: MyColors.texto,
                        fontSize: 80,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 39),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text('START',
                    style: TextStyle(
                        color: MyColors.texto,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                style: TextButton.styleFrom(
                  backgroundColor: MyColors.btnVermelho,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

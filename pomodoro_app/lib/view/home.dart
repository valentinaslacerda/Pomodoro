import 'package:flutter/material.dart';
import 'package:pomodoro_app/view/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  var background = vermelho;
  var button = btnVermelho;
  var container = containerP;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: background,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/logo.png'
              )
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //Função Pomodoro
                    setState(() {
                      //Mudando cores da tela
                      background = vermelho;
                      button = btnVermelho;
                      container = containerP;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: button,
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Pomodoro',
                    style: TextStyle(
                      color: texto,
                      fontSize: 12.54,
                      fontWeight: FontWeight.w700
                    )
                  ),
                ),

                const SizedBox(width: 10),

                TextButton(
                  onPressed: () {
                    //Função Short Break
                    setState(() {
                      //Mudando cores da tela
                      background = verde;
                      button = btnVerde;
                      container = containerS;

                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: button,
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Short Break',
                    style: TextStyle(
                      color: texto,
                      fontSize: 12.54,
                      fontWeight: FontWeight.w700
                    )
                  ),
                ),

                const SizedBox(width: 10,),

                TextButton(
                  onPressed: () {
                    //Função Long Break
                    setState(() {
                      //Mudando cores da tela
                      background = azul;
                      button = btnAzul;
                      container = containerT;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: button,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Long Break',
                    style: TextStyle(
                      color: texto,
                      fontSize: 12.54,
                      fontWeight: FontWeight.w700
                    )
                  ),
                ),

              ],
            ),

            const SizedBox(height: 39,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: container
              ),
              width: double.infinity,
              height: 250,
              alignment: Alignment.center,
              child: Text(
                '25:00',
                style: TextStyle(
                  color: texto,
                  fontSize: 70,
                  fontWeight: FontWeight.w800
                ),
              ),

            ),

            const SizedBox(height: 55,),

            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: button,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                
              ),
              onPressed: () {
                //Função Contador
              },
              child: Text(
                'START',
                style: TextStyle(
                  color: texto,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

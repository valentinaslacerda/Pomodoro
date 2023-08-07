import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/view/colors.dart';

import '../controller/homeC.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (c) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            color: c.background,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/images/logo.png')),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        c.pomodoro();
                        /*
                      timer?.cancel();
                      textoS = 'START';
                      flag = false;
                      //Função Pomodoro
                      setState(() {
                        //Mudando cores da tela
                        background = vermelho;
                        button = btnVermelho;
                        container = containerP;
    
                        minutos = 25;
                        segundos = 0;
                      });*/
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: c.button,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('Pomodoro',
                          style: TextStyle(
                              color: texto,
                              fontSize: 12.54,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        c.shortBreak();
                        /*
                      //Função Short Break
                      timer?.cancel();
                      textoS = 'START';
                      flag = false;
                      setState(() {
                        //Mudando cores da tela
                        background = verde;
                        button = btnVerde;
                        container = containerS;
    
                        minutos = 5;
                        segundos = 0;
                      })*/
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: c.button,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('Short Break',
                          style: TextStyle(
                              color: texto,
                              fontSize: 12.54,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        c.longBreak();
                        /*
                      timer?.cancel();
                      textoS = 'START';
                      flag = false;
                      //Função Long Break
                      setState(() {
                        //Mudando cores da tela
                        background = azul;
                        button = btnAzul;
                        container = containerT;
                        minutos = 0;
                        segundos = 5;
                      })*/
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: c.button,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('Long Break',
                          style: TextStyle(
                              color: texto,
                              fontSize: 12.54,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 39,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: c.container),
                  width: double.infinity,
                  height: 250,
                  alignment: Alignment.center,
                  child: Text(
                    '${c.minutos}:${c.format.format(c.segundos)}',
                    style: const TextStyle(
                        color: texto,
                        fontSize: 70,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: c.button,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {
                    //Função Contador
                    c.contador();
                    /*if (!flag) {
                    //solta o tempo
                    flag = true;
                    setState(() {
                      textoS = 'PAUSE';
                      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                        setState(() {
                          if (segundos > 0) {
                            segundos--;
                          } else if (minutos > 0) {
                            minutos--;
                            segundos = 59;
                          } else {
                            textoS = 'START';
                            playAlarm();
                            timer.cancel();
                            minutos = 25;
                            flag = false;
                          }
                        });
                      });
                    });
                  } else {
                    //para o tempo
                    setState(() {
                      textoS = 'START';
                      timer!.cancel();
                    });
                    flag = false;
                  }*/
                  },
                  child: Text(
                    '${c.textoS}',
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
      },
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
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
  var textoS = 'START';
  var minutos = 1;
  var segundos = 0;
  bool flag = false;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    background = vermelho;
    button = btnVermelho;
    container = containerP;
    textoS = 'START';
    minutos = 25;
    segundos = 0;
    super.initState();

  }

  Timer? timer;
  NumberFormat format = NumberFormat('00');

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('notification_sound'),
    );}


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

                      minutos = 25;
                      segundos = 0;
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

                      minutos = 5;
                      segundos = 0;

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
                      minutos = 15;
                      segundos = 0;
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
                '$minutos:${format.format(segundos)}',
                style: const TextStyle(
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
                if(!flag){
                  //solta o tempo
                  flag = true;
                  setState(() {
                    textoS = 'PAUSE';
                    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                      setState(() {
                        if(segundos > 0){
                          segundos--;
                        }else if(minutos > 0){
                          minutos--;
                          segundos = 59;
                          
                        } 
                         else{
                          textoS = 'START';
                          
                          timer.cancel();
                          minutos = 25;
                          flag = false;
                          
                        }
                      });

                    });
                  });

                  
                }else{
                  //para o tempo
                  setState(() {
                    textoS = 'START';
                    timer!.cancel();
                  });
                  flag = false;
                }
              },
              child: Text(
                '$textoS',
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

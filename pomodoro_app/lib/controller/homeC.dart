import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../view/colors.dart';

class Controller extends GetxController {
  var background = vermelho;
  var button = btnVermelho;
  var container = containerP;
  var textoS = 'START';
  var minutos = 25;
  var segundos = 0;
  var telaPomodoro = true;
  var telaShort = false;
  var telaLong = false;
  bool flag = false;
  final player = AudioPlayer();
  var alarmAudioPath = 'alarme.mp3';
  Timer? timer;
  NumberFormat format = NumberFormat('00');
  void playAlarm() async {
    await player.setSource(AssetSource('sons/alarme.mp3'));
    player.resume();
  }

  void pomodoro() {
    //Função Pomodoro
    telaPomodoro = true;
    telaShort = false;
    telaLong = false;
    timer?.cancel();
    textoS = 'START';
    flag = false;

    //Mudando cores da tela
    background = vermelho;
    button = btnVermelho;
    container = containerP;

    minutos = 25;
    segundos = 0;
    update();
  }

  void shortBreak() {
    //Função Short Break
    telaPomodoro = false;
    telaShort = true;
    telaLong = false;
    timer?.cancel();
    textoS = 'START';
    flag = false;

    //Mudando cores da tela
    background = verde;
    button = btnVerde;
    container = containerS;

    minutos = 5;
    segundos = 0;
    update();
  }

  void longBreak() {
    //Função Long Break
    telaPomodoro = false;
    telaShort = false;
    telaLong = true;
    timer?.cancel();
    textoS = 'START';
    flag = false;

    //Mudando cores da tela
    background = azul;
    button = btnAzul;
    container = containerT;

    minutos = 15;
    segundos = 0;
    update();
  }

  void contador() {
    if (!flag) {
      //solta o tempo
      flag = true;

      textoS = 'PAUSE';
      update();
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (segundos > 0) {
          segundos--;
          update();
        } else if (minutos > 0) {
          minutos--;
          segundos = 59;
          update();
        } else {
          textoS = 'START';
          playAlarm();
          timer.cancel();
          if (telaLong) {
            minutos = 15;
          } else if (telaShort) {
            minutos = 5;
          } else {
            minutos = 25;
          }
          flag = false;
          update();
        }
      });
    } else {
      //para o tempo

      textoS = 'START';
      timer!.cancel();

      flag = false;
      update();
    }
  }
}

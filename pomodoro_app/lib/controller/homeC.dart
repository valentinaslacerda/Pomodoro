import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../view/colors.dart';
import 'entity/tarefa.dart';

class Controller extends GetxController {
  List<Todo> listTarefa = [];
  Todo? deleted;
  int? deletedIndex;
  String? errorText;
  final textController = TextEditingController();


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

  void addTarefa(){
    String text = textController.text;

    if(text.isEmpty){
      errorText = 'O titulo não pode ser vazio';
      update();
      return;
    }

    Todo novaTarefa = Todo(title: text, date: DateTime.now());
    listTarefa.add(novaTarefa);
    errorText = null;
    update();

    textController.clear();

  }

  void deleteTarefa(Todo todo) {
    deleted = todo;
    deletedIndex = listTarefa.indexOf(todo);

    
    listTarefa.remove(todo);
    update();

    //todoRepository.saveTodoList(todos);

    // ScaffoldMessenger.of(context).clearSnackBars();
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(
    //     'Tarefa ${todo.title} foi removida com sucesso!',
    //     style: TextStyle(color: Color(0xff060708)),
    //   ),
    //   backgroundColor: Colors.white,
    //   action: SnackBarAction(
    //     label: 'Desfazer',
    //     textColor: const Color(0xff00d7f3),
    //     onPressed: () {
    //       setState(() {
    //         todos.insert(deletedpos!, deletedTodo!);
    //       });
    //       todoRepository.saveTodoList(todos);
    //     },
    //   ),
    //   duration: const Duration(seconds: 5),
    // ));
  }

}

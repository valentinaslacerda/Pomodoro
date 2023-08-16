import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro_app/view/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_app/view/todoCard.dart';
import '../controller/entity/tarefa.dart';
import '../controller/homeC.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (c) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 1000,
              color: c.background,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset('assets/images/logo.png')),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          c.pomodoro();
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
                      const SizedBox(width: 9),
                      TextButton(
                        onPressed: () {
                          c.shortBreak();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: c.button,
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.shortBreak,
                            style: TextStyle(
                                color: texto,
                                fontSize: 12.54,
                                fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      TextButton(
                        onPressed: () {
                          c.longBreak();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: c.button,
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.longBreak,
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
                    },
                    child: Text(
                      '${c.textoS}',
                      style: TextStyle(
                        color: texto,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  //LISTA DE TAREFAS
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: c.textController,
                          decoration: InputDecoration(
                            errorText: c.errorText,
                            errorStyle: TextStyle(color: Colors.blue),
                            border: OutlineInputBorder(),
                            labelText: AppLocalizations.of(context)!.nameTask,
                            labelStyle: TextStyle(color: texto),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: c.button, width: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        onPressed: () {
                          c.addTarefa();
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: c.button,
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (Todo tarefa in c.listTarefa)
                          TodoCard(todo: tarefa, onDelete: c.deleteTarefa)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

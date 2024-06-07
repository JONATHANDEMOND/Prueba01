import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_01/screens/Ejercicio1.dart';
import 'package:prueba_01/screens/Ejercicio2.dart';

void main(){
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Prueba 01",
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List <Widget> screens = [Cuerpo(context), const Ejercicio1()];
    return Scaffold(
      appBar: AppBar(
        title : Text("Jonathan Barros"),
        backgroundColor: Colors.white38,
      ),
      body: screens[indice],bottomNavigationBar: BottomNavigationBar(currentIndex: indice,
      onTap: (value) {
        setState(() {
          indice=value;
        });
      },
      items : const[
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: "Prueba"),
        BottomNavigationBarItem(icon: Icon(Icons.computer_rounded), label:"Ejercicio 01"),

      ]),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    decoration: BoxDecoration(
      image:DecorationImage(image: AssetImage('assets/image/2.jpeg'),
      fit: BoxFit.cover),
    ),
  child:Column(
    children: [
      Text("JONATHANDEMND GIT HUB", style: TextStyle(fontSize: 30, color: Colors.redAccent),),
  //////////////////widgets////////////
        Boton3(context)
    ],
  )

  );
}

Widget Boton3(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      alerta02(context);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      textStyle: const TextStyle(fontSize: 16),
    ),
    child: const Text("Ingrese Ejercicio 2"),
  );
}


void alerta02(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Desea ir al Ejercico 2"),
        content: const Text("EJERCICIO 02 "),
        actions: [
          TextButton(
            onPressed: () {
              irEjercicio2(context);

            },
            child: const Text("Sí"),
          ),
          TextButton(
            onPressed: () {
              print("Aquí debería ir una función (NO)");
              Navigator.pop(context);
            },
            child: const Text("No"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text("Cancelar"),
          ),
        ],
      );
    },
  );
}

void irEjercicio2(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Ejercicio2()),
  );
}
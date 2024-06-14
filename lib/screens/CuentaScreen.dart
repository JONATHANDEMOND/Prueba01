import 'package:flutter/material.dart';
import 'package:prueba_01/main.dart';
import 'package:prueba_01/screens/Historial.dart';

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Cuenta",
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
    List <Widget> screens = [Cuerpo(context), const Historial()];
    return Scaffold(
      appBar: AppBar(
        title : Text("CUENTA"),
        backgroundColor: Colors.white38,
      ),
      body: screens[indice],bottomNavigationBar: BottomNavigationBar(currentIndex: indice,
      onTap: (value) {
        setState(() {
          indice=value;
        });
      },
      items : const[
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: "Cuenta"),
        BottomNavigationBarItem(icon: Icon(Icons.computer_rounded), label:"Historial"),

      ]),
    );
  }
}
Widget Cuerpo(context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://st3.depositphotos.com/3776273/31936/i/600/depositphotos_319362956-stock-photo-man-pointing-showing-copy-space.jpg'), 
          ),
          const SizedBox(height: 20),
          const Text(
            'Número de Cuenta: 1234567890',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Text(
            'Valor Total de la Cuenta: \$1000.00',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
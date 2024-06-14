import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_01/screens/LoginScreen.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Prueba",
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
    
    return Scaffold(
      appBar: AppBar(
        title : Text("Jonathan Barros"),
        backgroundColor: Colors.white38,
      ),
      body: Cuerpo(context)     
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
      Text("JONATHANDEMOND GIT HUB", style: TextStyle(fontSize: 29, color: Colors.redAccent),),
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
    child: const Text("INGRESE AL LOGIN"),
  );
}


void alerta02(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Desea ir al Login"),
        content: const Text("LOGIN"),
        actions: [
          TextButton(
            onPressed: () {
             login(context);

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

void login(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
  );
}
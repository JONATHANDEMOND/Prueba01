import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_01/screens/CuentaScreen.dart';
import 'package:prueba_01/screens/RegistroScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( Login());
}
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      Column(
        children: <Widget>[
          const Text("LOGIN"),
          CampoCorreo(context),
          CampoContrasenia(context),
          BotonGuardar(context),
          BotonRegistrarse(context)
        ],
      )
      
    ),
  );
}
final TextEditingController _correo = TextEditingController();

Widget CampoCorreo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      TextField(
        controller: _correo,
      decoration: const InputDecoration(
        hintText: "Ingrese Correo"),
    )
    
    ),
  );
}
final TextEditingController _contrasenia= TextEditingController();
Widget CampoContrasenia(context){
   return Container(
    padding: EdgeInsets.all(10),
     child: (
    TextField(
        controller: _contrasenia,
      decoration: const InputDecoration(
        hintText: "Ingrese Contraseña"),
       )
     
       ),
   );
}
Widget BotonGuardar(context){
  return(
    FilledButton(onPressed: (){ login(context);
      
     
    }, child: const Text("Login"))
  );

}

Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,
    password: _contrasenia.text
  );
  ////////////////////navegacion
   Navigator.push(context,MaterialPageRoute(builder: (context)=> Cuenta()));

} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}

}
Widget BotonRegistrarse(context){
  return(
    FilledButton(onPressed: (){ registro(context);
      
     
    }, child: const Text("Registrarse"))
  );

}

void registro(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Registro()),
  );
}
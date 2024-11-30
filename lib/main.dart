import 'package:cuartapp/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//void main() => runApp(const MyApp());

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Llama Stargazing',
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
    //Media Query obtiene un valor segun el contexto actual de la pantalla
            height: MediaQuery.of(context).size.height, 
            decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/LLAMALESS_ILLUS-55.png"),
              fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: const Center(  
                    child: Text("LLAMA STARGAZING", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Image.asset("assets/LOGO_STARGAZING.png", width: 320),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>const Dashboard()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(230, 80),
                      backgroundColor: const Color.fromARGB(255, 40, 59, 180),
                    ),
                    child: const Text("COMENZAR", 
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                      )
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(top:120),
                  child: const Text("Llama Stargazing 2023 C - Todos los derechos reservados. Desarrollado por Skymedia", textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:cuartapp/main.dart';
import 'package:cuartapp/screens/read.dart';
import 'package:cuartapp/screens/tour_1.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(58, 50, 139, 1),
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Bienvenido, Usuario", style: TextStyle(
              fontWeight: FontWeight.bold
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Main()));
              },
            child: Image.asset("assets/LLAMA_USER_ICON.png", height: 55,) 
            )         
          ],
        )
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(58, 50, 139, 1),
              Color.fromRGBO(103, 196, 133, 1),
            ]
          )
        ),
        child: Column(
          children: [
            const Info(),
            Container(
              padding: const EdgeInsets.fromLTRB(15,20,15,20),
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(17, 26, 39, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left:20),
                    child: const Text("Tours", style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      ),   
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AstroLunar(),
                      AstroFoto()
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AstroGrupo(),
                      AstroPrivado()
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Read()));
            }, style: ElevatedButton.styleFrom(
              minimumSize: const Size(160, 50),
              backgroundColor: const Color.fromARGB(255, 40, 59, 180),
            ),
            child: const Text("RESERVAR", style: TextStyle(  
                color: Colors.white,
                fontSize: 17
              ), 
            )
            )
          ],
        ),
      )
    );
  }
}

class AstroPrivado extends StatelessWidget {
  const AstroPrivado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Main()));
    },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(17, 26, 39, 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          image: DecorationImage(
                  image: AssetImage("assets/TOUR_ASTRO_PRIV.jpg"),
                  fit: BoxFit.cover
                )
        ),
        height: 180,
        width: 165,
        child: const Column(
          children: [
            Text("TOUR ASTRONÓMICO PRIVADO", textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              ),
            ),
          ],
        ),
      )
    );
  }
}

class AstroGrupo extends StatelessWidget {
  const AstroGrupo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Main()));
    },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(17, 26, 39, 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          image: DecorationImage(
                  image: AssetImage("assets/TOUR_ASTRO_GRP.jpg"),
                  fit: BoxFit.cover
                )
        ),
        height: 180,
        width: 165,
        child: const Text("TOUR ASTRONÓMICO EN GRUPO", textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      )
    );
  }
}

class AstroFoto extends StatelessWidget {
  const AstroFoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Main()));
    },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(17, 26, 39, 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          image: DecorationImage(
                  image: AssetImage("assets/TOUR_ASTRO_FOTO_PRIV.jpg"),
                  fit: BoxFit.cover
                )
        ),
        height: 180,
        width: 165,
        child: const Text("TOUR ASTRONÓMICO FOTOGRÁFICO PRIVADO", textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      )
    );
  }
}

class AstroLunar extends StatelessWidget {
  const AstroLunar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Tour1()));
    },
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(17, 26, 39, 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
                  image: AssetImage("assets/TOUR_ASTROLUNAR.jpg"),
                  fit: BoxFit.cover
                )
          ),
          height: 180,
          width: 165,
          child: const Text("TOUR ASTROLUNAR", style: TextStyle(
            color: Colors.white
          ),
        )
      )
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      margin: const EdgeInsets.fromLTRB(15,20,15,5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(17, 26, 39, 1)
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40),
            child: Image.asset("assets/LLAMA_ICONS-57.png", width: 100,),
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.fromLTRB(25, 50, 0 ,20),
            child: const Column(
            children: [
              Text("EXPERIMENTA LA BELLEZA DEL CIELO NOCTURNO", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ],
            )
          )
        ],
      ),
    );
  }
}
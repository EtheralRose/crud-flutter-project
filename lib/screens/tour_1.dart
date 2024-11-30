import 'package:cuartapp/main.dart';
import 'package:flutter/material.dart';

class Tour1 extends StatelessWidget {
  const Tour1({super.key});

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
            const Text("Tour AstroLunar", style: TextStyle(
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
        width: MediaQuery.of(context).size.width,
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
            Container(
              height:350,
              width: 450,
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(17, 26, 39, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              child: Column(
                children: [
                  Container(
                    height: 218,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage("assets/TOUR_ASTROLUNAR.jpg"),
                        fit: BoxFit.contain
                      )
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20,20,20,0),
                    child: Text("Vive una experiencia única en el mundialmente conocido Desierto de Atacama y descubre el espectáculo celestial que se despliega sobre nuestras cabezas.",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 350,
              child: Text("INCLUYE:", textAlign: TextAlign.start ,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
            ),
            ),
            Container(
              height:140,
              width: 450,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(17, 26, 39, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/CAR_ICON.png"),
                      const Center(child:
                        Text("Transporte", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        )
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/CAMERA_ICON.png"),
                      const Center(child: 
                        Text("Fotografías", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        )
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/DISH_ICON.png"),
                      const Center(child: 
                        Text("Picoteo", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height:140,
              width: 450,
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(17, 26, 39, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              child: const Column(
                children: [ SizedBox(
                  width: 330,
                  child: Text("Valor:", textAlign: TextAlign.start,style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Text("35.000", style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
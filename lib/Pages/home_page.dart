

import 'package:flutter/material.dart';
import 'package:guia_turismo/Pages/muni_page.dart';
import 'package:guia_turismo/widgets/categorias_widget.dart';
import 'package:guia_turismo/widgets/distritos_widget.dart';
import 'package:guia_turismo/widgets/recursos_turisticos_widget.dart';
import 'package:guia_turismo/widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Imagen Fondo
              Container(
                height: height * .45,
                width: double.infinity,
                decoration: _Decoration_image(),
              ),
              //Tetxto y buscador
              Container(
                height: height * .45,
                width: double.infinity,
                decoration: _decorattionColors(),
                child: Stack(
                  children: [
                    //Texto buscador search
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Urubamba',
                              style: TextStyle(
                                  color: Color.fromARGB(243, 245, 245, 245),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Text(
                              'Municipalida Provincial',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(251, 245, 245, 245),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SearchWidget()
                          ],
                        ),
                      ),
                    ),
                    //Subtitle y estrellas
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(45),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Valle sagrado de los Incas',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                Text(
                                  'Urubamba Uruspampa Lugar de Luz',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    ...List.generate(
                                        5,
                                        (index) => const Icon(Icons.star,
                                            color: Color(0xfffeaa36),
                                            size: 22)),
                                  ],
                                ),
                                const Text('fecha actual:'),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Imagen Logo Municialidad
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MunicipalidadPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    padding: const EdgeInsets.all(7),
                    height: height * .091,
                    width: width * .16,
                    decoration: const BoxDecoration(
                        //color: Colors.red,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(20, 19)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/Municipalidad.png')),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(189, 255, 255, 255),
                              offset: Offset.zero,
                              blurRadius: 0,
                              spreadRadius: 1)
                        ]),
                  ),
                ),
              ),
            ],
          ),

          // const SizedBox(height: 20,),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: const [
                    DistritosWIdget(),
                    SizedBox(  height: 10,  ),
                    RecursoTuristicosWidget(),
                    SizedBox(height: 10,),
                    CategoriasWidgets(),
                  
                  
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _decorattionColors() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(48, 115, 116, 117),
            const Color.fromARGB(184, 28, 40, 40).withOpacity(.3),
            const Color.fromARGB(211, 23, 67, 4).withOpacity(.3),
            const Color.fromARGB(255, 17, 0, 255).withOpacity(.4),
          ]),
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(45),
      ),
    );
  }

  BoxDecoration _Decoration_image() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(45),
      ),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://www.peruforless.com/blog/wp-content/uploads/2021/04/urubamba-viewpoint.jpg'),
      ),
    );
  }
}

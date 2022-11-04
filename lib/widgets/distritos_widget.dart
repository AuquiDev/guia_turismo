

import 'package:flutter/material.dart';
import 'package:guia_turismo/Pages/distritos_pages.dart';
import 'package:guia_turismo/Provider/distrito_provider.dart';
import 'package:provider/provider.dart';

class DistritosWIdget extends StatelessWidget {
  const DistritosWIdget({super.key});
 
  @override
  Widget build(BuildContext context) {
 final distritoProvider = Provider.of<DistritoProvider>(context,listen: true);
  final List distrito = distritoProvider.distritoList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //no cambia
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Distritos de Urubamba',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(217, 34, 34, 34))),
            Text(
              'VER MAS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromARGB(255, 77, 126, 248),
              ),
            )
          ],
        ),

        //Slider Horizontal
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(
                distrito.length,
                (index) => InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const DistritoPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 110,
                    width: 170,
                    decoration:   BoxDecoration(
                        //color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            distritoProvider.distritoList[index].imagen
                          )),
                        borderRadius:const BorderRadius.all(Radius.elliptical(30, 40)),
                        boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(210, 0, 0, 0).withOpacity(.3),
                              offset: Offset(0,0),
                              blurRadius: 1,
                              spreadRadius: 1

                            )
                          ]
                        ),
                   
                    child: Stack(
                      children: [
                        Container(
                        decoration:  BoxDecoration(
                          gradient:LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors:[
                              Colors.black.withOpacity(.5),
                              const Color.fromARGB(157, 227, 72, 45).withOpacity(.2),
                              const Color.fromARGB(255, 5, 99, 231).withOpacity(.3),
                            ] ),
                          borderRadius:const BorderRadius.all(Radius.elliptical(30, 40)),
                         
                        ),

                  ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 30,
                            width: double.infinity,
                            decoration:  BoxDecoration(
                              color: const Color.fromARGB(255, 82, 28, 28).withOpacity(.7),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.elliptical(30,40),
                                bottomRight: Radius.elliptical(30,40)
                              )
                            ),
                            child:  Text(distritoProvider.distritoList[index].title,
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                            )
                          ),
                        )
                      
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

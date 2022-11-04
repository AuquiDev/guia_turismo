import 'package:flutter/material.dart';
import 'package:guia_turismo/Pages/recursos_pages.dart';
import 'package:guia_turismo/Provider/recursos_provider.dart';
import 'package:provider/provider.dart';

class RecursoTuristicosWidget extends StatelessWidget {
  const RecursoTuristicosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final recursoProvider = Provider.of<RecursosProvider>(context,listen: true);
    print(recursoProvider.recursoList);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Recursos Turisticos de Urubamba',
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
                recursoProvider.recursoList.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 135,
                  width: 90,
                  decoration:  const BoxDecoration(                
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>RecursosPages() ));
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration:  BoxDecoration(
                            color: const Color.fromARGB(255, 192, 191, 191),
                            shape:BoxShape.circle ,
                            boxShadow: const[
                               BoxShadow(
                                color: Color.fromARGB(255, 235, 210, 99),
                                offset: Offset.zero,
                                spreadRadius: 1.5,
                                blurRadius: 0
                              )
                            ],
                             image: DecorationImage(
                              image: NetworkImage(recursoProvider.recursoList[index].image)),

                          ),
                        ),
                      ),
                      Text(recursoProvider.recursoList[index].name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

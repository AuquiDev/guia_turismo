
import 'package:google_fonts/google_fonts.dart';
import 'package:guia_turismo/Pages/home_pages.dart';
import 'package:guia_turismo/Provider/distrito_provider.dart';
import 'package:guia_turismo/Provider/recursos_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
void main() => runApp( AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return DistritoProvider();
          }
          ),
         ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return RecursosProvider();
          }
          ),
         
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Urubamba guia',
      initialRoute: 'home',
      routes: {
        'home':(context) =>Homepage(),//HomeScreen(),
        //'details':(context) => const tTweenAnimationBuilder(productos: [],)
      },
      theme:ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.indigo),
        textTheme: GoogleFonts.openSansCondensedTextTheme()
      ) ,
      
    );
  }
}
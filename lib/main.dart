import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:apis_flutter/infrastructure/models/pokemon.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Pokemon? pokemon;
  int pokemonId = 0;
  @override
  void initState() {
    super.initState();
    getPokemon();
  }

  Future<void> getPokemon() async{
    pokemonId++;
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
    pokemon = Pokemon.fromJson(response.data);
    setState(() {
      
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 103, 91),

          title:  Text('Petición Http: $pokemonId', style: TextStyle(color: Colors.white),),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( pokemon?.name ?? 'No data'),
              if(pokemon != null)
                Image.network(pokemon!.sprites.frontDefault),
              if(pokemon != null)
                Image.network(pokemon!.sprites.backDefault),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getPokemon,
          child: const Icon(Icons.navigate_next)
        ),
      ),
    );
  }
}
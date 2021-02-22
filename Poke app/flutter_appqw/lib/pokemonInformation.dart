import 'package:flutter/material.dart';
import 'package:flutter_appqw/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget()=>Stack(
    children: <Widget> [
     Positioned(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Text(pokemon.name),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type
                    .map((t) => FilterChip(
                    backgroundColor: Colors.amber, label: Text(t),
                    onSelected: (b) {}))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      Align( alignment: Alignment.topCenter,
        child: Hero( tag: pokemon.img,
          child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
      )),
      )
   ],

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amber,
        title: Text(pokemon.name),
      ),

      body: bodyWidget(),
    );
  }
}


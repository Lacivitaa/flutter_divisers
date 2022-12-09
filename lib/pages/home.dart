import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<int> listDivider = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final raController = TextEditingController();

    return Material(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: <Widget>[
        Text(
          'Calculadora de Divisores',
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w300),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: TextField(
            controller: raController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: 'Insira o RA do Aluno',
            ),
            autofocus: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.blue[800]),
            onPressed: () {
              setState(() {
                calculateDividers(raController.text);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Calcular',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: 150,
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 600,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: listDivider.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(child: Text('${listDivider[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        )
      ]),
    ));
  }
}

void calculateDividers(ra) {
  List<int> divisions = [];
  double remaining;
  double value = double.parse(ra);

  double number = value * 100000;

  for (var i = 1; i <= number; i++) {
    remaining = number % i;

    if (remaining == 0) {
      divisions.add(i);
    }
  }

  listDivider.addAll(divisions);
}

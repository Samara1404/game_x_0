import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTorn = true; //the first Player is o!
  List<String> displey_O_X = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[700],
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player x', style: myTextStyle),
                          Text(' 3', style: myTextStyle),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player o', style: myTextStyle),
                          Text('3', style: myTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff9FA09E)),
                    ),
                    child: Center(
                        child: Text(displey_O_X[index],
                            style:
                                TextStyle(color: Colors.white, fontSize: 40))),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[700],
              child: Center(
                child: Text('Scoreboart'),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTorn && displey_O_X[index] == '') {
        displey_O_X[index] = 'o';
      } else if (!ohTorn && displey_O_X[index] == '') {
        displey_O_X[index] = 'x';
      }
      ohTorn = !ohTorn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displey_O_X[0] == displey_O_X[1] &&
        displey_O_X[0] == displey_O_X[2] &&
        displey_O_X[0] != "") {
      _showWinDialog(displey_O_X[0]);
    }
    if (displey_O_X[3] == displey_O_X[4] &&
        displey_O_X[3] == displey_O_X[5] &&
        displey_O_X[3] != "") {
      _showWinDialog(displey_O_X[3]);
    }
    if (displey_O_X[6] == displey_O_X[7] &&
        displey_O_X[6] == displey_O_X[8] &&
        displey_O_X[6] != "") {
      _showWinDialog(displey_O_X[6]);
    }
    if (displey_O_X[0] == displey_O_X[3] &&
        displey_O_X[0] == displey_O_X[6] &&
        displey_O_X[0] != "") {
      _showWinDialog(displey_O_X[0]);
    }
    if (displey_O_X[1] == displey_O_X[4] &&
        displey_O_X[1] == displey_O_X[7] &&
        displey_O_X[1] != "") {
      _showWinDialog(displey_O_X[1]);
    }
    if (displey_O_X[2] == displey_O_X[5] &&
        displey_O_X[2] == displey_O_X[8] &&
        displey_O_X[2] != "") {
      _showWinDialog(displey_O_X[2]);
    }
    if (displey_O_X[6] == displey_O_X[4] &&
        displey_O_X[6] == displey_O_X[2] &&
        displey_O_X[6] != "") {
      _showWinDialog(displey_O_X[6]);
    }
    if (displey_O_X[0] == displey_O_X[4] &&
        displey_O_X[0] == displey_O_X[8] &&
        displey_O_X[0] != "") {
      _showWinDialog(displey_O_X[0]);
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          title: Text('WINNER ' + "" + winner),
        );
      },
    );
  }
}
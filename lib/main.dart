import 'package:flutter/material.dart';
import 'dart:math';



void main() {
  runApp(const MyApp());
}

class Card {
  final String loyaltyOrder;
  final List<String> actions;
  final int redArrowPos;
  final int blackArrowPos;
  final String regionPriority;
  final String backUpperPos;
  final List<int> numberOrder;

  Card(this.loyaltyOrder, this.actions, this.redArrowPos, this.blackArrowPos, this.regionPriority, this.backUpperPos, this.numberOrder);
}

//R = RECTANGLE = KANDAHAR
//O = OCTAGON = HERAT
//S = STAR = PERSIA
//P = PENTAGON = KABUL
//A = DOUBLE STAR = TRANSCASPIA
//C = CIRCLE = PUNJAB




final List<Card> cards = [
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  Card("YPG", ["Move", "Battle", "Radicalize"], 1, 2, "APCSOR", "BOTTOM", [3,4,5,0,1,2]),
  Card("PGY", ["Radicalize a card that will gain Wakhan control of a region", "Build", "Radicalize"], 0, 5, "ORAPCS", "BOTTOM", [0,1,2,3,4,5]),
  Card("GPY", ["If Wakhan has no card with the move action, radicalize a card with move action", "Move", "Radicalize"], 1, 0, "SRPOCA", "BOTTOM", [5,0,1,2,3,4]),
  Card("YGP", ["Tax", "If military cards are favored, radicalize the highest ranked military card", "Radicalize"], 1, 2, "APRSOC", "TOP", [3,4,5,0,1,2]),
  Card("GYP", ["Battle on the highest priority court card with the most spies where Wakhan also has at least one spy", "Battle", "Radicalize"], 0, 3, "PASCRO", "BOTTOM", [2,3,4,5,0,1]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  // Add more cards as needed
];


late List<Card> shuffledCards;
int _cardIndex = 0;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pax Pamir - Wakhan Companion',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Pax Pamir - Wakhan Companion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _drawCard();
                _compareCards();
              },
              child: Text('Draw a Card'),
            ),
            SizedBox(height: 20),
            _buildCardInfo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _shuffleDeck() {
    shuffledCards = List.from(cards); // Make a copy of the original deck
    shuffledCards.shuffle(); // Shuffle the deck
  }


  void _drawCard() {
    if (_cardIndex < shuffledCards.length) {
      setState(() {
        _cardIndex++;
      });
    }
  }

  void _compareCards() {
      // Compare the drawn card with the top card from the deck
      if (_cardIndex < shuffledCards.length) {
        final drawnCard = shuffledCards[_cardIndex - 1];
        final topCard = shuffledCards[_cardIndex];
        // Compare the loyalty order, actions, or any other attributes as needed
      }
    }

  Widget _buildCardInfo() {
    if (_cardIndex < shuffledCards.length) {
      final card = shuffledCards[_cardIndex];
      return Column(
        children: [
          Text("Loyalty Order: ${card.loyaltyOrder}"),
          Text("Actions: ${card.actions.join(', ')}"),
          // Add more card attributes here
        ],
      );
    } else {
      return Text("No more cards");
    }
  }

  @override
  void initState() {
    super.initState();
    _shuffleDeck(); // Shuffle the deck at program start
  }
}
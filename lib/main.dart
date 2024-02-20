import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';




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

  // Creating a map with shape abbreviations and their corresponding full names
  Map<String, String> shapeMap = {
    'R': 'RECTANGLE',
    'O': 'OCTAGON',
    'S': 'STAR',
    'P': 'PENTAGON',
    'A': 'DOUBLE STAR',
    'C': 'CIRCLE',
  };

    // Creating a map with shape abbreviations and their corresponding full names
  Map<String, String> loyaltyMap = {
    'G': 'graphics/green.svg',
    'P': 'graphics/pink.svg',
    'Y': 'graphics/yellow.svg',
  };


//  ${shapeMap['R']}

final List<Card> cards = [
  Card("PGY", ["Move", "Betray", "Radicalize"], 1, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  Card("YPG", ["Move", "Battle", "Radicalize"], 1, 2, "APCSOR", "BOTTOM", [3,4,5,0,1,2]),
  Card("PGY", ["Radicalize a card that will gain Wakhan control of a region", "Build", "Radicalize"], 0, 5, "ORAPCS", "BOTTOM", [0,1,2,3,4,5]),
  Card("GPY", ["If Wakhan has no card with the move action, radicalize a card with move action", "Move", "Radicalize"], 1, 0, "SRPOCA", "BOTTOM", [5,0,1,2,3,4]),
  Card("YGP", ["Tax", "If military cards are favored, radicalize the highest ranked military card", "Radicalize"], 1, 2, "APRSOC", "TOP", [3,4,5,0,1,2]),
  Card("GYP", ["Battle on the highest priority court card with the most spies where Wakhan also has at least one spy", "Battle", "Radicalize"], 0, 3, "PASCRO", "BOTTOM", [2,3,4,5,0,1]),
  Card("GPY", ["If Wakhan has fewer spies than any other player then radicalize the highest ranked intelligence card", "Battle on the highest priority court card with the most spies where Wakhan also has at least one spy", "Radicalize"], 1, 1, "SAPCRO", "TOP", [4,5,0,1,2,3]),
  Card("YGP", ["If Wakhan has fewer than 2 Rupees, radicalize the card that will net the most rupees", "Build", "Radicalize"], 1, 1, "ROPASC", "BOTTOM", [2,3,4,5,0,1]),
  
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
          Text(
                "Pragmatic loyalty: ",
                style: TextStyle(
                  fontSize: 32, // Adjust font size
                  fontWeight: FontWeight.bold, // Apply bold style
                  fontStyle: FontStyle.italic, // Apply italic style
                  color: Colors.black, // Change text color
                ),
              ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              for (final loyalty in card.loyaltyOrder.characters)   // Use map to display images for each letter in card.loyaltyOrder
              SvgPicture.asset(
                loyaltyMap[loyalty] ?? '', // Load SVG from asset
                width: 48, // Adjust width as needed
                height: 48, // Adjust height as needed
              ),
              
            ],
          ),
          Text(
                "Action order: ",
                style: TextStyle(
                  fontSize: 32, // Adjust font size
                  fontWeight: FontWeight.bold, // Apply bold style
                  fontStyle: FontStyle.italic, // Apply italic style
                  color: Colors.black, // Change text color
                ),
              ),
          
          for (final action in card.actions)   // Use map to display images for each letter in card.loyaltyOrder
              Text(
                action,
                style: TextStyle(
                  fontSize: 16, // Adjust font size
                  fontStyle: FontStyle.italic, // Apply italic style
                  color: Colors.green, // Change text color
                ),
              ),
          
          // Add more card attributes here
        ],
      );
    } else {
      return Text(
        "No more cards",
        style: TextStyle(
          fontSize: 18, // Adjust font size
          fontWeight: FontWeight.bold, // Apply bold style
          color: Colors.red, // Change text color
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _shuffleDeck(); // Shuffle the deck at program start
  }
}
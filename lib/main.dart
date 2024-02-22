import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




void main() {
  runApp(const MyApp());
}

class Card {
  final String loyaltyOrder;
  final List<String> actions;
  final bool redArrowPos;
  final int blackArrowPos;
  final String regionPriority;
  final String backUpperPos;
  final List<int> numberOrder;

  Card(this.loyaltyOrder, this.actions, this.redArrowPos, this.blackArrowPos, this.regionPriority, this.backUpperPos, this.numberOrder);
}

  // Creating a map with shape abbreviations and their corresponding full names
  Map<String, String> shapeMap = {
    'R': 'graphics/rectangle.svg',
    'O': 'graphics/octagon.svg',
    'S': 'graphics/star.svg',
    'P': 'graphics/pentagon.svg',
    'A': 'graphics/double_star.svg',
    'C': 'graphics/circle.svg',
  };

    // Creating a map with shape abbreviations and their corresponding full names
  Map<String, String> loyaltyMap = {
    'G': 'graphics/green.svg',
    'P': 'graphics/pink.svg',
    'Y': 'graphics/yellow.svg',
  };

  Map<double, String> radPlace = {
    0 : 'LEFT',
    1 : 'RIGHT',
  };


//  ${shapeMap['R']}

final List<Card> cards = [
  Card("PGY", ["Move", "Betray", "Radicalize"], true, 4, "ROSPAC", "TOP", [1,2,3,4,5,0]),
  Card("YPG", ["Move", "Battle", "Radicalize"], true, 2, "APCSOR", "BOTTOM", [3,4,5,0,1,2]),
  Card("PGY", ["Radicalize a card that will gain Wakhan control of a region", "Build", "Radicalize"], false, 5, "ORAPCS", "BOTTOM", [0,1,2,3,4,5]),
  Card("GPY", ["If Wakhan has no card with the move action, radicalize a card with move action", "Move", "Radicalize"], true, 0, "SRPOCA", "BOTTOM", [5,0,1,2,3,4]),
  Card("YGP", ["Tax", "If military cards are favored, radicalize the highest ranked military card", "Radicalize"], true, 2, "APRSOC", "TOP", [3,4,5,0,1,2]),
  Card("GYP", ["Battle on the highest priority court card with the most spies where Wakhan also has at least one spy", "Battle", "Radicalize"], false, 3, "PASCRO", "BOTTOM", [2,3,4,5,0,1]),
  Card("GPY", ["If Wakhan has fewer spies than any other player then radicalize the highest ranked intelligence card", "Battle on the highest priority court card with the most spies where Wakhan also has at least one spy", "Radicalize"], true, 1, "SAPCRO", "TOP", [4,5,0,1,2,3]),
  Card("YGP", ["If Wakhan has fewer than 2 Rupees, radicalize the card that will net the most rupees", "Build", "Radicalize"], true, 1, "ROPASC", "BOTTOM", [2,3,4,5,0,1]),
  Card("PGY", ["Betray", "Battle on the highest priority court card with the most spies where Wakhan also has at least one spy", "Radicalize"], true, 5, "POCASR", "BOTTOM", [0,1,2,3,4,5]),
  Card("GPY", ["If political cards are favored, radicalize the highest ranked economic card", "Radicalize the highest ranked political card", "Radicalize"], false, 1, "SCROAP", "BOTTOM", [4,5,0,1,2,3]),
  Card("PYG", ["Tax", "Betray", "Radicalize"], true, 4, "ASCROP", "BOTTOM", [1,2,3,4,5,0]),
  Card("PGY", ["Radicalize a card that will gain Wakhan control of a region", "Battle", "Radicalize"], false, 1, "SROAPC", "TOP", [4,5,0,1,2,3]),
  Card("PYG", ["Tax", "Radicalize the highest ranked intelligence card", "Radicalize"], true, 3, "CSORAP", "TOP", [2,3,4,5,0,1]),
  Card("PYG", ["Radicalize the highest ranked political card", "If military cards are favored, radicalize the highest ranked military card", "Radicalize"], true, 3, "OCAPRS", "BOTTOM", [2,3,4,5,0,1]),
  Card("GYP", ["If no coalition has dominance, radicalize the card that would place the most spies and/or tribes", "If military cards are favored, radicalize the highest ranked military card", "Radicalize"], true, 0, "CSORPA", "TOP", [5,0,1,2,3,4]),
  Card("YPG", ["Tax", "Betray", "Radicalize"], false, 3, "PCROSA", "TOP", [2,3,4,5,0,1]),
  Card("PYG", ["Radicalize an intelligence card", "Move", "Radicalize"], false, 0, "OSAPCR", "TOP", [5,0,1,2,3,4]),
  Card("GYP", ["If no coalition has dominance, radicalize the card that would place the most spies and/or tribes", "Battle on the highest priority court card with the most spies where Wakhan also has at least one spy", "Radicalize"], false, 5, "CASRPO", "TOP", [0,1,2,3,4,5]),
  Card("YGP", ["If Wakhan has fewer than 2 Rupees, radicalize the card that will net the most rupees", "Build", "Radicalize"], false, 4, "RPOCAS", "TOP", [1,2,3,4,5,0]),
  Card("YPG", ["Radicalize the card that would place the most armies and/or roads", "If no coalition has dominance, radicalize the card that would place the most spies and/or tribes", "Radicalize"], true, 5, "PCRSOA", "TOP", [0,1,2,3,4,5]),
  Card("GYP", ["Build", "Move", "Radicalize"], true, 4, "CAPSRO", "BOTTOM", [1,2,3,4,5,0]),
  Card("YGP", ["Build", "Move", "Radicalize"], false, 2, "ROCAPS", "BOTTOM", [3,4,5,0,1,2]),
  Card("YPG", ["If Wakhans court size is at its limit, radicalize the highest ranked political card", "Tax", "Radicalize"], false, 0, "ARSOCP", "BOTTOM", [5,0,1,2,3,4]),
  Card("GPY", ["If a coalition has dominance, radicalize a matching patriot", "If no coalition has dominance, radicalize the card that would place the most spies and/or tribes", "Radicalize"], false, 2, "OPACSR", "TOP", [3,4,5,0,1,2]),
  // Add more cards as needed
];


late List<Card> shuffledCards;
int _cardIndex = 0;
double topValue = 0;
int colValue = 0;
String additionalText = '';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pax Pamir - Wakhan Companion',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Pax Pamir - Wakhan Companion'),
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




@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('graphics/background.jpg'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5), // Semi-transparent black color overlay
          ),
          Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const SizedBox(height: 20),
              _buildCardInfo(),
              Expanded(child: Align(alignment: Alignment.bottomCenter,
              child: Container(padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () {
                  _drawCard();
                  _compareCards();
                },
                child: const Text('Draw a Card'),
                )
                ))
              ),
            ],
          ),
        ),
        ),
      ],
    ),
    );
  }

  void _shuffleDeck() {
    shuffledCards = List.from(cards); // Make a copy of the original deck
    shuffledCards.shuffle(); // Shuffle the deck
    _drawCard();
    _compareCards();
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
        colValue = shuffledCards[_cardIndex].numberOrder[  shuffledCards[_cardIndex - 1].blackArrowPos  ];
        final redArrow = shuffledCards[_cardIndex - 1].redArrowPos;
        final topVal = shuffledCards[_cardIndex].backUpperPos;
        
        if (redArrow && topVal == "TOP") {
          topValue = 1;
          
        } else if (redArrow && topVal == "BOTTOM")  {
          topValue = 0;

        } else if (!redArrow && topVal == "TOP")  {
          topValue = 0;

        } else if (!redArrow && topVal == "BOTTOM")  {
          topValue = 1;

        }
        additionalText = radPlace[topValue] ?? ''; // Look up corresponding value in the map
        // Compare the loyalty order, actions, or any other attributes as needed
      }
    }

  Widget _buildCardInfo() {
    if (_cardIndex < shuffledCards.length) {
      final card = shuffledCards[_cardIndex];
      return Column(
        children: [
          SizedBox(
            width: 400,
            height: 200,
            child: Stack(
              children: <Widget>[
                const Image(
                  image: AssetImage('graphics/market.jpg'),
                  
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: colValue.toDouble() * 65 + 9,
                  top: topValue * 86 + 24,
                  child: SizedBox(
                    width: 58,
                    height: 80,
                    child: Container(color: Colors.red.withOpacity(0.5),
                    )
                  )
                )
              ],
            ),
          ),
          const Text(
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
          Container(
            padding: const EdgeInsets.only(top: 20),
          
            child: const Text(
                "Action order: ",
                style: TextStyle(
                  fontSize: 32, // Adjust font size
                  fontWeight: FontWeight.bold, // Apply bold style
                  fontStyle: FontStyle.italic, // Apply italic style
                  color: Colors.black, // Change text color
                ),
              ),
          ),
            for (final action in card.actions)   // Use map to display images for each letter in card.loyaltyOrder
            
              Container(
                width: 400,
                padding: const EdgeInsets.all(12),
                

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.orange, width: 2),
                ),
                child: Text(
                  action,
                  softWrap: true,
                  textAlign: TextAlign.center, // Align text to the center
                  style: const TextStyle(
                    fontSize: 20, // Adjust font size
                    fontStyle: FontStyle.italic, // Apply italic style
                    fontWeight: FontWeight.bold, // Apply bold style
                    color: Colors.black, // Change text color
                    
                  ),
                ),
              ),
            
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Align(alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Place radicalized cards to the ",
                  style: TextStyle(
                    fontSize: 16, // Adjust font size
                    fontWeight: FontWeight.bold, // Apply bold style
                    fontStyle: FontStyle.italic, // Apply italic style
                    color: Colors.black, // Change text color
                  ),
                ),
                Text(
                  radPlace[topValue] ?? '',
                  style: const TextStyle(
                    fontSize: 22, // Adjust font size
                    fontWeight: FontWeight.bold, // Apply bold style
                    fontStyle: FontStyle.italic, // Apply italic style
                    color: Colors.deepOrange, // Change text color
                  ),
                ),
              ],
            ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
          
          child: const Text(
                "Region Priority: ",
                style: TextStyle(
                  fontSize: 16, // Adjust font size
                  fontWeight: FontWeight.bold, // Apply bold style
                  fontStyle: FontStyle.italic, // Apply italic style
                  color: Colors.black, // Change text color
                ),
              ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              for (final region in card.regionPriority.characters)   // Use map to display images for each letter in card.loyaltyOrder
              SvgPicture.asset(
                shapeMap[region] ?? '', // Load SVG from asset
                width: 36, // Adjust width as needed
                height: 36, // Adjust height as needed
              ),
              
            ],
          ),// Add more card attributes here
        ],
      );
    } else {
      
      setState(() {
        _cardIndex = 0; // Reset _cardIndex
        //Trigger rebuild
        _shuffleDeck();
      });
      // Returning a placeholder widget while waiting for the UI to rebuild
      return Container(
                padding: const EdgeInsets.fromLTRB(100, 300, 100, 0),
                child: const Align(alignment: Alignment.center,
                child: Text(
                "Reached the end of deck! Press button to shuffle and draw.",
                textAlign: TextAlign.center, // Align text to the center

                style: TextStyle(
                  fontSize: 36, // Adjust font size
                  fontWeight: FontWeight.bold, // Apply bold style
                  color: Colors.black, // Change text color
                ),
              ),
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
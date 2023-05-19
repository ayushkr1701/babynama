// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final List<String> points;
  final List<String> addPoints;
  final String price;
  final String refund;

  const ExpandableCard({
    Key? key,
    required this.title,
    required this.points,
    required this.addPoints,
    required this.price,
    required this.refund,
  }) : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFBE7B),
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            // leading: Icon(
            //   Icons.check_circle,
            //   color: Colors.green,
            // ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (String point in widget.points)
                  Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: Colors.black,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          point,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                if (_isExpanded)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (String point in widget.addPoints)
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.black,
                              size: 16.0,
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                point,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${widget.price}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.refund}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _toggleExpansion,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFEED971)),
                      ),
                      child: Text(
                        _isExpanded ? 'Know Less' : 'Know More',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Thank you'),
                              content: Text('Your plan has started.'),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFFEED971)),
                                  ),
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFEED971)),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedDuration = 1;
  final List<List<Widget>> _cardSets = [];

  @override
  void initState() {
    super.initState();
    _generateCardSets();
  }

  void _generateCardSets() {
    _cardSets.clear();
    List<Widget> oneMonthCards = [];
    List<Widget> threeMonthsCards = [];

    if (_selectedDuration == 1) {
      oneMonthCards.add(
        ExpandableCard(
          title: 'Basic Care',
          points: const ['Pediatric care in 15 minutes'],
          addPoints: const [
            'Instant chat with pediatricians on WhatsApp',
            'Free pediatrician consultations(day)',
            'Live Yoga Sessions'
          ],
          price: '₹999 Per Month',
          refund: '',
        ),
      );
      oneMonthCards.add(
        ExpandableCard(
          title: 'Prime Care',
          points: const [
            'Pediatric care in 15 minutes, lactation, nutrition, monthly milestones, emergency support'
          ],
          addPoints: const [
            'Everything in Basic Care',
            '24x7 free pediatrician consultations',
            'Monthly growth and milestones tracking by pediatrician',
            'Lactation and Weaning Support'
          ],
          price: '₹1999 Per Month',
          refund: '',
        ),
      );
      oneMonthCards.add(
        ExpandableCard(
          title: 'Holistic Care',
          points: const [
            'Dedicated pediatrician for your baby, personal care plan, Best possible baby care'
          ],
          addPoints: const [
            'Everything in the PRIME Plan',
            'Dedicated pediatrician just for your baby',
            'Personalized care plan for your baby and you',
            'All Consultations and workshops free*',
            'We keep adding new services to provide more value to you'
          ],
          price: '₹3998 Per Month',
          refund: '',
        ),
      );

      _cardSets.add(oneMonthCards);
    } else if (_selectedDuration == 3) {
      threeMonthsCards.add(
        ExpandableCard(
          title: 'Basic Care',
          points: const ['Pediatric care in 15 minutes'],
          addPoints: const [
            'Instant chat with pediatricians on WhatsApp',
            'Free pediatrician consultations(day)',
            'Live Yoga Sessions'
          ],
          price: '₹2499 Per 3 Month',
          refund: '10 days refund policy',
        ),
      );
      threeMonthsCards.add(
        ExpandableCard(
          title: 'Prime Care',
          points: const [
            'Pediatric care in 15 minutes, lactation, nutrition, monthly milestones, emergency support'
          ],
          addPoints: const [
            'Everything in Basic Care',
            '24x7 free pediatrician consultations',
            'Monthly growth and milestones tracking by pediatrician',
            'Lactation and Weaning Support'
          ],
          price: '₹4999 Per Month',
          refund: '10 days refund policy',
        ),
      );
      threeMonthsCards.add(
        ExpandableCard(
          title: 'Holistic Care',
          points: const [
            'Dedicated pediatrician for your baby, personal care plan, Best possible baby care'
          ],
          addPoints: const [
            'Everything in the PRIME Plan',
            'Dedicated pediatrician just for your baby',
            'Personalized care plan for your baby and you',
            'All Consultations and workshops free*',
            'We keep adding new services to provide more value to you'
          ],
          price: '₹9999 Per 3 Month',
          refund: '10 days refund policy',
        ),
      );

      _cardSets.add(threeMonthsCards);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEED971), // Set the background color of the screen
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              // Set the background color of the title
              child: Column(
                children: [
                  Text(
                    'Babynama',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Stylish',
                      color: Color(
                        0xFFFFA351,
                      ),
                    ),
                  ),
                  Text(
                    'Our Care Plans',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDuration = 1;
                      _generateCardSets();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDuration == 1
                        ? Colors.grey[500]
                        : Color(
                            0xFFFFA351,
                          ),
                  ),
                  child: Text(
                    '1 Month',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDuration = 3;
                      _generateCardSets();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDuration == 3
                        ? Colors.grey[500]
                        : Color(0xFFFFA351),
                  ),
                  child: Text(
                    '3 Months',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: _cardSets.isNotEmpty ? _cardSets[0] : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

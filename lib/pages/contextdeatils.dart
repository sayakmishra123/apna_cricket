import 'package:flutter/material.dart';

class ContextDetails extends StatefulWidget {
  const ContextDetails({super.key});

  @override
  State<ContextDetails> createState() => _ContextDetailsState();
}

class _ContextDetailsState extends State<ContextDetails> {
  @override
  void initState() {

    super.initState();
  }

List<Map<String, dynamic>> indianCricketPlayers = [
  {
    'name': 'Virat Kohli',
    'type': 'Batsman',
    'totalPoints': 12000,
    'runs': 12000,
    'catches': 250,
    'sixes': 250,
    'fours': 1000,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Rohit Sharma',
    'type': 'Batsman',
    'totalPoints': 11000,
    'runs': 11000,
    'catches': 200,
    'sixes': 300,
    'fours': 900,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'KL Rahul',
    'type': 'Batsman',
    'totalPoints': 7000,
    'runs': 7000,
    'catches': 150,
    'sixes': 150,
    'fours': 600,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Shikhar Dhawan',
    'type': 'Batsman',
    'totalPoints': 10000,
    'runs': 10000,
    'catches': 180,
    'sixes': 200,
    'fours': 850,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Rishabh Pant',
    'type': 'Wicketkeeper-Batsman',
    'totalPoints': 5000,
    'runs': 5000,
    'catches': 220,
    'sixes': 100,
    'fours': 400,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Hardik Pandya',
    'type': 'All-rounder',
    'totalPoints': 6000,
    'runs': 3000,
    'catches': 100,
    'sixes': 150,
    'fours': 200,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Ravindra Jadeja',
    'type': 'All-rounder',
    'totalPoints': 7000,
    'runs': 2500,
    'catches': 150,
    'sixes': 100,
    'fours': 150,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Jasprit Bumrah',
    'type': 'Bowler',
    'totalPoints': 5000,
    'runs': 500,
    'catches': 50,
    'sixes': 10,
    'fours': 30,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Mohammed Shami',
    'type': 'Bowler',
    'totalPoints': 4000,
    'runs': 400,
    'catches': 40,
    'sixes': 5,
    'fours': 20,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Bhuvneshwar Kumar',
    'type': 'Bowler',
    'totalPoints': 4500,
    'runs': 450,
    'catches': 60,
    'sixes': 15,
    'fours': 25,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Shreyas Iyer',
    'type': 'Batsman',
    'totalPoints': 3000,
    'runs': 3000,
    'catches': 80,
    'sixes': 120,
    'fours': 250,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Ravichandran Ashwin',
    'type': 'All-rounder',
    'totalPoints': 5500,
    'runs': 2000,
    'catches': 140,
    'sixes': 70,
    'fours': 180,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Axar Patel',
    'type': 'All-rounder',
    'totalPoints': 3500,
    'runs': 1500,
    'catches': 110,
    'sixes': 50,
    'fours': 140,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Shardul Thakur',
    'type': 'Bowler',
    'totalPoints': 3000,
    'runs': 300,
    'catches': 90,
    'sixes': 20,
    'fours': 50,
    'image': 'https://picsum.photos/200/300'
  },
  {
    'name': 'Yuzvendra Chahal',
    'type': 'Bowler',
    'totalPoints': 3200,
    'runs': 320,
    'catches': 70,
    'sixes': 10,
    'fours': 40,
    'image': 'https://picsum.photos/200/300'
  }
];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView.builder(
        itemCount: indianCricketPlayers .length,
        itemBuilder: (context, index) {
          return  SizedBox(
              width: 100,
              child: Column(
                children: [
                  ExpansionTile(
                      
                    // collapsedShape: const ContinuousRectangleBorder(side: BorderSide(width: 0.2),),
                    backgroundColor: Colors.amberAccent[100],
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        height: 50,
                        width: 50,
                       'https://picsum.photos/id/$index/200/300',fit: BoxFit.cover,)),
                    title: Text(
                      indianCricketPlayers[index]['name'],
                      // style: TextStyle(
                      //     color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(indianCricketPlayers[index]['type']),
                    children:  [
                     
                      Container(
                   
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Run: ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                  indianCricketPlayers[index]['runs'].toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        
                      ),
                      Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    height: 0.2,color: Colors.black,),
                      Container(
                    
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Catch: ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                   indianCricketPlayers[index]['catches'].toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        
                      ),
                        Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    height: 0.2,color: Colors.black,),
                      Container(
                       
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Six: ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                                              indianCricketPlayers[index]['sixes'].toString(),
                              
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                    
                      ),
                       Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    height: 0.2,color: Colors.black,),
                      Container(
                  
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Four: ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                indianCricketPlayers[index]['fours'].toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                     
                      ),
                        Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 70),
                    height: 0.5,color: Colors.black,),
                       Container(
                   color: Colors.amber[400],
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Points: ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                indianCricketPlayers[index]['totalPoints'].toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 0.2,color: Colors.black,),
                    // const SizedBox(height: 10,),
                ],
              ));
        },
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(
                                colors: [Colors.red, Colors.black],
                                transform: GradientRotation(2))),
        ),
        title: const Text('Contest details',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

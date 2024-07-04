import 'package:flutter/material.dart';

class ContextDetails extends StatefulWidget {
  const ContextDetails({super.key});

  @override
  State<ContextDetails> createState() => _ContextDetailsState();
}

class _ContextDetailsState extends State<ContextDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
                width: 100,
                child: ExpansionTile(
                  backgroundColor: Colors.green,
                  title: Text(
                    'data',
                    // style: TextStyle(
                    //     color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Points: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Run: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Catch: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Six: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Six: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Four: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Context details'),
      ),
    );
  }
}

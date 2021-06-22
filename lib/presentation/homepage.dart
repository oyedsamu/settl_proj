import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _name = "Sade";
  final _balance = "200,000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/avatar.jpg"),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "Hi $_name,",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Icon(
                    Icons.notifications_sharp,
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              color: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 160,
                  color: Colors.deepPurple,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Primary account",
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NGN",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$_balance",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  fixedSize: Size(10, 10),
                                  padding: EdgeInsets.only(left: 5),
                                  primary: Colors.white.withOpacity(0.5),
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                label: Text("")),
                            width: 37,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Add Cash",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Get Started"),
            Container(
              height: 400,
              child: CustomScrollView(
                // padding: EdgeInsets.symmetric(horizontal: 25),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 60,
                          width: 40,
                          child: const Text("He'd have you all unravel at the"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 60,
                          width: 40,
                          child: const Text('Heed not the rabble'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 60,
                          width: 40,
                          child: const Text('Sound of screams but the'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 60,
                          width: 40,
                          child: const Text('Who scream'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transactions"),
                Text("See all"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              height: 100,
              child: Row(
                children: [],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _gridBuilder() {
    return Card(
      color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

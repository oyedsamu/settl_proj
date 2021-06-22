import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _name = "Sade";
  final _balance = "200,000";
  final _chosenName = "Chidi Obi";
  final _status = "Sent";
  final _transactionAmount = "- #150,000";
  final _transactionDate = "Aug 12, 2020";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_sharp),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_sharp),
            label: 'Settl Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Get Started"),
                ],
              ),
              Container(
                height: 340,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
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
                            child: Center(child: const Text("Send Money")),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 60,
                            width: 40,
                            child: Center(child: const Text('Request Money')),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 60,
                            width: 40,
                            child: Center(child: const Text('Create a Wallet')),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 60,
                            width: 40,
                            child: Center(
                                child: const Text('Upgrade your account')),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Transactions"),
                  Text("See all"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white60,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(2, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/avatar.jpg"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transfer to $_chosenName"),
                        Text(
                          "$_status",
                          style: TextStyle(color: Colors.deepPurple),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$_transactionAmount",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        Text(
                          "$_transactionDate",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 50),
            ],
          ),
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

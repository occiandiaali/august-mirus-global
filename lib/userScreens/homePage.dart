import 'package:flutter/material.dart';
import 'package:mirusglobal/adminScreens/admin_home.dart';
import 'package:mirusglobal/tools/Store.dart';
import 'package:mirusglobal/userScreens/itemDetailPage.dart';
import 'favsPage.dart';
import 'messagesPage.dart';
import 'cartPage.dart';
// import 'notificationPage.dart';
import 'profileSettingsPage.dart';
// import 'helpPage.dart';
import 'aboutPage.dart';
//import 'loginPage.dart';
import 'login_page.dart';
import 'sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: () => openAdmin(),
          child: Text('Mirus Global'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return FavsPage();
              }));
            },
          ),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CartPage(); // button launch cart screen
                  }));
                },
              ),
              CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
                child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: storeItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  // new inserted
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemDetailPage(
                              itemImage: storeItems[index].itemImage,
                              itemName: storeItems[index].itemName,
                              itemPrice: storeItems[index].itemPrice,
                              itemRating: storeItems[index].itemRating,
                            )));
                  },
                  child: Card(
                    child: Stack(
                      alignment: FractionalOffset.topLeft,
                      children: <Widget>[
                        Stack(
                          alignment: FractionalOffset.bottomCenter,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(
                                        storeItems[index].itemImage)),
                              ),
                            ),
                            Container(
                              height: 35.0,
                              color: Colors.black.withAlpha(100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      storeItems[index].itemName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '₦${storeItems[index].itemPrice}',
                                      style: TextStyle(
                                        color: Colors.purple[500],
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // space stars and heart
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly, // space star and rating
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15.0,
                                  ),
                                  Text(
                                    '${storeItems[index].itemRating}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.favorite_border,
                                    color: Colors.red), // favs icon
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return MessagesPage();
          }));
        },
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Icon(Icons.message),
            // CircleAvatar(
            //   radius: 8.0,
            //   backgroundColor: Colors.red,
            //   child: Text(
            //     '0',
            //     style: TextStyle(color: Colors.white, fontSize: 12.0),
            //   ),
            // ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('occian_mama'), // see here
              accountEmail: Text('ocean.diaali@gmail.com'), // see here
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 20.0,
                ),
              ),
              title: Text('Profile settings'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProfileSettingsPage();
                }));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications,
                  size: 20.0,
                ),
              ),
              title: Text('Notifications'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.history,
                  size: 20.0,
                ),
              ),
              title: Text('Order history'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.help_outline,
                  size: 20.0,
                ),
              ),
              title: Text('FAQs'),
            ),
            Divider(),
            ListTile(
              trailing: CircleAvatar(
                child: Icon(
                  Icons.info_outline,
                  size: 20.0,
                ),
              ),
              title: Text('About Us & Support'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return AboutPage();
                }));
              },
            ),
            ListTile(
              trailing: CircleAvatar(
                child: Icon(
                  Icons.exit_to_app,
                  size: 20.0,
                ),
              ),
              title: Text('Logout'),
              onTap: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return signOutGoogle();
                // }));
              },
            ),
          ],
        ),
      ),
    );
  }

  openAdmin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AdminHome()));
  }
} // class

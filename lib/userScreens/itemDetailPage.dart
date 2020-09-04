import 'package:flutter/material.dart';
import 'package:mirusglobal/userScreens/cartPage.dart';

class ItemDetailPage extends StatefulWidget {
  final String itemName;
  final String itemImage;
  final String itemSubName;
  final double itemPrice;
  final double itemRating;

  ItemDetailPage(
      {this.itemName,
      this.itemImage,
      this.itemPrice,
      this.itemRating,
      this.itemSubName});
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Item Detail')),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: 300.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.itemImage),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                  bottomLeft: Radius.circular(120.0),
                )),
          ),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                  bottomLeft: Radius.circular(120.0),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Card(
                    child: Container(
                      width: screenSize.width,
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            widget.itemName,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '₦${widget.itemPrice}',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${widget.itemRating}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                        width: screenSize.width,
                        height: 150.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 5.0, right: 5.0),
                                    height: 140.0,
                                    width: 100.0,
                                    child: Image.network(widget.itemImage),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 5.0, right: 5.0),
                                    height: 140.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withAlpha(50)),
                                  ),
                                ],
                              );
                            })),
                  ),
                  Card(
                    child: Container(
                      width: screenSize.width,
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Lorem ipsum factum dos vobiscum, Lorem ipsum factum dos vobiscum. Lorem ipsum factum dos vobiscum, Lorem ipsum factum dos vobiscum. Lorem ipsum factum dos vobiscum, Lorem ipsum factum dos vobiscum',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CartPage()));
            },
            foregroundColor: Colors.black54,
            backgroundColor: Colors.yellow[600],
            child: Icon(Icons.shopping_cart),
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: Text(
              '0',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // color: Theme.of(context).primaryColor,
        elevation: 0.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 20.0,
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                  onPressed: null,
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  )),
              FlatButton(
                  onPressed: null,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 31.0,
                  ))
              // Container(
              //   width: (screenSize.width - 20) / 2,
              //   child: Text(
              //     'Add To Favourites',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18.0,
              //         fontWeight: FontWeight.w700),
              //   ),
              // ),
              // Container(
              //   width: (screenSize.width - 20) / 2,
              //   child: Text(
              //     'Buy Now',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18.0,
              //         fontWeight: FontWeight.w700),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

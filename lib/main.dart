import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soug/helpers/Dios.dart';
import 'package:soug/model/Product.dart';
import 'package:soug/widgets/MiniWidgets.dart';

import 'colors.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'كل المدن';
  String typeValue = 'الكل';
  var conn = Dios();
  List<Product> products = [];
  List<Image> sliders = [];
  List<String> spinnerItems = [
    'كل المدن',
    'makka',
    'Two',
    'Three',
    'Four',
    'Five'
  ];
  List<String> type = ['الكل', 'جديد', 'مستعمل'];
  @override
  void initState() {
    super.initState();
    
    conn.getProducts().then((list) {
      setState(() {
        products = list;
        print(products.length);
      });
    });
    conn.getImageSlider().then((list) {
      list.forEach((item) {
        sliders.add(item.widget);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: menu(),
            color: PrimaryColor,
          ),
          appBar: null,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {},
                                color: PrimaryColor,
                                child: Text(
                                  "القائمة",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    side: BorderSide(color: PrimaryColor)),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text("سوق الماركات المستعملة",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: PrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21))),
                              RaisedButton(
                                onPressed: () {},
                                color: PrimaryColor,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    side: BorderSide(color: PrimaryColor)),
                                elevation: 8,
                                child: Text(
                                  "اضافة اعلان",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          CarouselSlider(
                            items: sliders,
                            height: 100,
                            aspectRatio: 1 / 1,
                            viewportFraction: 0.8,
                            initialPage: 2,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            pauseAutoPlayOnTouch: Duration(seconds: 10),
                            enlargeCenterPage: true,
                            onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String data) {
                                  setState(() {
                                    dropdownValue = data;
                                  });
                                },
                                items: spinnerItems
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              DropdownButton<String>(
                                value: typeValue,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String data) {
                                  setState(() {
                                    typeValue = data;
                                  });
                                },
                                items: type.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: products.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, postion) {
                              return Row(
                                children: <Widget>[
                                  Image.network(
                                    "http://muhana9.com/markapp/uploads/" +
                                        products[postion].image,
                                    height: 100,
                                    width: 100,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            products[postion].name,
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                      MiniWidgets()
                                          .cardDetils(products, postion),
                                      RaisedButton(
                                        onPressed: null,
                                        color: PrimaryColor,
                                        child: Text(
                                          "التفاصيل",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  callbackFunction(int index) {}

  menu() {
    return TabBar(
      isScrollable: true,
      tabs: [
        Tab(
          text: "الكل",
        ),
        Tab(
          text: "ساعات",
        ),
        Tab(
          text: "نظارات",
        ),
        Tab(
          text: "محافظ",
        ),
        Tab(
          text: "اكسسوارات",
        ),
        Tab(
          text: "ملابس",
        ),
        Tab(
          text: "احذية",
        ),
        Tab(
          text: "شنط",
        ),
        Tab(
          text: "اقلام",
        ),
        Tab(
          text: "اخرى",
        ),
      ],
    );
  }
}

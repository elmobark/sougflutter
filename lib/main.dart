
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soug/helpers/Dios.dart';
import 'package:soug/model/Product.dart';
import 'package:soug/widgets/MiniWidgets.dart';
//import 'package:carousel_slider/carousel_slider.dart';


import 'colors.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
  List <String> spinnerItems = [
    'كل المدن',
    'One', 
    'Two', 
    'Three', 
    'Four', 
    'Five'
    ] ;
    List<String> type = [
      'الكل',
      'جديد',
      'مستعمل'
    ];
  @override
  void initState() {
    
    super.initState();
      conn.getProducts().then((list){
        setState(() {
          products = list;
          print(products.length);
        });
        });
        conn.getImageSlider().then((list){
          list.forEach((item){
            sliders.add(item.widget);
          });
        });
  }
  // void _incrementCounter() {
  //   setState(() {
  //     conn.getImageSlider().then( (list){
  //       print(list.length);
  //     }
        
  //     );
      
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     //++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
  
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
   
        return SafeArea(
              child: DefaultTabController(
                length: 10,
                          child: Scaffold(
                            bottomNavigationBar: BottomAppBar(child: menu()
                            ,color: PrimaryColor,),
                            appBar: null,
                            body: SingleChildScrollView(
                                child: Center(
                                // Center is a layout widget. It takes a single child and positions it
                                // in the middle of the parent.
                                child: Column(
                                  
                                  // Column is also a layout widget. It takes a list of children and
                                  // arranges them vertically. By default, it sizes itself to fit its
                                  // children horizontally, and tries to be as tall as its parent.
                                  //
                                  // Invoke "debug painting" (press "p" in the console, choose the
                                  // "Toggle Debug Paint" action from the Flutter Inspector in Android
                                  // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                                  // to see the wireframe for each widget.
                                  //
                                  // Column has various properties to control how it sizes itself and
                                  // how it positions its children. Here we use mainAxisAlignment to
                                  // center the children vertically; the main axis here is the vertical
                                  // axis because Columns are vertical (the cross axis would be
                                  // horizontal).
                                  //mainAxisAlignment: MainAxisAlignment.,
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                                              
                                              RaisedButton(onPressed: () {},
                                              color: PrimaryColor,
                                              child: Text("القائمة",style: TextStyle(color: Colors.white),),
                                              shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(5.0),
                                              side: BorderSide(color: PrimaryColor)),)
                                              ,Expanded(flex: 1,child: Text("سوق الماركات المستعملة"
                                              ,textAlign: TextAlign.center
                                              ,style: TextStyle(color: PrimaryColor
                                              ,fontWeight: FontWeight.bold
                                              ,fontSize: 21)))
                                              ,RaisedButton(onPressed: () {},
                                              color: PrimaryColor,
                                              shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(5.0),
                                              side: BorderSide(color: PrimaryColor)),
                                              elevation: 8,
                                            
                                              child: Text("اضافة اعلان",style: TextStyle(color: Colors.white),),)
                                            ],),
                                            CarouselSlider(
                                              items: sliders,
                                          height: 100,
                                          aspectRatio: 1/1,
                                          viewportFraction: 0.8,
                                          initialPage: 2,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlay: true,
                                          autoPlayInterval: Duration(seconds: 3),
                                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          pauseAutoPlayOnTouch: Duration(seconds: 10),
                                          enlargeCenterPage: true,
                                          onPageChanged: callbackFunction,
                                             scrollDirection: Axis.horizontal,
                                           ),
                                            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                                               DropdownButton<String>(
                                              value: dropdownValue,
                                               icon: Icon(Icons.arrow_drop_down),
                                               iconSize: 24,
                                              elevation: 16,
                                              style: TextStyle(color: Colors.black, fontSize: 18),
                                              underline: Container(
                                                height: 2,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              onChanged: (String data) {
                                                setState(() {
                                                  dropdownValue = data;
                                                });
                                              },
                                              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
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
                                              style: TextStyle(color: Colors.black, fontSize: 18),
                                              underline: Container(
                                                height: 2,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              onChanged: (String data) {
                                                setState(() {
                                                  typeValue = data;
                                                });
                                              },
                                              items: type.map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              )
                                            ],),
                                              
                                        ListView.builder(scrollDirection: Axis.vertical,shrinkWrap: true,itemCount: products.length,physics: BouncingScrollPhysics(),
                                        itemBuilder: (context,postion){
                                          return Row(children: <Widget>[
                                            Image.network("http://muhana9.com/markapp/uploads/"+products[postion].image
                                            ,height: 100,width: 100,),
                                            Column(children: <Widget>[
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(products[postion].name,textAlign: TextAlign.right,),
                                                ],
                                              ),
                                              MiniWidgets().cardDetils(products, postion),
                                              RaisedButton(onPressed: null,color: PrimaryColor,child: Text("التفاصيل",style: TextStyle(color: Colors.white),
                                              ),)
                                            ],)
                                          ],);
                                        },)
                                      ],
                                    ),
                                  ),
                                ),
                                
          
                                 ],
                               ),
                           ),
                            ), // This trailing comma makes auto-formatting nicer for build methods.
                         ),
          ),
                     );
                   }


                 
                   callbackFunction(int index) {
                }
              
                menu() {return TabBar(isScrollable: true,
                
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
      );}
}

import 'package:flutter/material.dart';
import 'package:android_apk/Nav.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shopping List',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      routes: {
        'home':(context) => ShoppingList(),
        'secondPage': (context) => SecondPage(),
      },
      initialRoute: 'home',
    );
  }
}



class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();

}

class _ShoppingListState extends State<ShoppingList> {
  final List<ShopItem> _items = <ShopItem>[];

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController itemToAdd = new TextEditingController();

//Add item text box
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Add Item',
            ),
            content: TextField(
              controller: itemToAdd,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Cancel'),
                textColor: Colors.red[400],
                onPressed: () {
                  Navigator.of(context).pop();
                },),
              MaterialButton(
                  elevation: 5.0,
                  child: Text('Add'),
                  textColor: Colors.green[400],
                  onPressed: () {
                    Navigator.of(context).pop(itemToAdd.text.toString());
                  },),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shopping List'),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            createAlertDialog(context).then((value) {
              if (value.isNotEmpty) {
                setState(() {
                  _items.add(ShopItem(value, false));
                });
              }
            });
          },
          tooltip: 'Add Item',
          child: new IconTheme(data: new IconThemeData(
              color: Colors.blue[900]),
              child: Icon(Icons.add))
      ),

          //Side menu
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children:  <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                child: Text(
                  'My Shopping List Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),

                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Developer'),
                      onTap: () => navigateToPage(context, 'secondPage'),
                    ),
                  ],
                ),
              ),
      );
  }



  Widget _buildList() {
    return ListView.builder(
      padding: EdgeInsets.all(18.0),
      itemBuilder: (BuildContext _context, int i) {
        if (_items.isEmpty) {
          return Text('Click \'+\' To Start Your List:');
        } else {
          return _buildItem(_items[i]);
        }
      },
      itemCount: _items.isEmpty ? 1 : _items.length,
    );
  }

  Widget _buildItem(ShopItem item) {
    final TextStyle _itemStyle = TextStyle(
        fontSize: 20,
        decoration:
        item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        color: item.isCompleted ? Colors.black38 : Colors.black87);

    return ListTile(
      title: Text(
        item.name,
        style: _itemStyle,
      ),
      trailing: Checkbox(
          value: item.isCompleted,
          onChanged: (value) {
            setState(() {
              item.isCompleted = value;
            });
          }),
    );
  }

  navigateToPage(BuildContext context, String page) {
      Navigator.of(context).pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
    }
}


class ShopItem {
  final String name;
  bool isCompleted;

  ShopItem(this.name, this.isCompleted);
}



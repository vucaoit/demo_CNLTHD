import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: demoDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child:
                // demoContainer(),
                // demoExpanded(),
                // demoSizeBox(),
                // demoColumn()
                //   demoRow()
                //   demoListView()
                //   demoListView_builder()
                //   demoListView_separated()
                //   demoListView_icon()
                // demoStack()
          // demoButton()
          //   demoTextInput()
          // demoAlertDialog()
          // demoDataTable()
          demoImage()
        ));
  }

  Widget demoContainer() {
    return Container(
      color: Colors.red,
      child: const Text("Example about Container widget",
          style: TextStyle(fontSize: 50, backgroundColor: Colors.green)),
    );
  }

  Widget demoExpanded() {
    return Column(children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Expanded(
        child: Container(
          color: Colors.amber,
          width: 100,
        ),
      ),
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      )
    ]);
  }

  Widget demoSizeBox() {
    return const SizedBox(
      width: 200.0,
      height: 300.0,
      child: Card(
          color: Colors.red,
          child: Text(
            'Hello World!',
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget demoColumn() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.black,
          child: const Text(
            "Column number 1",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          child: const Text(
            "Column number 2",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget demoRow() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.black,
          child: const Text(
            "Row number 1",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          child: const Text(
            "Row number 2",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget demoListView_default() {
    return ListView(
      children: const <Widget>[
        ListTile(
          title: Text('Dog'),
        ),
        ListTile(
          title: Text('Cat'),
        ),
        ListTile(
          title: Text('Rabbit'),
        ),
      ],
    );
  }

  Widget demoListView_builder() {
    final europeanCountries = [
      'Albania',
      'Andorra',
      'Armenia',
      'Austria',
      'Azerbaijan',
      'Belarus',
      'Belgium',
      'Bosnia and Herzegovina',
      'Bulgaria',
      'Croatia',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Estonia',
      'Finland',
      'France',
      'Georgia',
      'Germany',
      'Greece',
      'Hungary',
      'Iceland',
      'Ireland',
      'Italy',
      'Kazakhstan',
      'Kosovo',
      'Latvia',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Macedonia',
      'Malta',
      'Moldova',
      'Monaco',
      'Montenegro',
      'Netherlands',
      'Norway',
      'Poland',
      'Portugal',
      'Romania',
      'Russia',
      'San Marino',
      'Serbia',
      'Slovakia',
      'Slovenia',
      'Spain',
      'Sweden',
      'Switzerland',
      'Turkey',
      'Ukraine',
      'United Kingdom',
      'Vatican City'
    ];
    return ListView.builder(
      itemCount: europeanCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(europeanCountries[index]),
        );
      },
    );
  }

  Widget demoListView_separated() {
    return ListView.separated(
      itemCount: 1000,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('row $index'),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  Widget demoListView_icon() {
    return ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text('Sun'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.brightness_3),
          title: Text('Moon'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('Star'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }

  Widget demoStack() {
    return SizedBox(
        width: 300,
        height: 300,
        child: Center(
            child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ), //Container
            Container(
              width: 250,
              height: 250,
              color: Colors.black,
            ), //Container
            Container(
              height: 200,
              width: 200,
              color: Colors.purple,
            ), //Container
          ], //<Widget>[]
        )));
  }

  Widget demoDrawer(){
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
  Widget demoButton(){
    String dropdownvalue = 'Apple';
    var items = [
      'Apple',
      'Banana',
      'Grapes',
      'Orange',
      'watermelon',
      'Pineapple'
    ];

    return Container(
      child: Column(
        children: [
          DropdownButton(
            value: dropdownvalue,
            icon: Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(), onChanged: (String? value) {  },
          ),
          ElevatedButton(
            child: Text("Default ElevatedButton"),
            onPressed: () {},
          ),
      IconButton(
        icon: Icon(Icons.add_alarm),
        onPressed: () {
        }
      ),
          OutlinedButton(
            onPressed: () {  },
            child: Text("Oulined button"),
          ),
          PopupMenuButton(
              icon: const Icon(
                Icons.menu,
                size: 50,
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text("First"),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text("Second"),
                  value: 2,
                )
              ])
        ],
      ),
    );
  }
  Widget demoTextInput(){
    return const TextField(
        decoration: InputDecoration(
        border: OutlineInputBorder(),
    labelText: 'Password',
    hintText: 'Enter Password',
    ),
      obscureText: true,//type password
      enableSuggestions: false,
      autocorrect: false,);
  }
  Widget demoAlertDialog(){
    return ElevatedButton(
      child: Text('Show alert'),
      onPressed: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
      title: const Text('AlertDialog Title'),
      content: const Text('AlertDialog description'),
      actions: <Widget>[
      TextButton(
      onPressed: () => Navigator.pop(context, 'Cancel'),
      child: const Text('Cancel'),
      ),
      TextButton(
      onPressed: () => Navigator.pop(context, 'OK'),
      child: const Text('OK'),
    ),
    ],
    )
    )
    );
  }
  Widget demoDataTable(){
    return Container(
      child: Column(
        children: [
          DataTable(
            columns: const [
              DataColumn(label: Text('RollNo')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Class')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Arya')),
                DataCell(Text('6')),
              ]),
              DataRow(cells: [
                DataCell(Text('12')),
                DataCell(Text('John')),
                DataCell(Text('9')),
              ]),
            ],
          ),
    ],
      ),
    );
  }
  Widget demoImage(){
    return Image.network(
      'https://nordiccoder.com/app/uploads/2020/07/flutter-logo-sharing.png',
    );
  }
}

import 'package:flutter/material.dart';
void main() {runApp(MyApp());}
class MyInheritedWidget extends InheritedWidget {
  final int myData;
  const MyInheritedWidget({required Widget child, required this.myData}) : super(child: child);
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return false;
  }
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();}
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Inheritic widget example'),),
        body: const MyHomePage(),),);
  }}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}
class MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyInheritedWidget(
        child: const MyCenterWidget(),
        myData: counter,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),);
  }}
class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyText(),);
  }}
class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final counter = MyInheritedWidget.of(context)?.myData;
    return Text('$counter');
  }}

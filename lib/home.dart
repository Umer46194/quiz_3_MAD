// home.dart
import 'package:flutter/material.dart';

class ContainerLeft extends StatelessWidget {
  const ContainerLeft();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 40.0,
      width: 40.0,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final List<IconData> _iconList = [Icons.home, Icons.star, Icons.circle];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Tree'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return HeaderWidget(index: index);
                  } else if (index >= 1 && index <= 3) {
                    return RowWithCardWidget(index: index);
                  } else {
                    return RowWidget(index: index);
                  }
                },
              ),
              SizedBox(height: 16.0), // Spacer between ListView and GridView
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: 20, // Adjust this count as needed
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        print('Tapped on index $index');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            _iconList[index % _iconList.length],
                            size: 48.0,
                            color: Colors.blue,
                          ),
                          Divider(),
                          Text(
                            'Index $index',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHorizontalRow() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 40.0,
          width: 40.0,
        ),
        Padding(padding: EdgeInsets.all(16.0)),
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 40.0,
            width: 40.0,
          ),
        ),
        Padding(padding: EdgeInsets.all(16.0)),
        Container(
          color: Colors.brown,
          height: 40.0,
          width: 40.0,
        ),
      ],
    );
  }

  Row _buildRowAndColumn() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.yellow,
              height: 60.0,
              width: 60.0,
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Container(
              color: Colors.amber,
              height: 40.0,
              width: 40.0,
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Container(
              color: Colors.brown,
              height: 20.0,
              width: 20.0,
            ),
            Divider(),
            _buildRowAndStack(),
            Divider(),
            Text('End of the Line'),
          ],
        ),
      ],
    );
  }

  Row _buildRowAndStack() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 100.0,
          child: Stack(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.yellow,
              ),
              Container(
                height: 60.0,
                width: 60.0,
                color: Colors.amber,
              ),
              Container(
                height: 40.0,
                width: 40.0,
                color: Colors.brown,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final int index;
  const HeaderWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blueAccent,
      child: Text(
        'Header Widget - Index $index',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class RowWithCardWidget extends StatelessWidget {
  final int index;
  const RowWithCardWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.star, color: Colors.orange),
            SizedBox(width: 16.0),
            Text('Row with Card - Index $index'),
          ],
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final int index;
  const RowWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.green),
          SizedBox(width: 16.0),
          Text('Row Widget - Index $index'),
        ],
      ),
    );
  }
}

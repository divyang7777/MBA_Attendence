import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  _appBar() {
    var _onDateChange;
    return new AppBar(
      leading: new Image.asset('images/planet.png'),
      backgroundColor: Colors.green.shade600,
      title: new Column(
        children: <Widget>[
          // new DateTime(
          //   new DayPicker(
          //   currentDate: new DateTime.now(),
          //   displayedMonth: new DateTime(2018),
          //   firstDate: new DateTime(2017),
          //   lastDate: new DateTime(2019),
          //   onChanged: (DateTime value) {},
          //   selectedDate: new DateTime.now(),
          // ),
          new CupertinoDatePicker(
            onDateTimeChanged: _onDateChange,
            initialDateTime: new DateTime.now(),
          ),
          new Text(
            'Date',
            style: new TextStyle(color: Colors.white),
          ),
          new Text(
            'Center',
            style: new TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
      actions: <Widget>[
        new IconButton(
          icon: Icon(Icons.person_add),
          onPressed: () => debugPrint("pressed add Person icon"),
        ),
        new PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: new Text('Change Date'),
              ),
              PopupMenuItem(
                child: new Text('Attendance summary'),
              ),
              PopupMenuItem(
                child: new Text('Save Excel'),
              ),
              PopupMenuItem(
                child: new Text('Share Excel'),
              ),
              PopupMenuItem(
                child: new Text('Edit Person Details'),
              ),
              PopupMenuItem(
                child: new Text('About'),
              ),
            ];
          },
        )
      ],
    );
  }

  _bodyView() {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          'Sellect All',
          style: new TextStyle(color: Colors.grey),
        ),
        actions: <Widget>[
          new Checkbox(
            onChanged: null,
            value: true,
            activeColor: Colors.blue,
            tristate: true,
          )
        ],
      ),
      body: new Container(
          alignment: Alignment.center,
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int i) {
              if (i.isOdd) return Divider();
              final index = i ~/ 2 + 1;
              return _buildRow(index);
            },
          )),
    );
  }

  Widget _buildRow(index) {
    return ListTile(
      leading: new Text("$index"),
      title: new Text('Names'),
      trailing: new Checkbox(
        onChanged: null,
        value: true,
        tristate: true,
        activeColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: _appBar(),
      body: _bodyView(),
    );
  }
}

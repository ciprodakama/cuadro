import 'package:flutter/material.dart';
import 'package:cuadro/widgets/custom_textfield.dart';
import 'package:cuadro/screens/paint_screen.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key key}) : super(key: key);

  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  _CreateRoomScreenState() {
    _maxRoundsValue = _roundsList[0];
    _roomSizeValue = _roomsizeList[0];
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();

  final _roundsList = ["1", "2", "3", "4", "5"];
  final _roomsizeList = ["2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String _maxRoundsValue = "";
  String _roomSizeValue = "";

  //late String? _maxRoundsValue;
  //late String? _roomSizeValue;

  void createRoom() {
    print("Sending these values: Rounds->" +
        _maxRoundsValue.toString() +
        "nPlayers->" +
        _roomSizeValue.toString());

    if (_nameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty &&
        _maxRoundsValue != null &&
        _roomSizeValue != null) {
      Map data = {
        "nickname": _nameController.text,
        "name": _roomNameController.text,
        "occupancy": _roomSizeValue,
        "maxRounds": _maxRoundsValue
      };
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PaintScreen(data: data, screenFrom: 'createRoom')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create Room",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _nameController,
              hintText: "Enter your name",
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _roomNameController,
              hintText: "Enter Room Name",
            ),
          ),
          SizedBox(height: 20),
          /*
          DropdownButton(
              value: _nRounds,
              items: _roundsList.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _nRounds = val as String;
                });
              }),
          */
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButtonFormField<String>(
              focusColor: Color(0xffF5F6FA),
              value: _maxRoundsValue,
              items: _roundsList.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _maxRoundsValue = val;
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.blue,
              ),
              decoration: InputDecoration(
                labelText: "Select Number of Rounds",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButtonFormField<String>(
              focusColor: Color(0xffF5F6FA),
              value: _roomSizeValue,
              menuMaxHeight: 250,
              items: _roomsizeList.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _roomSizeValue = val;
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.blue,
              ),
              dropdownColor: const Color(0xffF5F6FA),
              decoration: InputDecoration(
                labelText: "Select Room Size",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: createRoom,
            child: const Text(
              "Create",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle:
                    MaterialStateProperty.all(TextStyle(color: Colors.white)),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width / 2.5, 50))),
          ),
        ],
      ),
    );
  }
}


/*
import 'package:cuadro/screens/paint_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuadro/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController roomController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  late String? _roomSizeValue;
  late String? _maxRoundsValue;

  void createRoom() {
    if (nameController.text.isNotEmpty &&
        roomController.text.isNotEmpty &&
        _maxRoundsValue != null &&
        _roomSizeValue != null) {
      Map<String, String> data = {
        "nickname": nameController.text,
        "name": roomController.text,
        "occupancy": _maxRoundsValue!,
        "maxRounds": _roomSizeValue!
      };
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PaintScreen(data: data, screenFrom: 'createRoom')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter all the fields"),
        ),
      );
    }
  }

  /*
() {
              if (nameController.text.isNotEmpty &&
                  roomController.text.isNotEmpty &&
                  _chosenValue != null &&
                  _maxRoundsValue != null) {
                Map<String, String> data = {
                  "nickname": nameController.text,
                  "name": roomController.text,
                  "occupancy": _chosenValue,
                  "maxRounds": _maxRoundsValue
                };

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PaintScreen(
                          data: data,
                          screenFrom: "createRoom",
                        )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please enter all the fields"),
                  ),
                );
              }
            }
    */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Room",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  filled: true,
                  fillColor: Color(0xffF5F6FA),
                  hintText: "Enter Your Name",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: roomController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  filled: true,
                  fillColor: Color(0xffF5F6FA),
                  hintText: "Enter Room Name",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            focusColor: Color(0xffF5F6FA),
            value: _maxRoundsValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>["2", "5", "10", "15"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                .toList(),
            hint: Text(
              "Select Max Rounds",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String? value) {
              setState(() {
                _maxRoundsValue = value!;
              });
            },
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            focusColor: Color(0xffF5F6FA),
            value: _roomSizeValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>["2", "3", "4", "5", "6", "7", "8"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                .toList(),
            hint: Text(
              "Select Room Size",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String? value) {
              setState(() {
                _roomSizeValue = value!;
              });
            },
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: createRoom,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: Text(
              "Create",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
*/
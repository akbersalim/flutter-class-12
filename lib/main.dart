import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ViewAll());

class ViewAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SingleChildScrollView(child: MyBody())),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  var name = [
    "Reuel",
    "Rahul",
    "Akhil",
    "Keyser",
    "Kate",
    "Patrick",
    "Jane",
    "Mob",
    "Bryan",
    "Kim",
    "Jim"
  ];
  var age = [21, 23, 30, 25, 23, 30, 27, 25, 21, 26, 25];
  var rollno = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController rnocontroller = TextEditingController();
    TextEditingController agecontroller = TextEditingController();
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  labelText: "Enter name ",
                  labelStyle: TextStyle(color: Colors.purple),
                  hintText: "Name:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: agecontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  labelText: "Enter age ",
                  labelStyle: TextStyle(color: Colors.purple),
                  hintText: "Age:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: rnocontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  labelText: "Enter roll no:  ",
                  labelStyle: TextStyle(color: Colors.purple),
                  hintText: "Roll No:",
                  border: OutlineInputBorder()),
            ),
            RaisedButton(
              elevation: 10.0,
              highlightElevation: 1.0,
              splashColor: Colors.purpleAccent,
              onPressed: () {
                var nam = namecontroller.text;
                var rno = rnocontroller.text;
                var ag = agecontroller.text;
                namecontroller.clear();
                rnocontroller.clear();
                agecontroller.clear();
                setState(() {
                  name.add(nam.toString());
                  rollno.add(int.parse(rno));
                  age.add(int.parse(ag));
                });
              },
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
              child: Text(
                "ENTER",
                style: TextStyle(color: Colors.purple),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: name.length == null ? 0 : name.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 50.0,
                      ),

                      /*ClipOval(
                        child: Image(
                          image: NetworkImage(imag[index]),
                          height: 40.0,
                        ),
                      ),*/
                      trailing: MaterialButton(
                          onPressed: () {
                            setState(() {
                              name.removeAt(index);
                              age.removeAt(index);
                              rollno.removeAt(index);
                            });
                          },
                          highlightColor: Colors.purpleAccent,
                          shape: CircleBorder(),
                          elevation: 20.0,
                          child: Icon(
                            Icons.delete,
                            color: Colors.purple,
                          )),
                      title: Text(
                        "Name: " + name[index],
                        style: TextStyle(color: Colors.purple),
                      ),
                      subtitle: Text("Age: " +
                          age[index].toString() +
                          "\n" +
                          "Roll No: " +
                          rollno[index].toString()),
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
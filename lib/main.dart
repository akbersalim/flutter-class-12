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
/*
home: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MBCET(name, pass)));
        },
        child: Scaffold(body: SingleChildScrollView(child: MyBody())),
      ),
    );
  }
}
 */

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
  var paidstatus = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true
  ];
  var imag = [
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
    "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg",
  ];

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
                  hintText: "Enter name:", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: agecontroller,
              decoration: InputDecoration(
                  hintText: "Enter age:", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: rnocontroller,
              decoration: InputDecoration(
                  hintText: "Enter roll no:", border: OutlineInputBorder()),
            ),
            RaisedButton(
              onPressed: () {
                var nam = namecontroller.text;
                var rno = rnocontroller.text;
                var ag = agecontroller.text;
                setState(() {
                  name.add(nam.toString());
                  rollno.add(int.parse(rno));
                  age.add(int.parse(ag));
                  paidstatus.add(false);
                  imag.add(
                      "https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg");
                });
              },
              child: Text(
                "ENTER",
                style: TextStyle(color: Colors.purple),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height-300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    child: ListTile(
                      leading: Icon(Icons.account_circle,size: 50.0,),

                      /*ClipOval(
                        child: Image(
                          image: NetworkImage(imag[index]),
                          height: 40.0,
                        ),
                      ),*/
                      trailing: paidstatus[index]
                          ? FlatButton(child: Text("Paid"))
                          : FlatButton(
                          onPressed: () {
                            print("Clicked");
                          },
                          child: Text("Pay Now")),
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

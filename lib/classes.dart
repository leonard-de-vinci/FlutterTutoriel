import 'package:flutter/material.dart';

class Person{

  String name,lastname;
  num id,age;
  Person({this.id,this.name,this.lastname,this.age});
  String get fullname{
    return name+" "+lastname;
  }

}

class PersonCard extends StatefulWidget{
  final Person person;
  PersonCard({this.person});
  @override
  _PersonCard createState() {
    return _PersonCard(item: this.person);
  }
  }

class _PersonCard extends State<PersonCard>{
  final Person item;
  _PersonCard({this.item});
  @override
  Widget build(BuildContext context) {
    return Center(
      child : Card(
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.assignment_ind),
                title: Text(this.item.fullname),
                subtitle: Text("This person is aged "+this.item.age.toString()+" years"),
              ),
              ButtonTheme.bar(
              // Un bouton qui permet d'ouvrir une page
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text("Open"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonScreen(item: item,)));
                    },
                  ),
                ],
              ),
            ),

            ],
          )
      )
      );}
}

class PersonScreen extends StatelessWidget{
  final Person item;
  PersonScreen({this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person n°"+this.item.id.toString()),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),)
    ;
  }
}


class PersonList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PersonList();
  }

}

class _PersonList extends State<PersonList>{
  final List<Widget> cards = new List.generate(150, (i)=> new PersonCard(person: new Person(id: i,age: i*8%30,name: "John",lastname: "Doe",)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("List of people"),
    ),
    body: new Container(
      child: ListView(
        children: cards,
      ),
    )
    ,);
  }

}
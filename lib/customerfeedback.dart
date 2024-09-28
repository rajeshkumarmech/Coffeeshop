import 'package:flutter/material.dart';

import 'customercontact.dart';

class customerfeedback extends StatefulWidget {
  const customerfeedback({super.key});

  @override
  State<customerfeedback> createState() => _customerfeedbackState();
}

class _customerfeedbackState extends State<customerfeedback> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  int selectedindex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customer Feed Back Details")),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                  hintText: "Customer Name",
                  labelText: "Customer Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: contactcontroller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  hintText: "Customer Contact",
                  labelText: "Mobile No",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: addresscontroller,
              decoration: InputDecoration(
                  hintText: "Customer Review",
                  labelText: "Customer Sastification",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = namecontroller.text.trim();
                      String contact = contactcontroller.text.trim();
                      String address = addresscontroller.text.trim();
                      if (name.isNotEmpty &&
                          contact.isNotEmpty &&
                          address.isNotEmpty) {
                        setState(() {
                          namecontroller.text = "";
                          contactcontroller.text = "";
                          addresscontroller.text = "";
                          contacts.add(Contact(
                              name: name, contact: contact, address: address));
                        });
                      }
                    },
                    child: Text("Save")),
                ElevatedButton(
                    onPressed: () {
                      String name = namecontroller.text.trim();
                      String contact = contactcontroller.text.trim();
                      String address = addresscontroller.text.trim();
                      if (name.isNotEmpty &&
                          contact.isNotEmpty &&
                          address.isNotEmpty) {
                        setState(() {
                          namecontroller.text = "";
                          contactcontroller.text = "";
                          addresscontroller.text = "";
                          contacts[selectedindex].name = name;
                          contacts[selectedindex].contact = contact;
                          contacts[selectedindex].address = address;
                          selectedindex = -1;
                        });
                      }
                    },
                    child: Text("Update"))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            contacts.isEmpty
                ? Text(
                    "No Customer Details Found.......",
                    style: TextStyle(fontSize: 15),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getdetails(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getdetails(int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: index % 2 == 0 ? Colors.cyan : Colors.green,
        child: Text(contacts[index].name[0]),
      ),
      title: Column(
        children: [
          Text(contacts[index].name),
          Text(contacts[index].contact),
          Text(contacts[index].address)
        ],
      ),
      trailing: SizedBox(
        width: 70,
        child: Row(
          children: [
            InkWell(
              child: Icon(Icons.edit),
              onTap: () {
                namecontroller.text = contacts[index].name;
                contactcontroller.text = contacts[index].contact;
                addresscontroller.text = contacts[index].address;
                setState(() {
                  selectedindex = index;
                });
              },
            ),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  contacts.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

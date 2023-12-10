import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfilePicture(
                    name: 'skjdfj',
                    radius: 50,
                    fontsize: 25,
                    tooltip: true,
                  ),
                  Text(
                    'kshdk',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const TextField(
                     
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: FloatingActionButton.extended(
                      onPressed: () {},
                      icon: Icon(Icons.save),
                      label: Text("Save"),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

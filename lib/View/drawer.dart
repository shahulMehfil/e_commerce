import 'package:e_commerce/View/Profilescreen.dart';
import 'package:e_commerce/Model/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drawerscreen extends StatelessWidget {
  String email;
  String name;
  String phonenumber;

  Drawerscreen(
      {super.key, required this.email, required this.name, required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(children: [
        DrawerHeader(
          child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              accountName: Text(
                "$name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                email,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL ?? ""),
              ),
              currentAccountPictureSize: Size.square(50)),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu15WYUuVUWK9F_SkgZoeZnwCPcg_Jv3jlJUZdR5BIXgMy0hvGA5dPdiPWZW4xOVMTAPQBS8JJVBA&usqp=CAU&ec=48665699',
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Firebasegoogleauth().signOut();
          },
          leading: Icon(Icons.home),
          title: Text("log out"),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Profilescreen(),
            ));
          },
          leading: Icon(Icons.person),
          title: Text('Profile'),
        )
      ]),
    );
  }
}

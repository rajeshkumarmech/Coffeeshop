import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Future<void> SignInWithGoogle() async {
    // create instanceinfirebase and google sign in
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "Welcome to Coffee Shop",
          style: TextStyle(backgroundColor: Colors.brown),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24))),
            child: Image(
              image: NetworkImage(
                "https://cdn.homedit.com/wp-content/uploads/2019/05/A-Modern-Colombian-Coffee-Shop-2-1024x667.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "A coffeehouse, coffee shop, or café is an establishment that primarily serves coffee of various types, notably espresso, latte, and cappuccino. Some coffeehouses may serve cold drinks, such as iced coffee and iced tea, as well as other non-caffeinated beverages.",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                SignInWithGoogle();
                if (mounted) {
                  Get.to(() => homescreen());
                }
              },
              child: Text(" Sign with google")),
        ],
      ),
    );
  }
}

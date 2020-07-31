// import 'package:flutter/material.dart';
// import 'package:bubbletest/main.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String response = "";

//   getUser()async {

//     if (nameController =="salonqwerty@gmail.com"){
//       if(passwordController=="qwerty123"){

//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => MyApp()));
//       }else {
// //        Scaffold.of(context).showSnackBar(SnackBar(
// //          content: Text("Password is incorrect"),
// //        ));
//       }
//     }else{
// //      Scaffold.of(context).showSnackBar(SnackBar(
// //        content: Text("Entered email is incorrect"),
// //      ));
//     }
// //    print("getuser");
// //    var r = await http_get("getuser", {
// //      "email": nameController.text,
// //      "password": passwordController.text,
// //    });
// //    if (r.ok) {
// //      response=r.data['status'];
// //    }
//   }
// //  createUser() async {
// //    print("createuser");
// //    var result = await http_post("createuser", {
// //      "email": nameController.text,
// //      "password": passwordController.text,
// //    });
// //    if(result.ok)
// //    {
// //      setState(() {
// //        response = result.data['status'];
// //      });
// //    }
// //  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//         body:SingleChildScrollView(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,

//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top: 50),
//                     child:CircleAvatar(
//                       radius: 60,
//                       backgroundColor:(Color(0xFF674ea7)),
//                       child: CircleAvatar(
//                         backgroundImage: AssetImage('assets/images/logo.png'),
//                         radius: 55,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold
//                     ),
//                   )),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 child: TextField(
//                   obscureText: true,
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                   ),
//                 ),
//               ),
//               FlatButton(
//                 onPressed: (){
//                   //forgot password screen
//                 },
//                 textColor: Color(0xFF674ea7),
//                 child: Text('Forgot Password'),
//               ),
//               Container(
//                   height: 50,
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: RaisedButton(
//                       textColor: Colors.white,
//                       color: Color(0xFF674ea7),
//                       child: Text('Login'),
//                       onPressed: () {
//                         getUser();
//                       }

//                   )),
//               Container(
//                   child: Row(
//                     children: <Widget>[
//                       Text('Does not have account?'),
//                       FlatButton(
//                         textColor: Color(0xFF674ea7),
//                         child: Text(
//                           'Register',
//                           style: TextStyle(fontSize: 17),
//                         ),
//                        // onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MyCustomForm())),
//                       ),
//                       //Text(response),
//                     ],
//                     mainAxisAlignment: MainAxisAlignment.center,
//                   ))
//             ],

//           ),
//         )

//     );
//   }
// //old

// }

// MaterialColor createMaterialColor(Color color) {
//   List strengths = <double>[.05];
//   Map swatch = <int, Color>{};
//   final int r = color.red, g = color.green, b = color.blue;

//   for (int i = 1; i < 10; i++) {
//     strengths.add(0.1 * i);
//   }
//   strengths.forEach((strength) {
//     final double ds = 0.5 - strength;
//     swatch[(strength * 1000).round()] = Color.fromRGBO(
//       r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//       g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//       b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//       1,
//     );
//   });
//   return MaterialColor(color.value, swatch);
// }

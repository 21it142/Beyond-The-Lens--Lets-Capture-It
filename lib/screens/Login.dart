import 'package:flutter/material.dart';
import 'package:place/screens/folders.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  // Simulated user data for demonstration
  final String validEmail = '21it142@charusat.edu.in';
  final String validPassword = '123456';

  void login() {
    final String enteredEmail = emailController.text.trim();
    final String enteredPassword = passwordController.text.trim();

    // In a real application, you should validate the user's input
    // and authenticate against a secure backend service.

    if (enteredEmail == validEmail && enteredPassword == validPassword) {
      // Successful login, navigate to the next screen (e.g., HomeScreen).
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const FoldersScreen()));
    } else {
      setState(() {
        errorMessage = 'Invalid email or password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                
                labelText: 'Email',
              ),
              style: const TextStyle(color:Colors.white),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              style: const TextStyle(color:Colors.white),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login')
              ,
            ),
            const SizedBox(height: 10.0),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final _firebase = FirebaseAuth.instance;

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});
//   @override
//   State<AuthScreen> createState() {
//     return _AuthScreenState();
//   }
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final _form = GlobalKey<FormState>();
//   var _isLogin = true;
//   var _enteredEmail = '';
//   var _enteredPassword = '';
//   var _enteredUsername = '';

//   File? _slectedImage;
//   var _isAuthenticating = false;

//   void _submit() async {
//     //
//     final isvalid = _form.currentState!.validate();
//     if (!isvalid || !_isLogin && _slectedImage == null) {
//       //..error message
//       return;
//     }

//     _form.currentState!.save();
//     try {
//       setState(() {
//         _isAuthenticating = true;
//       });
//       if (_isLogin) {
//         final userCredential = await _firebase.signInWithEmailAndPassword(
//             email: _enteredEmail, password: _enteredPassword);
//         // print(userCredential);
//       } else {
//         final userCredential = await _firebase.createUserWithEmailAndPassword(
//             email: _enteredEmail, password: _enteredPassword);

//         final storageRef = FirebaseStorage.instance
//             .ref()
//             .child('user_images')
//             .child('${userCredential.user!.uid}.jpg');

//         await storageRef.putFile(_slectedImage!);
//         final imageUrl = await storageRef.getDownloadURL();
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.uid)
//             .set({
//           'username': _enteredUsername,
//           'email': _enteredEmail,
//           'image_url': imageUrl,
//         });
//       }
//     } on FirebaseAuthException catch (error) {
//       if (error.code == 'email-already-in-use') {
//         //.....
//       }
//       ScaffoldMessenger.of(context).clearSnackBars();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(error.message ?? 'Authentication Failed'),
//         ),
//       );
//       setState(() {
//         _isAuthenticating = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       body: Center(
//         child: SingleChildScrollView(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(
//                 top: 30,
//                 left: 20,
//                 right: 20,
//               ),
//               width: 200,
//               // child: Image.asset('assets/chat.png'),
//             ),
//             Card(
//               margin: const EdgeInsets.all(20),
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Form(
//                     key: _form,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         if (!_isLogin)
//                           // UserImagePicker(
//                           //   onPickImage: (pickedImage) {
//                           //     _slectedImage = pickedImage;
//                           //   },
//                           // ),
//                         TextFormField(
//                           decoration:
//                               const InputDecoration(labelText: 'Email Address'),
//                           keyboardType: TextInputType.emailAddress,
//                           autocorrect: false,
//                           textCapitalization: TextCapitalization.none,
//                           validator: (value) {
//                             if (value == null ||
//                                 value.trim().isEmpty ||
//                                 !value.contains('@')) {
//                               return 'Please enter a valid email Address';
//                             }

//                             return null;
//                           },
//                           onSaved: (value) {
//                             _enteredEmail = value!;
//                           },
//                         ),
//                         if (!_isLogin)
//                           TextFormField(
//                             decoration:
//                                 const InputDecoration(labelText: 'Username'),
//                             enableSuggestions: false,
//                             validator: (value) {
//                               if (value == null ||
//                                   value.isEmpty ||
//                                   value.trim().length < 7) {
//                                 return 'Please enter at 7 characters UserName';
//                               }
//                               return null;
//                             },
//                             onSaved: (value) {
//                               _enteredUsername = value!;
//                             },
//                           ),
//                         TextFormField(
//                           decoration:
//                               const InputDecoration(labelText: 'Password'),
//                           obscureText: true,
//                           validator: (value) {
//                             if (value == null || value.trim().length < 6) {
//                               return 'Please enter a 6 character long Password';
//                             }

//                             return null;
//                           },
//                           onSaved: (value) {
//                             _enteredPassword = value!;
//                           },
//                         ),
//                         const SizedBox(height: 12),
//                         if (!_isAuthenticating)
//                           ElevatedButton(
//                             onPressed: _submit,
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Theme.of(context)
//                                     .colorScheme
//                                     .primaryContainer),
//                             child: Text(_isLogin ? 'Login' : 'Signup'),
//                           ),
//                         if (!_isAuthenticating)
//                           TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 _isLogin = !_isLogin;
//                               });
//                             },
//                             child: Text(_isLogin
//                                 ? 'Create an Account'
//                                 : 'I Already have an Account'),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:place/screens/folders.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String errorMessage = '';

//   void login() async {
//     final String enteredEmail = emailController.text.trim();
//     final String enteredPassword = passwordController.text.trim();

//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.68.209:5000/api/auth/signin'), // Replace with your backend URL
//         body: {
//           'email': enteredEmail,
//           'password': enteredPassword,
//         },
//       );

//       if (response.statusCode == 200) {
//         // Successful login, navigate to the next screen (e.g., FoldersScreen).
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const FoldersScreen()),
//         );
//       } else if (response.statusCode == 400) {
//         setState(() {
//           errorMessage = 'Invalid email or password. Please try again.';
//         });
//       } else {
//         // Handle other error cases
//         setState(() {
//           errorMessage = 'An error occurred. Please try again later.';
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         errorMessage = 'An error occurred. Please check your internet connection.';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: login,
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 10.0),
//             Text(
//               errorMessage,
//               style: const TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


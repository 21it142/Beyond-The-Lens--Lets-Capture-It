import 'package:flutter/material.dart';
import 'package:place/screens/Login.dart';
// import 'package:place/screens/Login.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:place/screens/folders.dart';

// class SignLogin extends ConsumerStatefulWidget {
//   const SignLogin({super.key});
//   @override
//   ConsumerState<SignLogin> createState() {
//     return _SignLoginState();
//   }
// }

// class _SignLoginState extends ConsumerState<SignLogin> {
//   final _form = GlobalKey<FormState>();
//   var _isLogin = true;
//   var _enteredEmail = '';
//   var _enteredPassword = '';
//   var _enteredUsername = '';

//   void _submit() async {
//     //
//     final isvalid = _form.currentState!.validate();
//     if (!isvalid || !_isLogin) {
//       //..error message
//       return;
//     }
//     _form.currentState!.save();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login/Signup'),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (ctx) => const FoldersScreen()),
//                 );
//               },
//               child: const Text('Click to procced'))
//         ],
//       ),
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
//               child: Image.asset(''),
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
//                         ElevatedButton(
//                           onPressed: _submit,
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Theme.of(context)
//                                   .colorScheme
//                                   .primaryContainer),
//                           child: Text(_isLogin ? 'Login' : 'Signup'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               _isLogin = !_isLogin;
//                             });
//                           },
//                           child: Text(_isLogin
//                               ? 'Create an Account'
//                               : 'I Already have an Account'),
//                         ),
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
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUpUser(
      String username, String email, String password) async {
    // In a real app, validate user input and handle sign-up with a backend server.
    // For this example, we simulate a successful sign-up.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', true); // Store login state
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text.trim();
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                signUpUser(username, email, password);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

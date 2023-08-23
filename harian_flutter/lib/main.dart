// import 'dart:convert';

// import 'package:harian_client/harian_client.dart';
// import 'package:flutter/material.dart';
// import 'package:serverpod_flutter/serverpod_flutter.dart';
// import 'note_dialog.dart';

// // Sets up a singleton client object that can be used to talk to the server from
// // anywhere in our app. The client is generated from your server code.
// // The client is set up to connect to a Serverpod running on a local server on
// // the default port. You will need to modify this to connect to staging or
// // production servers.
// var client = Client('http://192.168.55.253:8080/')
//   ..connectivityMonitor = FlutterConnectivityMonitor();
// final api = client.user;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Serverpod Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Serverpod Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   User? user;

//   Widget buildUser(User? user) => Column(
//         children: [
//           CircleAvatar(
//             backgroundImage: user != null ? AssetImage(user.image) : null,
//             radius: 52,
//           ),
//           const SizedBox(height: 12),
//           Text(user != null ? user.name : 'No User'),
//         ],
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(20),
//         children: [
//           buildUser(user),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () async {
//               // await api.create(user);
//               final user =
//                   User(name: 'Yun Zhi', image: 'assets/images/yunzhi.jpg');

//               final newUser = await api.create(user);
//               setState(() => this.user = newUser);
//             },
//             child: const Text('Create'),
//           ),
//           const SizedBox(height: 12),
//           ElevatedButton(
//             onPressed: () async {
//               final users = await api.readAll();

//               setState(() => user = users.first);
//             },
//             child: const Text('Read'),
//           ),
//           const SizedBox(height: 12),
//           ElevatedButton(
//             onPressed: () async {
//               if (user == null) return;

//               user!.name = 'Cai Lin';
//               user!.image = 'assets/images/cailin.jpg';
//               final newUser = await api.update(user!);

//               setState(() => user = newUser);
//             },
//             child: const Text('Update'),
//           ),
//           const SizedBox(height: 12),
//           ElevatedButton(
//             onPressed: () async {
//               if (user == null) return;

//               final id = user!.id!;
//               await api.delete(id);

//               setState(() => user = null);
//             },
//             child: const Text('Delete'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:harian_client/harian_client.dart';
import 'package:flutter/material.dart';
import 'package:harian_flutter/constants/color.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://192.168.29.253:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();
var crud = client.crud;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundDark,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Crud>? crud;
  bool _isLoading = false;

  @override
  void initState() {
    _getAll();
    super.initState();
  }

  Future<void> _getAll() async {
    _isLoading = true;
    setState(() {});
    crud = await client.crud.readAll();
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundDark,
        title: Row(
          children: [
            IconButton(
              onPressed: (() => {}),
              icon: Image.asset("assets/images/menu.png"),
            ),
            const SizedBox(width: 24),
            Text(
              'Buku Harian',
              style: GoogleFonts.poppins(
                color: textSplashWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (() => {}),
              icon: Image.asset("assets/images/search.png"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundWhite,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const InsertPage(),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: backgroundDark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: crud?.length,
                itemBuilder: (_, index) {
                  final c = crud?[index] ?? Crud(tittle: "", description: "");
                  return ListTile(
                    title: Text(
                      c.tittle,
                      style: GoogleFonts.poppins(
                        color: textSplashWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      c.description,
                      style: GoogleFonts.poppins(
                        color: textSplashWhite,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UpdatePage(crud: c),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        client.crud.delete(c.id!).then((_) {
                          _getAll();
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: purpleLight1,
                      ),
                    ),
                    // trailing: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (_) => UpdatePage(crud: c),
                    //           ),
                    //         ).then((_) {
                    //           _getAll();
                    //         });
                    //       },
                    //       icon: const Icon(
                    //         Icons.edit,
                    //         color: purpleLight1,
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {
                    //         client.crud.delete(c.id!).then((_) {
                    //           _getAll();
                    //         });
                    //       },
                    //       icon: const Icon(
                    //         Icons.delete,
                    //         color: purpleLight1,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  );
                },
              ),
      ),
    );
  }
}

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late final TextEditingController _controller = TextEditingController();
  late final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: AppBar(
        backgroundColor: backgroundDark,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyHomePage(),
                ),
              ),
              icon: Image.asset("assets/images/menu-arrow.png"),
            ),
            const SizedBox(width: 24),
            Text(
              'Tambah Catatan',
              style: GoogleFonts.poppins(
                color: textSplashWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (() => {}),
              icon: Image.asset("assets/images/search.png"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: GoogleFonts.poppins(
                  color: textSplashWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descController,
              style: GoogleFonts.poppins(
                  color: textSplashWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
              maxLines: 5,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                client.crud.create(_controller.text, _descController.text).then(
                      (_) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MyHomePage(),
                          ),
                          (route) => false),
                    );
              },
              style: ElevatedButton.styleFrom(backgroundColor: textSplashWhite),
              child: Text(
                "Tambah",
                style: GoogleFonts.poppins(
                    color: backgroundWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key, required this.crud});
  final Crud crud;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.crud.tittle);
  late final TextEditingController _descController =
      TextEditingController(text: widget.crud.description);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundDark,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyHomePage(),
                ),
              ),
              icon: Image.asset("assets/images/menu-arrow.png"),
            ),
            const SizedBox(width: 24),
            Text(
              "Ubah Catatan",
              style: GoogleFonts.poppins(
                  color: textSplashWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/search.png"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: GoogleFonts.poppins(
                  color: textSplashWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descController,
              style: GoogleFonts.poppins(
                  color: textSplashWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
              maxLines: 5,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                client.crud
                    .update(
                      Crud(
                        id: widget.crud.id,
                        tittle: _controller.text,
                        description: _descController.text,
                      ),
                    )
                    .then(
                      (_) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyHomePage(),
                        ),
                        (route) => false,
                      ),
                    );
              },
              style: ElevatedButton.styleFrom(backgroundColor: textSplashWhite),
              child: Text(
                "Ubah",
                style:
                    GoogleFonts.poppins(color: backgroundWhite, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:harian_client/harian_client.dart';
// import 'package:flutter/material.dart';
// import 'package:serverpod_flutter/serverpod_flutter.dart';

// var client = Client('http://192.168.55.253:8080/')
//   ..connectivityMonitor = FlutterConnectivityMonitor();
// var crud = client.crud;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Serverpod Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Crud>? crud;
//   bool _isloading = false;

//   @override
//   void initState() {
//     _getAll();
//     super.initState();
//   }

//   Future<void> _getAll() async {
//     _isloading = true;
//     setState(() {});
//     crud = await client.crud.readAll();
//     _isloading = false;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Serverpod Example'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => const InsertPage(),
//             )),
//         child: const Icon(Icons.add),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: _isloading
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   itemCount: crud?.length ?? 0,
//                   itemBuilder: (_, index) {
//                     final c = crud?[index] ?? Crud(tittle: "", description: "");
//                     return ListTile(
//                       title: Text(c.tittle),
//                       subtitle: Text(c.description),
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => UpdatePage(
//                             crud: c,
//                           ),
//                         ),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => UpdatePage(crud: c),
//                                 ),
//                               ).then((_) {
//                                 _getAll();
//                               });
//                             },
//                             icon: const Icon(
//                               Icons.edit,
//                               color: Colors.black,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               client.crud.delete(c.id!).then((_) {
//                                 _getAll();
//                               });
//                             },
//                             icon: const Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ],
//                       ),
//                       // trailing: IconButton(
//                       //   onPressed: () {
//                       //     client.crud.delete(c.id!).then((_) {
//                       //       _getAll();
//                       //     });
//                       //   },
//                       //   icon: const Icon(
//                       //     Icons.delete,
//                       //     color: Colors.red,
//                       //   ),
//                       // ),
//                     );
//                   })),
//     );
//   }
// }

// class InsertPage extends StatefulWidget {
//   const InsertPage({super.key});

//   @override
//   State<InsertPage> createState() => _InsertPageState();
// }

// class _InsertPageState extends State<InsertPage> {
//   late final TextEditingController _controller = TextEditingController();
//   late final TextEditingController _descController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Insert Page'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: _controller,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextField(
//             controller: _descController,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 client.crud.create(_controller.text, _descController.text).then(
//                       (_) => Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => const MyHomePage(),
//                         ),
//                         (route) => false,
//                       ),
//                     );
//               },
//               child: const Text("Tambah"))
//         ],
//       ),
//     );
//   }
// }

// class UpdatePage extends StatefulWidget {
//   const UpdatePage({super.key, required this.crud});
//   final Crud crud;

//   @override
//   State<UpdatePage> createState() => _UpdatePageState();
// }

// class _UpdatePageState extends State<UpdatePage> {
//   late final TextEditingController _controller =
//       TextEditingController(text: widget.crud.tittle);
//   late final TextEditingController _descController =
//       TextEditingController(text: widget.crud.description);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Update Page"),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: _controller,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextField(
//             controller: _descController,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               client.crud
//                   .update(
//                     Crud(
//                       id: widget.crud.id,
//                       tittle: _controller.text,
//                       description: _descController.text,
//                     ),
//                   )
//                   .then(
//                     (_) => Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const MyHomePage(),
//                       ),
//                       (route) => false,
//                     ),
//                   );
//             },
//             child: const Text("Update"),
//           )
//         ],
//       ),
//     );
//   }
// }

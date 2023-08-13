import 'package:defacelab1/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imageController = TextEditingController();
  int _currentIndex = 0;

  Future<void> uploadMedia() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      // Handle the picked file here, you can set it to your controller
      setState(() {
        imageController.text = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.face_retouching_natural,
                          size: 40,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'DefaceLab',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 42,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    const Text(
                      "Upload your file",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black87, fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "in JPEG, MP4A, PNG, MP4, GIF, SVG",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(181, 213, 88, 1),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          uploadMedia();
                        },
                        child: Center(
                          child: imageController.text.isNotEmpty
                              ? Image.file(
                                  File(imageController.text),
                                  fit: BoxFit.cover,
                                )
                              : Icon(
                                  Icons.upload,
                                  size: 60,
                                  color: Colors.black87,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // history button
                        Text(
                          "History",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Icon(
                          Icons.history,
                          size: 28,
                        ),
                        SizedBox(width: 25),
                        // favorites button
                        Text(
                          "Favorites",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Icon(
                          Icons.grade_sharp,
                          size: 28,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            // Handle history button tap
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
          } else if (index == 2) {
            // Handle favorites button tap
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login_rounded),
            label: 'Login',
          ),
        ],
      ),
    );
  }
}

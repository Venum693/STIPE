import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

import 'camera_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("TAKE PHOTO"), backgroundColor: Colors.black),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 175, width: 250),
                child: Container(
                  height: 5,
                  width: 5,
                  color: Colors.yellow,
                  padding: EdgeInsets.all(10),
                  child: PopupMenuButton(
                    onSelected: (value){
                      setState(() async{

                        if(value=="Take Photo from Camera")
                          {
                             {
                              await availableCameras().then((value) => Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));//retrieving the available cameras of the device
                            }
                          }
                      });
                      print(value);
                    },
                    icon: Icon(Icons.add_a_photo),
                      iconSize: 45,
                      itemBuilder: (BuildContext bc){
                        return const [
                          PopupMenuItem(
                              child: Text('Upload from Gallery'),
                          value: 'Upload from Gallery',),
                          PopupMenuItem(
                            child: Text('Take Photo from Camera'),
                            value: 'Take Photo from Camera',)
                        ];
                      }),
                )),
          ),
        ));
  }
}

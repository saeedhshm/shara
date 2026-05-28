



import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/utils/widgets/loading_indicator.dart';

class LoadingImage extends StatefulWidget {

  final String name;
  final BoxFit fit;
  final double width;
  final double height;

   LoadingImage(this.name,{Key? key, this.fit = BoxFit.cover,required this.height,required this.width}) : super(key: key);

  @override
  State<LoadingImage> createState() => _LoadingImageState();
}

class _LoadingImageState extends State<LoadingImage> {


  var loading = false;
  Uint8List? imageFromBytes;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }
  @override
  Widget build(BuildContext context) {

    return loading || imageFromBytes == null
        ?  LoadingIndicatorWidget() :
    Image.memory(imageFromBytes!,
      errorBuilder: (context,widget,done){
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.apple),
        );
      },
      width: double.infinity,
      fit:  widget.fit,
      height: double.infinity,);
  }

  loadImage()async {
    loading = true;

    setState((){});
    imageFromBytes = await LoadingImageFromNetwork.loadImage(widget.name);

    loading = false;
    setState((){});
  }
}

class LoadingImageFromNetwork{
 static Future<Uint8List> loadImage(String imageUrl)async{
   Uint8List? imageFromBytes;
   final prefs = await SharedPreferences.getInstance();
   // prefs.remove(imageUrl);

   var imageFromStorage = prefs.getStringList(imageUrl);
   if(imageFromStorage == null){
     http.Response response = await http.get(Uri.parse(imageUrl));
     List<String> imageData = response.bodyBytes.map((e) => '$e').toList();
     prefs.setStringList(imageUrl, imageData);
     imageFromBytes = response.bodyBytes;
     return imageFromBytes;
   }else{
     imageFromBytes = Uint8List.fromList(imageFromStorage.map((e) => int.parse(e)).toList());
     return imageFromBytes;
   }


   //  println("*******************image bodyBytes");
   //  println(response.bodyBytes);
   // println("**************************************** imageData");
   //  println(imageData);
   // println("****************************************");
   //  //


  }
}

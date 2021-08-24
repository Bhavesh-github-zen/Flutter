import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Show Deployment
class MySD extends StatefulWidget {
   
      
  @override
  _MySDState createState() => _MySDState();
}

class _MySDState extends State<MySD> {
   web() async{
    
      var idd="7";
      var command =idd;
      print(command);
      var url = Uri.http("192.168.43.83","/cgi-bin/kube.py",{"x":command});
      var response = await http.get(url);
      showModalBottomSheet(
             backgroundColor: Colors.black,
             context: context,
             shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top:Radius.circular(20.0)
            )),
              builder: (context)=>Container(
                height: 465,
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  response.body,
                  style:TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    wordSpacing: 1,
                    fontSize: 20,

                  )
                  
                  ),
              ),
             );
      
   }

 

 @override
  Widget build(BuildContext context) {
     
    return Container(child: TextButton(onPressed: web, child: Text("Click Here")));
  }
}

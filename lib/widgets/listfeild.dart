import 'package:flutter/material.dart';
import 'package:weatherapp/base/apikey.dart';
import 'package:weatherapp/models/cities.dart';
import 'package:weatherapp/models/forcastResponse.dart';
import 'package:weatherapp/screens/displayscreen/homeVeiw.dart';
import 'package:weatherapp/service/api_service.dart';

class ListFeild extends StatefulWidget {
  final String label;
  const ListFeild({Key? key,required this.label}) : super(key: key);

  @override
  State<ListFeild> createState() => _ListFeildState();
}

class _ListFeildState extends State<ListFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top :10),
      padding: const EdgeInsets.all(25),
      decoration:  BoxDecoration(
          color: const Color(0xffF6F6F6),
          border: Border.all( color: const Color(0xffF6F6F6),width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: ()async{

          if(Cities.cities.contains(widget.label))
            {
              setState(() {
                    showDialog(context: context, builder: (context){return const Center(child: const CircularProgressIndicator(value: 1,color: Colors.black,),);});
                  });
              ApiResponseService apiresponse= ApiResponseService();
              var ans =  await apiresponse.getResponseCity(apiKey: ApiKey.key, cityName: widget.label);
              Cities.selecteditem=widget.label;
               Navigator.pop(context);
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (_) =>  HomeVeiw(apiresponse:ans??APIResponse())));

            }
        },
        child: Row(
          children: [
            SizedBox(width: 5,),
            Text(widget.label,style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

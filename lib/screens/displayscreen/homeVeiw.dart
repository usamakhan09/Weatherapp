import 'package:flutter/material.dart';
import 'package:weatherapp/models/forcastResponse.dart';
import 'package:weatherapp/widgets/appbar.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/widgets/forcast_Card.dart';
class HomeVeiw extends StatefulWidget {
  final APIResponse? apiresponse;
  final dateFormat = DateFormat('h:mm a');
  HomeVeiw({Key? key,required this.apiresponse}) : super(key: key);

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                height:315 ,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image:((widget.apiresponse?.current?.condition?.text)!.contains('rain'))?AssetImage('assets/images/rain.jpg'):((widget.apiresponse?.current?.condition?.text)!.contains('Mist'))?AssetImage('assets/images/mist.jpg'):((widget.apiresponse?.current?.condition?.text)!.contains('Clear'))?AssetImage('assets/images/clearSky.jpg'):AssetImage('assets/images/wind.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      const SizedBox(height: 61,),
                       MyAppBar(apiresponse: widget.apiresponse!,),
                      const SizedBox(height: 70,),
                      Center(
                        child: Column(
                          children:  [
                            Text('  ${((widget.apiresponse?.current?.tempC)?.round().toString())}\u00b0',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 99,color: Colors.white),),
                            Text(((widget.apiresponse?.current?.condition?.text).toString()),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              )
          ),
          Expanded(
              child:Container(
                child: Scaffold(
                  body:
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 34,),
                        Row(
                          children:  [
                            const Text("Today",style: TextStyle(fontWeight:FontWeight.w500 ,fontSize: 20,fontFamily: 'Poppins'),),
                            const Spacer(),
                            Text('${((widget.apiresponse?.location?.name).toString()).split(" ")[0]}'+',${((widget.apiresponse?.location?.country).toString())}',style: const TextStyle(fontSize: 15,color: Color(0xff5F5F5F),fontWeight: FontWeight.w500),)
                          ],
                        ),
                        const SizedBox(height: 39,),
                        Expanded(
                          child: Container(
                            // color: Color(0xffF1F1F1),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 const SizedBox(width: 15,),
                                Container(
                                  width: 60,
                                  height: 100,
                                  alignment: Alignment.topLeft,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Color(0xFFd9d9dd),)
                                    )
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text("Now",style: const TextStyle(fontWeight: FontWeight.w500),),
                                      const SizedBox(height: 5,),
                                      SizedBox(height:42,width: 42,child:
                                      Image.network('https:${(widget.apiresponse?.current?.condition?.icon)??""}')
                                      ),
                                      const SizedBox(height: 5,),
                                      Text('${(widget.apiresponse?.current?.tempC)!.floor().toString()}\u00b0',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18)),
                                      const SizedBox(height: 5,),

                                    ],
                                  ),
                                ),
                                 // SizedBox(width: 25,),
                                Expanded(
                                  flex: 2,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                      itemCount: 24,
                                      itemBuilder: (BuildContext context,int index){
                                        return Padding(
                                          padding: const EdgeInsets.only(left:20),
                                          child: Forcast_card(
                                              time: widget.dateFormat.format(DateTime.parse((widget.apiresponse?.forecast?.forecastday?[0].hour?[index].time).toString())),
                                              icon: widget.apiresponse?.forecast?.forecastday?[0].hour?[index].condition?.icon,
                                              temC: (widget.apiresponse?.forecast?.forecastday?[0].hour?[index].tempC)!.floor().toString()),
                                        );


                            }),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ) ,
                ),
              )
          )

        ],
      ),
    );
  }
}

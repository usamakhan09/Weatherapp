import 'package:flutter/material.dart';
import 'package:weatherapp/models/forcastResponse.dart';
import 'package:weatherapp/widgets/appbar.dart';
class HomeVeiw extends StatefulWidget {
  APIResponse apiresponse;
  HomeVeiw({Key? key,required this.apiresponse}) : super(key: key);

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {

  // @override
  // void initState() {
  //   HomeModelVeiw.gettemp(apiresponse ??"");
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                height:315 ,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/home.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      const SizedBox(height: 61,),
                      const MyAppBar(),
                      const SizedBox(height: 70,),
                      Center(
                        child: Column(
                          children:  [
                            Text(widget.apiresponse.current?.tempC.toString()??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 99,color: Colors.white),),
                            Text(((widget.apiresponse.current?.condition?.text).toString()),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),)
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
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 34,),
                        Row(
                          children:  [
                            Text("Today",style: TextStyle(fontWeight:FontWeight.w500 ,fontSize: 20,fontFamily: 'Poppins'),),
                            Spacer(),
                            Text('${((widget.apiresponse.location?.name).toString())}'+',${((widget.apiresponse.location?.country).toString())}',style: TextStyle(fontSize: 15,color: Color(0xff5F5F5F),fontWeight: FontWeight.w500),)
                          ],
                        ),
                        const SizedBox(height: 39,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Text("Now"),
                                SizedBox(height:42,width: 42,child: Image.asset('assets/images/cloud.png',)),
                                Text(widget.apiresponse.forecast?.forecastday?[2].hour?[1].tempC.toString()??"")
                              ],
                            ),
                            SizedBox(width: 34,),
                            Column(
                              children: [
                                Text("9 pm"),
                                SizedBox(height:42,width: 42,child: Image.asset('assets/images/cloud.png',)),
                                Text(widget.apiresponse.current?.tempC.toString()??"")
                              ],
                            ),
                            SizedBox(width: 34,),
                            Column(
                              children: [
                                Text("10 pm"),
                                SizedBox(height:42,width: 42,child: Image.asset('assets/images/cloud.png',)),
                                Text(widget.apiresponse.current?.tempC.toString()??"")
                              ],
                            ),
                            SizedBox(width: 34,),
                            Column(
                              children: [
                                Text("11 pm"),
                                SizedBox(height:42,width: 42,child: Image.asset('assets/images/cloud.png',)),
                                Text(widget.apiresponse.current?.tempC.toString()??"")
                              ],
                            ),
                            SizedBox(width: 34,),
                            Column(
                              children: [
                                Text("12 pm"),
                                SizedBox(height:42,width: 42,child: Image.asset('assets/images/cloud.png',)),
                                Text(widget.apiresponse.current?.tempC.toString()??"")
                              ],
                            ),
                          ],
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

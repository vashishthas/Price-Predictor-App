import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_price_predictor/service.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _areaController = TextEditingController();
  // List<String> numbers = ['1', '2', '3', '4', '5'];
  String _finalLocation = "";
  String _finalBath = "1";
  String _finalBhk = "1";
  // final ScrollController scrollController = ScrollController();
  String estimatedPrice = "";
  Map data = {};
  double _currentSlidervalue1 = 1.0;
  double _currentSlidervalue2 = 1.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color:
                  // Colors.blueGrey,
                  Colors.black.withOpacity(0.3),
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: FractionalOffset.topCenter,
              //     end: FractionalOffset.bottomCenter,
              //     colors: [
              //       Colors.black,
              //       Colors.black.withOpacity(0.2),
              //     ],
              //   ),
              // ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 65),
                    Text(
                      "Banglore Home Price",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 55),
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Text(
                            "Area",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: TextFormField(
                              controller: _areaController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.w900,
                                fontFamily: 'Roboto',
                                fontSize: 21,
                              ),
                              decoration: InputDecoration(
                                  hintText: "Area in sqft",
                                  hintStyle: TextStyle(
                                      // fontWeight: FontWeight.w900,
                                      fontFamily: 'Roboto',
                                      fontSize: 18)),
                              validator: (value) {
                                print(value);
                                if (value!.isEmpty) // || value==(/^[0-9]+$/))
                                  return "Enter area";
                                if (int.parse(value) < 800) {
                                  return "Cannot be less than 800";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          // Text(
                          //   "Location",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w700, fontSize: 25),
                          // ),
                          // FutureBuilder<List<String>>(
                          //     future: ApiService().getLocations(),
                          //     builder: (context, snapshot) {
                          //       if (!snapshot.hasData) {
                          //         return CircularProgressIndicator();
                          //       }
                          //       return DropdownButtonFormField(
                          //           hint: Text("Location"),
                          //           validator: (value) {
                          //             if (value == null) {
                          //               return "Cannot be empty";
                          //             }
                          //           },
                          //           onChanged: (newValue) {
                          //             setState(() {
                          //               _finalLocation = newValue.toString();
                          //             });
                          //           },
                          //           items: snapshot.data!.map((valueItem) {
                          //             return DropdownMenuItem(
                          //               value: valueItem,
                          //               child: Text(valueItem),
                          //             );
                          //           }).toList());
                          //     }),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Text(
                            "Bathroom",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 2,
                                activeTrackColor: Colors.blueAccent,
                                activeTickMarkColor: Colors.transparent,
                                inactiveTrackColor:
                                    Colors.grey.withOpacity(0.5),
                                inactiveTickMarkColor: Colors.blueAccent,
                                thumbColor: Colors.blueAccent.withOpacity(0.2),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 9),
                                // overlayShape:
                                //     RoundSliderOverlayShape(overlayRadius: 0.0),
                                overlayColor: Colors.blueAccent,
                                valueIndicatorColor: Colors.blueAccent),
                            child: Slider(
                              value: _currentSlidervalue1,
                              onChanged: (newValue) {
                                setState(() {
                                  _currentSlidervalue1 = newValue;
                                  _finalBath =
                                      _currentSlidervalue1.round().toString();
                                });
                              },
                              min: 1,
                              max: 5,
                              divisions: 4,
                              activeColor: Colors.blueAccent,
                              label: _finalBath,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // DropdownButtonFormField(
                          //     hint: Text("Location"),
                          //     onChanged: (newValue) {
                          //       setState(() {
                          //         _finalBath = newValue.toString();
                          //       });
                          //     },
                          //     items: numbers.map((valueItem) {
                          //       return DropdownMenuItem(
                          //         value: valueItem,
                          //         child: Text(valueItem.toString()),
                          //       );
                          //     }).toList()),
                          Text(
                            "Bhk",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 2,
                                activeTrackColor: Colors.blueAccent,
                                activeTickMarkColor: Colors.transparent,
                                inactiveTrackColor:
                                    Colors.grey.withOpacity(0.5),
                                inactiveTickMarkColor: Colors.blueAccent,
                                thumbColor: Colors.blueAccent.withOpacity(0.2),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 9),
                                // overlayShape:
                                //     RoundSliderOverlayShape(overlayRadius: 0.0),
                                overlayColor: Colors.blueAccent,
                                valueIndicatorColor: Colors.blueAccent),
                            child: Slider(
                              value: _currentSlidervalue2,
                              onChanged: (newValue) {
                                setState(() {
                                  _currentSlidervalue2 = newValue;
                                  _finalBhk =
                                      _currentSlidervalue2.round().toString();
                                });
                              },
                              min: 1,
                              max: 5,
                              divisions: 4,
                              activeColor: Colors.blueAccent,
                              label: _finalBhk,
                            ),
                          ),
                          SizedBox(height: 15),
                          // DropdownButtonFormField(
                          //     hint: Text("Bhk"),
                          //     onChanged: (newValue) {
                          //       setState(() {
                          //         _finalBhk = newValue.toString();
                          //       });
                          //     },
                          //     items: numbers.map((valueItem) {
                          //       return DropdownMenuItem(
                          //         value: valueItem,
                          //         child: Text(valueItem.toString()),
                          //       );
                          //     }).toList()),
                          Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          FutureBuilder<List<String>>(
                              future: ApiService().getLocations(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                }
                                return DropdownButtonFormField(
                                    hint: Text("Select location"),
                                    validator: (value) {
                                      if (value == null) {
                                        return "Cannot be empty";
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        _finalLocation = newValue.toString();
                                      });
                                    },
                                    items: snapshot.data!.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList());
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print(_finalBath.toString());
                              if (_formKey.currentState!.validate()) {
                                data = {
                                  "location": _finalLocation,
                                  "bhk": _finalBhk,
                                  "bath": _finalBath,
                                  "total_sqft": _areaController.text.trim()
                                };
                                setState(() {
                                  loadPrice();
                                  // estimatedPrice=snapshot.data!;
                                });
                              }
                              // ApiService().getPrice(data);
                            },
                            child: Text('Predict Price',
                                style: TextStyle(color: Colors.black)),
                          ),
                          SizedBox(height:20),
                          Text(estimatedPrice,
                          style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  loadPrice() async {
    String estPrice = await ApiService().getPrice(data);
    if (estPrice != 'Some error occured') {
      estPrice = 'The estimated price is ' + estPrice + ' lakhs.';
    }
    print(estPrice);
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('$estPrice')));
    setState(() {
      estimatedPrice = estPrice;
    });
  }
}

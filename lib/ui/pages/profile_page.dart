
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  var gender = 'Male';
  List itemLater = ['Male', 'Female'];
  var pickedDate;
  var _BDcontroller = TextEditingController();
  var _Ncontroller = TextEditingController();
  var _Acontroller = TextEditingController();
  var _Numcontroller = TextEditingController();

  bool isImageAvable = false;
   Uint8List ? imageWeb;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Center(
              child: Card(
                margin: EdgeInsets.all(25),
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                elevation: 8.0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height:MediaQuery.of(context).size.height * 0.85 ,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Register New Patient',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: ()async
                        {
                          await fetchImageWed();
                        },
                        child: Container(
                          color: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 100,
                            backgroundImage: isImageAvable ? MemoryImage(imageWeb!):const AssetImage('assets/images/profile.jpg') as ImageProvider,
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 20,
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.06,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.2,
                            child: TextField(
                              controller: _Ncontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Enter Name',
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 20,
                            child: Text(
                              'Address',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.06,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.2,
                            child: TextField(
                              controller: _Acontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Enter address',
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 20,
                            child: Text(
                              'Number',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.06,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.2,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: _Numcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: '00771234567',
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 20,
                            child: Text(
                              'Birth Date',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.06,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.2,
                            child: TextField(
                              controller: _BDcontroller,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.date_range_rounded),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: pickedDate != null
                                    ? ('${DateFormat.yMMMd().format(
                                    pickedDate)}')
                                    : '19-2-2014',
                              ),
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2050)
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      pickedDate = value;
                                    });
                                  } else {
                                    return;
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 20,
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.06,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.2,
                              child: DropdownButton(
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  hint: Text('$gender'),
                                  value: gender,
                                  items: itemLater.map((item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Text(item),

                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      gender = newValue as String;
                                    });
                                  })
                          )
                        ],
                      ),


                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.indigo),
                          ),
                          child: Text('Register', style: TextStyle(
                            fontSize: 20,
                          ),))
                    ],
                  ),
                ),
              ),
            )));
  }

  Future<void> fetchImageWed() async {
     final _imageWeb = await ImagePickerWeb.getImageAsBytes();
     if(_imageWeb==null){return;}
     else{
       setState(() {
         imageWeb = _imageWeb ;
         isImageAvable = true;
       });
     }

  }

}
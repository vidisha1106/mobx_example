import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx_example/Json%20Serialization%20Of%20Stores/data_model.dart';

@JsonSerializable()
class JsonSerializationOfStoresExample extends StatelessWidget {
  JsonSerializationOfStoresExample({super.key});

  DataModel dataModelObject =
      DataModel(userId: "001", id: '1', title: 'Flutter', body: 'Hello World');
  String jsonObject =
      '{"userId": "001", "id": "1", "title": "Flutter", "body": "Dart"}';

  List<DataModel> listOfDataModelObject = [
    DataModel(userId: "001", id: '1', title: 'Flutter', body: 'Hello World'),
    DataModel(userId: "002", id: '2', title: 'Dart', body: 'Hello......')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Json Serialization Of Stores Example",
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Json Serialization
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> dataModelMap = dataModelObject.toMap();
                  var json = jsonEncode(dataModelMap);
                  print(json);

                  ///another way of serializing data to Json
                  String jsonData=jsonEncode(listOfDataModelObject.map((e) => e.toMap()).toList());
                  print(jsonData.toString());

                },
                child: Text(
                  "Serialize",
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(width: 25),

            ///Json De-Serialization
            ElevatedButton(
              onPressed: () {
                var decoded = jsonDecode(jsonObject);
                Map<String, dynamic> dataMap = decoded;
                DataModel newData = DataModel.fromMap(dataMap);
                print(newData.body);
              },
              child: Text("De-Serialize", style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx_example/Json%20Serialization%20Of%20Stores/data_model.dart';

@JsonSerializable()
class JsonSerializationOfStoresExample extends StatelessWidget {
  JsonSerializationOfStoresExample({super.key});

  final DataModel dataModelObject =
      DataModel(userId: "001", id: '1', title: 'Flutter', body: 'Hello World');
  final String jsonObject =
      '{"userId": "001", "id": "1", "title": "Flutter", "body": "Dart"}';

 final List<DataModel> listOfDataModelObject = [
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Json Serialization
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> dataModelMap = dataModelObject.toMap();
                  String json = jsonEncode(dataModelMap);
                  debugPrint(json);

                  //You don’t need to call the toJson() method, since jsonEncode() already does it for you.
                  String trial=jsonEncode(dataModelObject);
                  debugPrint(trial);

                  ///another way of serializing data to Json
                  String jsonSData = jsonEncode(
                      listOfDataModelObject.map((e) => e.toMap()).toList());
                  debugPrint(jsonSData.toString());

                  ///Using @JsonSerializable
                  String objectToJson = jsonEncode(dataModelObject.toJson());
                  debugPrint(objectToJson);
                },
                child: const Text(
                  "Serialize",
                  style: TextStyle(fontSize: 20),
                )),

            const SizedBox(
              height: 25,
            ),

            ///Json De-Serialization
            ElevatedButton(
              onPressed: () {
                var decoded = jsonDecode(jsonObject);
                Map<String, dynamic> dataMap = decoded;
                DataModel newData = DataModel.fromMap(dataMap);
                debugPrint(newData.id);
                debugPrint(newData.userId);
                debugPrint(newData.title);
                debugPrint(newData.body);

                ///Using @JsonSerializable
                final jsonMap = jsonDecode(jsonObject);
                final jsonDSData = DataModel.fromJson(jsonMap);
                debugPrint(jsonDSData.id);
                debugPrint(jsonDSData.userId);
                debugPrint(jsonDSData.title);
                debugPrint(jsonDSData.body);

              },
              child:
                  const Text("De-Serialize", style: TextStyle(fontSize: 20)),
            ),

          ],
        ),
      ),
    );
  }
}

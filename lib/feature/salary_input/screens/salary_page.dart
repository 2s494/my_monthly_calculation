import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_monthly_salary/core/data_storage/local_data_storage/sqf_lite/sqf_lite_database.dart';
import 'package:my_monthly_salary/model/salary_model.dart';

class SalaryPage extends StatefulWidget {
  const SalaryPage({super.key});

  @override
  State<SalaryPage> createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  late SqfLiteDatabase database;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priseController = TextEditingController();
  @override
  void initState() {
    database = SqfLiteDatabase();
    initializeDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          TextFormField(
            controller: descriptionController,
          ),
          TextFormField(controller: priseController),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await database.insertSalary(Salary(
                        createdDate:
                            DateFormat('yyyy-MM-dd').format(DateTime.now()),
                        description: descriptionController.value.text.trim(),
                        prise:
                            double.parse(priseController.value.text.trim())));
                  },
                  child: const Text("Add to Database")),
              ElevatedButton(
                  onPressed: () {
                    database.getAllDatas();
                  },
                  child: const Text("Show database informations"))
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .5,
            width: MediaQuery.sizeOf(context).width,
            child: DecoratedBox(
                decoration: BoxDecoration(),
                child: FutureBuilder(
                  initialData: [],
                  future: database.getAllDatas(),
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Text(
                                      "${snapshot.data?[index]['description']} : ${snapshot.data?[index]['prise']}")
                                ],
                              );
                            })
                        : const CircularProgressIndicator();
                  },
                )),
          )
        ],
      ),
    )));
  }

  initializeDatabase() async {
    await database.initializeDatabase();
  }
}

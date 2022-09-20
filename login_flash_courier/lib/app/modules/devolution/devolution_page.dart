import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_flash_courier/app/modules/home/widgets/appbar_widget.dart';
import 'package:login_flash_courier/app/modules/home/widgets/drawer_widget.dart';

class DevolutionPage extends StatefulWidget {
  const DevolutionPage({super.key});

  @override
  State<DevolutionPage> createState() => _DevolutionPageState();
}

class _DevolutionPageState extends State<DevolutionPage> {
  List<String> items = ['- Selecione um grupo -', 'A', 'B', 'C', 'D'];
  String? selectedItem = '- Selecione um grupo -';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: HomeAppbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'DEVOLUÇÃO',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'IMEI: 51250263123031303',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 200,
                  child: DropdownButton<String>(
                    value: selectedItem,
                    items: items
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        selectedItem = item;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Digite a hawb',
                    errorMaxLines: 1,
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontFamily: 'Roboto',
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    disabledBorder: InputBorder.none,
                    filled: true,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 236, 235, 235))),
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "Sem ação no momento",
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 4,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Text('Devolver'),
                    ),
                    SizedBox(width: 25),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 236, 235, 235))),
                      onPressed: () {
                        Modular.to.navigate('/home/');
                      },
                      child: Text('Cancelar'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

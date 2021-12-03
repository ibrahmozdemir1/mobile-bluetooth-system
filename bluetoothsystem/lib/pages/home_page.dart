import 'package:flutter/material.dart';
import 'package:bluetoothsystem/pages/bluetooth_device.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Bluetooth"),
            backgroundColor: Colors.deepPurple,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                    child: const Text("Aktif Cihazları Gör"),
                    onPressed: () { Navigator.of(context).
                    push(MaterialPageRoute(builder: (context) => const SelectBondedDevicePage()));
                    }
                ),
              ],
            ),
          ),
        )
    );
  }
}
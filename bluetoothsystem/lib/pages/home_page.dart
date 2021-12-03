import 'package:bluetoothsystem/pages/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import './bluetooth_device.dart';
import './background_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {

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
                    onPressed: () {
                      Navigator.of(context).
                      push(MaterialPageRoute(builder: (
                          context) => const SelectBondedDevicePage()));
                    }
                ),
                ElevatedButton(
                  child: Text("Mesaj Gönder"),
                  onPressed: () async {
                    final BluetoothDevice? selectedDevice =
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context){
                              return SelectBondedDevicePage(checkAvailability: false);},
                          )
                        );
                    if (selectedDevice != null) {
                      print('Connect -> selected ' + selectedDevice.address);
                      _startChat(context, selectedDevice);
                    } else {
                      print('Connect -> no device selected');
                    }},
                )
              ],
            ),
          ),
        )
    );
  }
  void _startChat(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SendTheMessage(server: server);
        },
      ),
    );
  }
}
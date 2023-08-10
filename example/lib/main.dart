import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:carrier_info/carrier_info.dart';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CarrierData? carrierInfo;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      carrierInfo = await CarrierInfo.all;
      setState(() {});
    } catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  Future<void> callAllMethod() async {
    try {
      carrierInfo = await CarrierInfo.all.timeout(Duration(seconds: 3));
      setState(() {});
    } catch (e, st) {
      print('Failed to get CarrierData: $e');
    }
    print('Carrier Info ALL ----------------------------------------------');
    print(carrierInfo);
    print('END Carrier Info ALL ------------------------------------------');
  }

  Future<void> callMethodsIndividually() async {
    print('Calling individually ------------------------------------------');
    final allowsVOIP = await CarrierInfo.allowsVOIP;
    print('allowsVOIP: $allowsVOIP');
    final carrierName = await CarrierInfo.carrierName;
    print('carrierName: $carrierName');
    final isoCountryCode = await CarrierInfo.isoCountryCode;
    print('isoCountryCode: $isoCountryCode');
    final mobileCountryCode = await CarrierInfo.mobileCountryCode;
    print('mobileCountryCode: $mobileCountryCode');
    final mobileNetworkCode = await CarrierInfo.mobileNetworkCode;
    print('mobileNetworkCode: $mobileNetworkCode');
    final mobileNetworkOperator = await CarrierInfo.mobileNetworkOperator;
    print('mobileNetworkOperator: $mobileNetworkOperator');
    final networkGeneration = await CarrierInfo.networkGeneration;
    print('networkGeneration: $networkGeneration');
    final radioType = await CarrierInfo.radioType;
    print('radioType: $radioType');
    final cid = await CarrierInfo.cid;
    print('cid: $cid');
    final lac = await CarrierInfo.lac;
    print('lac: $lac');
    print('END Calling individually --------------------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Carrier Info'),
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 0.5,
              color: CupertinoColors.systemGrey2.withOpacity(0.4),
            ),
          ),
        ),
        backgroundColor: CupertinoColors.lightBackgroundGray,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ElevatedButton(
                        onPressed: callAllMethod,
                        child: Text('Call CarrierInfo.all()'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ElevatedButton(
                        onPressed: callMethodsIndividually,
                        child: Text('Call individually'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'CARRIER INFORMATION',
                    style: TextStyle(
                      fontSize: 11,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
                HomeItem(
                  title: 'Name',
                  value: '${carrierInfo?.carrierName}',
                  isFirst: true,
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.carrierName;
                      print('carrierName: $a');
                    } catch (e, st) {
                      print('Failed to get carrierName: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Country Code',
                  value: '${carrierInfo?.isoCountryCode}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.isoCountryCode;
                      print('isoCountryCode: $a');
                    } catch (e, st) {
                      print('Failed to get isoCountryCode: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Mobile Country Code',
                  value: '${carrierInfo?.mobileCountryCode}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.mobileCountryCode;
                      print('mobileCountryCode: $a');
                    } catch (e, st) {
                      print('Failed to get mobileCountryCode: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Mobile Network Operator',
                  value: '${carrierInfo?.mobileNetworkOperator}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.mobileNetworkOperator;
                      print('mobileNetworkOperator: $a');
                    } catch (e, st) {
                      print('Failed to get mobileNetworkOperator: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Mobile Network Code',
                  value: '${carrierInfo?.mobileNetworkCode}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.mobileNetworkCode;
                      print('mobileNetworkCode: $a');
                    } catch (e, st) {
                      print('Failed to get mobileNetworkCode: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Allows VOIP',
                  value: '${carrierInfo?.allowsVOIP}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.allowsVOIP;
                      print('allowsVOIP: $a');
                    } catch (e, st) {
                      print('Failed to get allowsVOIP: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Radio Type',
                  value: '${carrierInfo?.radioType}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.radioType;
                      print('radioType: $a');
                    } catch (e, st) {
                      print('Failed to get radioType: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Network Generation',
                  value: '${carrierInfo?.networkGeneration}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.networkGeneration;
                      print('networkGeneration: $a');
                    } catch (e, st) {
                      print('Failed to get networkGeneration: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Cell Id (cid)',
                  value: '${carrierInfo?.cid.toString()}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.cid;
                      print('cid: $a');
                    } catch (e, st) {
                      print('Failed to get cid: $e');
                    }
                  },
                ),
                HomeItem(
                  title: 'Local Area Code (lac)',
                  value: '${carrierInfo?.lac.toString()}',
                  onTap: () async {
                    try {
                      final a = await CarrierInfo.lac;
                      print('lac: $a');
                    } catch (e, st) {
                      print('Failed to get lac: $e');
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.title,
    required this.value,
    required this.onTap,
    this.isFirst = false,
  }) : super(key: key);

  final bool isFirst;
  final String title;
  final String value;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            if (!isFirst) Container(height: 0.5, color: Colors.grey.withOpacity(0.3)),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(title),
                  Spacer(),
                  Text(value),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

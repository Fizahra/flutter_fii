import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fii/widgets/custom_primary_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResultCounterPage extends StatelessWidget {
  const ResultCounterPage({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$number',
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 60,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: CustomPrimaryButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text('Konfirmasi Dialog'),
                      content:
                          const Text('Yakin ingin meninggalkan halaman ini?'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Tidak',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Ya'),
                        ),
                      ],
                    );
                    // return AlertDialog(
                    //   title: const Text('Konfirmasi Dialog'),
                    //   content: const Text('Yakin ingin meninggalkan halaman ini?'),
                    //   actions: [
                    //     TextButton(
                    //       onPressed: () => Navigator.pop(context),
                    //       child: const Text('Tidak', style: TextStyle( color: Colors.red),),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //         Navigator.pop(context);
                    //       },
                    //       child: const Text('Ya'),
                    //     ),
                    //   ],
                    // );
                  },
                );
                // Navigator.pop(context);
              },
              text: 'Kembali',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CustomPrimaryButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: 'ini tuh toast',
                        backgroundColor: Colors.pink.withOpacity(0.7),
                        gravity: ToastGravity.BOTTOM);
                  },
                  text: 'Klik untuk melihat Toast')
              // ElevatedButton(
              //   onPressed: () {
              //     Fluttertoast.showToast(
              //         msg: 'ini tuh toast',
              //         backgroundColor: Colors.pink.withOpacity(0.7),
              //         gravity: ToastGravity.BOTTOM);
              //   },
              //   child: const Text('Klik untuk melihat Toast'),
              // ),
              ),
        ],
      ),
    );
  }
}

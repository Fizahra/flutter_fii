import 'package:flutter/material.dart';
import 'package:flutter_fii/widgets/custom_primary_button.dart';
import 'package:intl/intl.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  DateTime _selectDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  TimeOfDay _selectTime = TimeOfDay.now();

  void _showDatePicker(context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: _selectDate,
      firstDate: _selectDate.subtract(const Duration(days: 30)),
      lastDate: DateTime(_selectDate.year + 2),
    );

    if (datePick != null) {
      setState(() {
        _selectDate = datePick;
      });
    }
  }

  void _showTimePicker(context) async {
    final timePick = await showTimePicker(
        context: context,
        initialTime: _selectTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (timePick != null) {
      setState(() {
        _selectTime = timePick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Tanggal : ${_dateFormat.format(_selectDate)}'),
              const SizedBox(
                width: 10,
              ),
              CustomPrimaryButton(
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  text: 'Date Picker')
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Waktu : ${_selectTime.format(context)}'),
              const SizedBox(
                width: 10,
              ),
              CustomPrimaryButton(
                  onPressed: () {
                    _showTimePicker(context);
                  },
                  text: 'Time Picker')
            ],
          )
        ],
      ),
    );
  }
}

import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class ItemCount extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final int decimalPlaces;
  final ValueChanged<int> onChanged;

  const ItemCount({
    Key? key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.decimalPlaces,
    required this.onChanged, required Color color,
  }) : super(key: key);

  @override
  _ItemCountState createState() => _ItemCountState();
}

class _ItemCountState extends State<ItemCount> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _increment() {
    if (_currentValue < widget.maxValue) {
      setState(() {
        _currentValue++;
        widget.onChanged(_currentValue);
      });
    }
  }

  void _decrement() {
    if (_currentValue > widget.minValue) {
      setState(() {
        _currentValue--;
        widget.onChanged(_currentValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: AppColor.themecolor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.remove, color: Colors.white),

            onPressed: _decrement,
          ),
        ),
        SizedBox(width: 6),
        Container(
          width: 30,
          alignment: Alignment.center,
          child: Text(
            _currentValue.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 6),
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: AppColor.themecolor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: _increment,
          ),
        ),
      ],
    );
  }
}

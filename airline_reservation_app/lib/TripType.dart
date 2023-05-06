import 'package:flutter/material.dart';

class TripType extends StatefulWidget {
  final String title;
  final Function(String)? onSelected;
  final String? selectedValue;

  const TripType({
    Key? key,
    required this.title,
    required this.selectedValue,
    this.onSelected,
  }) : super(key: key);

  @override
  State<TripType> createState() => _TripTypeState();
}

class _TripTypeState extends State<TripType> {
  bool get _isSelected => widget.selectedValue == widget.title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_isSelected) {
          widget.onSelected?.call(widget.title);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _isSelected ? Colors.blue : Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

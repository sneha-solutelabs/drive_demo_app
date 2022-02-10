
import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({
    required this.items,
    required this.initialItem,
    this.title = '',
    this.onItemSelected,
    Key? key,
  }) : super(key: key);

  final String title;

  final List<ActiveSymbol>? items;

  final ActiveSymbol initialItem;

  final void Function<ActiveSymbol>(ActiveSymbol item)? onItemSelected;

  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}


class _DropDownMenuState extends State<DropDownMenu> {
  ActiveSymbol? _item;

  @override
  void initState() {
    super.initState();
    _item = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0)
    ),
    child: DropdownButton<ActiveSymbol>(
      isExpanded: true,
      value: _item,
      icon: const Icon(Icons.keyboard_arrow_down),
      underline: Container(),
      onChanged: (ActiveSymbol? newValue) {
        widget.onItemSelected!(newValue);
        setState(() {
          _item = newValue;
        });
      },
      items: widget.items
          ?.map<DropdownMenuItem<ActiveSymbol>>((ActiveSymbol value) => DropdownMenuItem<ActiveSymbol>(
        value: value,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('${value.symbol}'),
        ),
      )).toList(),
    ),
  );
}
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomSelect extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final bool withBorder;
  final String hintText;
  final FormFieldValidator<String> validator;
  final bool enabled;
  final Mode mode;
  final List<String> items;
  final Function onChange;

  const CustomSelect({
    Key key,
    @required this.labelText,
    this.icon,
    this.withBorder,
    this.hintText,
    this.validator,
    this.enabled,
    this.mode = Mode.MENU,
    this.items,
    this.onChange,
  }) : super(key: key);

  @override
  _CustomSelectState createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      validator: widget.validator,
      hint: widget.hintText,
      mode: widget.mode,
      showSelectedItem: true,
      items: widget.items,
      label: widget.labelText,
      onChanged: widget.onChange,
      enabled: widget.enabled,

      // popupItemDisabled: (String s) => s.startsWith('I'),
      // onBeforeChange: (a, b) {
      //   AlertDialog alert = AlertDialog(
      //     title: Text("Are you sure..."),
      //     content: Text("...you want to clear the selection"),
      //     actions: [
      //       FlatButton(
      //         child: Text("OK"),
      //         onPressed: () {
      //           Navigator.of(context).pop(true);
      //         },
      //       ),
      //       FlatButton(
      //         child: Text("NOT OK"),
      //         onPressed: () {
      //           Navigator.of(context).pop(false);
      //         },
      //       ),
      //     ],
      //   );

      //   return showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return alert;
      //       });
      // },
    );
  }
}

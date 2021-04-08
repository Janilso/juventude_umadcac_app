import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/style.dart';

class InputText extends StatefulWidget {
  final String labelText;
  final IconData icon;

  const InputText({Key key, this.labelText, this.icon}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  FocusNode _focusNode;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        focusNode: _focusNode,
        style: TextStyle(
          fontFamily: "Baloo",
          fontSize: 22,
          color: secondaryColor,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              widget.icon,
              color: _focusNode.hasFocus ? secondaryColor : greyDark,
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontFamily: "Baloo",
              fontSize: 20,
              color: greyDark,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}

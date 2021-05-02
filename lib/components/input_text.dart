import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/theme/text_style.dart';

class InputText extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final bool withBorder;
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final bool enabled;

  const InputText(
      {Key key,
      @required this.labelText,
      this.icon,
      this.withBorder = false,
      this.keyboardType = TextInputType.text,
      this.hintText,
      this.controller,
      this.validator,
      this.enabled})
      : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  FocusNode _focusNode;
  bool _hasError = false;

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
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        // color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowBlack,
            blurRadius: 20,
            offset: Offset(0, _hasError ? 0 : 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        enabled: widget.enabled,
        validator: (value) {
          String mensageValidate = widget.validator(value);
          setState(() {
            _hasError = mensageValidate != null;
          });
          return mensageValidate;
        },
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        autocorrect: false,
        autofocus: false,
        focusNode: _focusNode,
        style: TextStyles.h4Regular(color: _hasError ? red : primaryColor),
        cursorColor: primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: _hasError ? redExtraLight : Colors.white,
          border: _builderBorderUnderline(Colors.transparent),
          focusedErrorBorder: _builderBorderUnderline(red),
          focusedBorder: _builderBorderUnderline(primaryColor),
          enabledBorder: _builderBorderUnderline(
              widget.withBorder ? grey : Colors.transparent),
          errorBorder: _builderBorderUnderline(red),
          errorStyle: TextStyles.paragraphRegular(color: red),
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: _hasError
                      ? red
                      : _focusNode.hasFocus
                          ? primaryColor
                          : blue,
                )
              : null,
          labelText: widget.labelText,
          labelStyle: TextStyles.h4Regular(color: _hasError ? red : blue),
        ),
      ),
    );
  }

  InputBorder _builderBorderUnderline(Color color) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(5), right: Radius.circular(5)),
      borderSide: BorderSide(color: color, width: 4.0),
    );
  }
}

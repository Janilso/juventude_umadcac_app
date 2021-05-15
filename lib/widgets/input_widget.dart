import 'package:flutter/material.dart';
import 'package:juventude_umadcac_app/theme/app_colors.dart';
import 'package:juventude_umadcac_app/theme/app_text_styles.dart';

class InputWidget extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final bool withBorder;
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final bool enabled;

  const InputWidget(
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
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
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
            color: AppColors.shadowBlack,
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
        style: AppTextStyles.h4Regular(
            color: _hasError ? AppColors.red : AppColors.primary),
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText,
          fillColor: _hasError ? AppColors.redExtraLight : Colors.white,
          border: _builderBorderUnderline(Colors.transparent),
          focusedErrorBorder: _builderBorderUnderline(AppColors.red),
          focusedBorder: _builderBorderUnderline(AppColors.primary),
          enabledBorder: _builderBorderUnderline(
              widget.withBorder ? AppColors.grey : Colors.transparent),
          errorBorder: _builderBorderUnderline(AppColors.red),
          errorStyle: AppTextStyles.paragraphRegular(color: AppColors.red),
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: _hasError
                      ? AppColors.red
                      : _focusNode.hasFocus
                          ? AppColors.primary
                          : AppColors.blue,
                )
              : null,
          labelText: widget.labelText,
          labelStyle: AppTextStyles.h4Regular(
              color: _hasError ? AppColors.red : AppColors.blue),
        ),
      ),
    );
  }

  InputBorder _builderBorderUnderline(Color color) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(5),
        right: Radius.circular(5),
      ),
      borderSide: BorderSide(color: color, width: 4.0),
    );
  }
}

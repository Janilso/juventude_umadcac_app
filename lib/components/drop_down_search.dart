import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:juventude_umadcac_app/theme/text_style.dart';

class DropDownSearch extends FormField<String> {
  final String labelText;
  final IconData icon;
  final bool withBorder;
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final bool enabled;
  final List<String> items;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldSetter<dynamic> setter;
  final ValueChanged<dynamic> onValueChanged;
  final int itemsVisibleInDropdown;

  DropDownSearch({
    Key key,
    @required this.labelText,
    this.icon,
    this.withBorder = false,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.controller,
    this.validator,
    this.enabled: true,
    this.items,
    this.inputFormatters,
    this.setter,
    this.onValueChanged,
    this.itemsVisibleInDropdown: 3,
  }) : super(
          key: key,
          initialValue: controller != null ? controller.text : '',
          onSaved: setter,
          builder: (FormFieldState<String> field) {
            final DropDownSearchState state = field;
            final ScrollController _scrollController = ScrollController();
            final InputDecoration effectiveDecoration = InputDecoration(
              filled: true,
              hintText: hintText,
              fillColor: state._hasError ? redExtraLight : Colors.white,
              border: state._builderBorderUnderline(Colors.transparent),
              focusedErrorBorder: state._builderBorderUnderline(red),
              focusedBorder: state._builderBorderUnderline(primaryColor),
              enabledBorder: state._builderBorderUnderline(
                  withBorder ? grey : Colors.transparent),
              errorBorder: state._builderBorderUnderline(red),
              errorStyle: TextStyles.paragraphRegular(color: red),
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: state._hasError
                          ? red
                          : state._showdropdown
                              ? primaryColor
                              : blue,
                    )
                  : null,
              labelText: labelText,
              labelStyle:
                  TextStyles.h4Regular(color: state._hasError ? red : blue),
              suffixIcon: IconButton(
                  icon: Icon(
                      state._isSearching ? Icons.close : Icons.arrow_drop_down,
                      size: state._isSearching ? null : 30.0,
                      color: state._hasError
                          ? red
                          : state._showdropdown
                              ? primaryColor
                              : blue),
                  onPressed: () {
                    if (state._isSearching) {
                      if (!enabled) return;
                      state.clearValue();
                    } else {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      state.setState(() {
                        state._showdropdown = !state._showdropdown;
                      });
                    }
                  }),
            );

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: state._showdropdown ? 0 : 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    // color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: shadowBlack,
                        blurRadius: 20,
                        offset: Offset(0, state._hasError ? 0 : 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          enabled: enabled,
                          validator: (String value) {
                            String mensageValidate = validator(value);
                            state.setState(() {
                              state._hasError = mensageValidate != null;
                            });
                            return mensageValidate;
                          },
                          controller: state._effectiveController,
                          keyboardType: keyboardType,
                          autocorrect: false,
                          autofocus: false,
                          focusNode: state._focusNode,
                          style: TextStyles.h4Regular(
                              color: state._hasError ? red : primaryColor),
                          cursorColor: primaryColor,
                          decoration: effectiveDecoration.copyWith(
                              errorText: field.errorText),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          onSaved: setter,
                          inputFormatters: inputFormatters,
                        ),
                      ),
                    ],
                  ),
                ),
                !state._showdropdown
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(bottom: 20),
                        color: Colors.white,
                        alignment: Alignment.topCenter,
                        height: itemsVisibleInDropdown * 57.0,
                        width: MediaQuery.of(field.context).size.width,
                        child: Material(
                          elevation: 5,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            controller: _scrollController,
                            child: ListView(
                              cacheExtent: 0.0,
                              // scrollDirection: Axis.vertical,
                              controller: _scrollController,
                              children: items.isNotEmpty
                                  ? ListTile.divideTiles(
                                          context: field.context,
                                          tiles:
                                              state._getChildren(state._items))
                                      .toList()
                                  : [],
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        );

  @override
  DropDownSearchState createState() => DropDownSearchState();
}

class DropDownSearchState extends FormFieldState<String> {
  TextEditingController _controller;
  bool _showdropdown = false;
  int _totalChanges = 2;
  bool _isSearching = true;
  String _searchText = "";
  bool _hasError = false;
  FocusNode _focusNode;

  @override
  DropDownSearch get widget => super.widget;
  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  List<String> get _items => widget.items;

  void toggleDropDownVisibility() {}

  void clearValue() {
    setState(() {
      _effectiveController.text = '';
    });
  }

  @override
  void didUpdateWidget(DropDownSearch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null)
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      if (widget.controller != null) {
        setValue(widget.controller.text);
        if (oldWidget.controller == null) _controller = null;
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    }

    _effectiveController.addListener(_handleControllerChanged);

    // _searchText = _effectiveController.text;
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue;
    });
  }

  List<Widget> _getChildren(List<String> items) {
    List<Widget> childItems = [];
    for (var item in items) {
      if (_searchText.isNotEmpty) {
        if (item.toUpperCase().contains(_searchText.toUpperCase()))
          childItems.add(_getItem(item));
      } else {
        childItems.add(_getItem(item));
      }
    }
    _isSearching ? childItems : List();
    return childItems;
  }

  Widget _getItem(String text) {
    return TextButton(
      style: ButtonStyle(alignment: Alignment.centerLeft),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(text, style: TextStyles.h6Regular(color: primaryColor))),
      onPressed: () {
        setState(() {
          _effectiveController.text = text;
          _handleControllerChanged();
          _showdropdown = false;
          _isSearching = false;
          _searchText = "";
          _totalChanges = 0;
          if (widget.onValueChanged != null) widget.onValueChanged(text);
        });
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }

  InputBorder _builderBorderUnderline(Color color) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(5), right: Radius.circular(5)),
      borderSide: BorderSide(color: color, width: 4.0),
    );
  }

  _handleControllerChanged() {
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);

    if (_effectiveController.text.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchText = "";
      });
    } else {
      setState(() {
        _isSearching = true;
        _searchText = _focusNode.hasFocus && _totalChanges > 1
            ? _effectiveController.text
            : "";
        _totalChanges = _totalChanges + 1;
        // _showdropdown = true;
      });
    }
  }

  _onOnFocusNodeEvent() {
    if (!widget.items.contains(_effectiveController.text)) {
      clearValue();
    }
    setState(() {
      _isSearching = _focusNode.hasFocus;
      _showdropdown = _focusNode.hasFocus;
      _searchText = _focusNode.hasFocus ? _searchText : "";
    });
  }
}

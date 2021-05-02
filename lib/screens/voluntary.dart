import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/components/custom_button.dart';
import 'package:juventude_umadcac_app/components/custom_select.dart';
import 'package:juventude_umadcac_app/components/input_text.dart';
import 'package:juventude_umadcac_app/utils/validations.dart';

class VoluntaryScream extends StatefulWidget {
  @override
  _VoluntaryScreamState createState() => _VoluntaryScreamState();
}

class _VoluntaryScreamState extends State<VoluntaryScream> {
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Validations _validate = Validations();

  TextEditingController _ctlContato =
      MaskedTextController(mask: '(00) 00000-0000');
  TextEditingController _ctlNome = TextEditingController();

  void validatorForm() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() => _autovalidate = AutovalidateMode.always);
    } else {
      print("Send form");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "SER VOLUNTÁRIO"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidate,
            child: Column(
              children: [
                CustomSelect(
                  labelText: "Departamento",
                ),
                InputText(
                  controller: _ctlNome,
                  validator: _validate.defaultValidate,
                  labelText: "Nome *",
                  icon: FontAwesome.bookmark,
                ),
                InputText(
                  controller: _ctlContato,
                  validator: _validate.celular,
                  labelText: "Contato (WhatsApp) *",
                  icon: FontAwesome.whatsapp,
                  keyboardType: TextInputType.number,
                ),
                CustomButton(
                  text: "ENVIAR",
                  onPressed: () {
                    validatorForm();
                  },
                  icon: Feather.send,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

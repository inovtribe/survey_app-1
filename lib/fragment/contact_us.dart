import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ContactUsFragment extends StatefulWidget {
  @override
  _ContactUsFragmentState createState() => _ContactUsFragmentState();
}

class _ContactUsFragmentState extends State<ContactUsFragment> {
  final GlobalKey<FormBuilderState> _fKey = GlobalKey<FormBuilderState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fKey,
                autovalidate: false,
                child: Column(
                  children: <Widget>[
                    createTextFields("FullName", _nameController),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    createTextFields("E-Mail", _emailController),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    createTextFields("Message", _messageController),
                    SizedBox(height: 20,),
                    RaisedButton(
                      onPressed: (){
                        if(_fKey.currentState.saveAndValidate()){
                          print(_fKey.currentState.value);
                          _fKey.currentState.reset();
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Form Submitted Successfully")));

                        }
                        else{
                          print("object");
                        }
                      },
                      child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                      color: Theme.of(context).accentColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  createTextFields(String labelName, TextEditingController _controller){
    return FormBuilderTextField(
      controller: _controller,
      attribute: labelName,
      autofocus: false,
      validators: [FormBuilderValidators.required(errorText: "${labelName} can not be empty"),(labelName == "E-Mail")?FormBuilderValidators.email(errorText: "Enter proper E-mail address"):FormBuilderValidators.required()],
      decoration: _formInputDecoration(labelName),
      maxLines: (labelName == "Message")?4:1,
      minLines: (labelName == "Message")?3:1,
    );
  }
  
  setOutlineInputBorder(Color color){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
      color: color)
    );
  }

  _formInputDecoration(String label){
    return InputDecoration(
      labelText: label,
      border: setOutlineInputBorder(Theme.of(context).accentColor),
      focusedBorder: setOutlineInputBorder(Colors.green),
      errorBorder: setOutlineInputBorder(Colors.red),
      focusedErrorBorder: setOutlineInputBorder(Colors.red),
    );
  }
}

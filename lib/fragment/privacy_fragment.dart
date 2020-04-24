import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyFragment extends StatefulWidget {
  @override
  _PrivacyPolicyFragmentState createState() => _PrivacyPolicyFragmentState();
}

class _PrivacyPolicyFragmentState extends State<PrivacyPolicyFragment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: LocalLoader().loadLocal(),
            builder: (context, snapshot){
              if(snapshot.hasData) {
                return Html(data: snapshot.data);
              }
              else if(snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}

class LocalLoader {
  Future<String> loadLocal() async {
    return await rootBundle.loadString('assets/terms.html');
  }
}

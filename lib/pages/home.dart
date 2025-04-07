import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Ticket App'),
            centerTitle: true,
      ),
      body: Column(
        children: [
          _inputField(),
          _submitButton()
        ],
      ),
    );
  }

  Container _submitButton() {
    return Container(
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              print('button pressed');
            },
            child: Text('Submit'),
          ),
        );
  }

  Container _inputField() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20,),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1d1617).withAlpha(30),
                blurRadius: 20,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xff868585),
                  width: 1
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Color(0xff868585),
                    width: 1
                ),
              ),

              hintText: 'Enter your problem',
              hintStyle: TextStyle(
                color: Color(0xff868585)
              ),
            ),
          ),
        );
  }
}

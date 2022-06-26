import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instgram_clone/resources/post_review_fire.dart';
import 'package:instgram_clone/utils/constants.dart';
import 'package:instgram_clone/utils/utils.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class Report extends StatefulWidget {
  Report({required this.id});
  final String id;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  double rate = 0;
  Uint8List? _file;
  final TextEditingController _controller = TextEditingController();

  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Insert picture for a post"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20.0),
              child: const Text("select picture from gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(
                  () {
                    _file = file;
                  },
                );
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20.0),
              child: const Text("cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Container(
        color: const Color(0xff757575),
        child: Center(
          child: Container(
            width: 414,
            height: 454,
            padding: EdgeInsets.all(31.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(35.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Problem detailes',
                  style: kGeneralTextStyle,
                ),
                kSizedBoxHeight,
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 350),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Write report',
                      hintStyle: kNoteTextStyle.copyWith(
                        color: Color(0xFF959595),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFFDADADA),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 185,
                  height: 31,
                  child: Center(
                    child: Text(
                      "Attached screenshot",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(
                      0xFFF5F5F5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.upload_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () => _selectImage(context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Submit a report',
                            style: kGeneralTextStyle,
                          ),
                          onPressed: () {
                            PostReview().postReport(
                              widget.id,
                              _controller.text,
                              user.uid,
                              rate,
                            );
                            Navigator.of(context).pop();
                          },
                          color: kTitleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

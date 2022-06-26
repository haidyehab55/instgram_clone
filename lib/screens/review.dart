import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instgram_clone/resources/post_review_fire.dart';
import 'package:instgram_clone/utils/constants.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class Review extends StatefulWidget {

   Review({required this.id});
   final String id;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
   double rate=0;

  final TextEditingController _controller = TextEditingController();

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
                  'Rate from 1 to 5',
                  style: kGeneralTextStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                // RatingBarIndicator(
                //   rating: 3.5,
                //   itemBuilder: (context, index) => Icon(
                //     Icons.star,
                //     color: Color(0xFFFFEA31),
                //   ),
                //   itemCount: 5,
                //   itemSize: 35,
                //   unratedColor: Color(0xffECF6F4),
                // ),
                RatingBar.builder(
                  minRating: 0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color(0xFFFFEA31),
                  ),
                  onRatingUpdate: (rate) => setState(() {
                    this.rate = rate;
                  }),
                  unratedColor: Color(0xffECF6F4),
                ),
                kSizedBoxHeight,
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 350),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                     controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Submit review',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Submit a review',
                            style: kGeneralTextStyle,
                          ),
                          onPressed: () {
                             PostReview().postReview(
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

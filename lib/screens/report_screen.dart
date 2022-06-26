import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instgram_clone/providers/user_provider.dart';
import 'package:instgram_clone/resources/post_review_fire.dart';
import 'package:instgram_clone/screens/report.dart';
import 'package:instgram_clone/screens/review.dart';
import 'package:instgram_clone/utils/back.dart';
import 'package:instgram_clone/utils/constants.dart';
import 'package:instgram_clone/widgets/like_animation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class ReportPage extends StatefulWidget {
  ReportPage({required this.snap});
  final snap;

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(27, 14, 27, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Back(),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Row(
                children: const [
                  Text(
                    'Reviews',
                    style: kHeadingStyle,
                  ),
                  // Image.asset(
                  //   'images/reviews_icon.png',
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .doc(widget.snap['postId'])
                    .collection('reviews')
                    .orderBy('datePublished', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemBuilder: (context, index) => SingleReport(
                        snap:
                        (snapshot.data! as dynamic).docs[index].data(),
                      ),
                      itemCount: (snapshot.data! as dynamic).docs.length);
                },
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.plus_one),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Report(id: widget.snap['postId']),
                    //     CommentsScreen(
                    //    snap: widget.snap,
                    // ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
//snap: widget.snap
  }
}

class SingleReport extends StatefulWidget {
  const SingleReport({
    required this.snap,
  });

  final snap;

  @override
  State<SingleReport> createState() => _SingleReportState();
}

class _SingleReportState extends State<SingleReport> {
  double rate = 0;
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(user.photoUrl),
            radius: 25.0,
            backgroundColor: Color(0x40000000),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user.username,
                  style: kDarkButtonTextStyle,
                ),
                SizedBox(
                  height: 4.0,
                ),
                ExpandableText(
                  ' ${widget.snap['text']}',
                  expandText: 'show more',
                  collapseOnTextTap: true,
                  maxLines: 3,
                  linkColor: Color(0xFF1DBCA3),
                  style: kHistoryPriceStyle,
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              RatingBarIndicator(
                rating: widget.snap['rating'],
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Color(0xFFFFEA31),
                ),
                itemCount: 5,
                itemSize: 20,
              ),
              SizedBox(height: 5),
              Text(
                DateFormat.yMMMd().format(
                  widget.snap['datePublished'].toDate(),
                ),
                style: kDateTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: LikeAnimation(
                      isAnimating: widget.snap['likes'].contains(user.uid),
                      smallLike: true,
                      child: IconButton(
                        onPressed: () async {
                          await PostReview().likeReview(
                            widget.snap['postId'],
                            widget.snap['commentId'],
                            widget.snap['uid'],
                            widget.snap['likes'],
                          );
                          print("help");
                          print('${widget.snap['likes'].length} likes');
                        },
                        icon: widget.snap['likes'].contains(user.uid)
                            ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                            : const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: const Icon(
                      Icons.report,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

List<Widget> cards = [];
const kBGColor = Color(
  0xfffafafa,
);
const kTitleColor = Color(
  0xff1DBCA3,
);
const kNoteColor = Color(
  0xff1F6487,
);
//HEAD

const kHeadTextStyle = TextStyle(
  fontFamily: 'DroidSans',
  fontSize: 34,
  letterSpacing: -2,
  color: kTitleColor,
  fontWeight: FontWeight.w700,
);
const kNoteTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: kNoteColor,
  fontWeight: FontWeight.w400,
);
const kNamesBookDetails = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 13,
  color: Color(0xFF263238),
  fontWeight: FontWeight.w500,
);
const kCommentBookDetails = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 10,
  color: Color(0xFF263238),
  fontWeight: FontWeight.w400,
);

const kOnButtonTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    color: Color(0xff403C3C),
    letterSpacing: -1.5,
    fontWeight: FontWeight.w600);

const kSmallTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 17.0,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const kBoldTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 40,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w700,
);

const kHistorySenderStyle = TextStyle(
    color: Color(0xff263238),
    letterSpacing: -0.05,
    fontFamily: 'Montserrat',
    fontSize: 10,
    fontWeight: FontWeight.w400);

const kCardStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22,
    color: Color(0xff403C3C),
    fontWeight: FontWeight.w500);

const kLabelField = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: Color(0xff263238),
  fontWeight: FontWeight.w500,
);

kInputDecorationStyleAddCard(String label) {
  Widget labelForm = Text(label);
  if (label.length <= 2) {
    labelForm = Center(
      child: Text(label),
    );
  }
  return InputDecoration(
    fillColor: Color(0xfffdfefe),
    filled: true,
    label: labelForm,
    labelStyle: TextStyle(
        color: Color(0xffDADADA),
        letterSpacing: -0.7,
        fontFamily: 'Montserrat',
        fontSize: 17,
        fontWeight: FontWeight.w400),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xffDADADA),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        width: 1.0,
        color: Color(0xffDADADA),
      ),
    ),
  );
}

// BOX 1 FOR BOOKS IN ADMIN PAGE
const kBoxLight = BoxDecoration(
  color: Color(0xffF5F5F5),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

// BOX 3 FOR Users IN ADMIN PAGE
const kBoxMediumGreen = BoxDecoration(
  color: Color(0xffA7E2D7),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

const kBoxDarkGreen = BoxDecoration(
  color: Color(0xff61D1BC),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

const kBoxLightGrey = BoxDecoration(
  color: Color(0xffD0CFCF),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

const kBoxDarkGrey = BoxDecoration(
  color: Color(0xffBFBCBC),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

const kSizedBoxHeight = SizedBox(
  height: 10.0,
);

const kSizedBoxWidth = SizedBox(
  width: 10.0,
);

const kSignInLargeBox = BoxDecoration(
  color: Color(0xffF5F5F5),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

const kAfterAddBox = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(50),
  ),
  color: Color(0xffC4C4C4),
);

const kSignInUpBox = BoxDecoration(
  color: Color(0xffF5F5F5),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    bottomRight: Radius.circular(5),
  ),
);

// Menna's Constants:

const kTextWith18Style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Color(0xFF263238));

const kTextButtonTextStyle = TextStyle(
    color: Color(0xFF263238),
    fontFamily: 'Montserrat',
    fontSize: 22.0,
    fontWeight: FontWeight.w500);

const kBookImageBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  color: Color(0xFFC4C4C4),
);

const kScreenNameTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    color: Color(0xFF21BC9E),
    fontSize: 28.0,
    fontWeight: FontWeight.w500,
    letterSpacing: -2);

const kBookNameCardTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  color: Color(0xFF263238),
);

const kBookPriceTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w800,
  fontSize: 10.0,
  color: Color(0xFF263238),
);

const kDialogContainerBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(35.0),
  ),
  color: Color(0xFFECF6F4),
);

// Yasmeen's Constants
const kHistoryShadowBox = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color(0x40000000),
      offset: Offset(0, 4),
      blurRadius: 4,
    ),
  ],
);

const kSectionNameTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: Color(0xff263238),
  fontWeight: FontWeight.w600,
);

const kGenreTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: Colors.white,
  fontSize: 14.0,
);

const kTabTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  fontSize: 24.0,
  color: Color(0xFF263238),
);

const kUserFullNameTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 17,
  fontWeight: FontWeight.w500,
  letterSpacing: -1,
  color: Color(0xFF263238),
);

const kUserNameTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 13,
  fontWeight: FontWeight.w500,
  color: Color(0xFF50555C),
);

//Rana's constants
const kAdminSectionNameTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  color: Color(0xFF263238),
  fontSize: 25.0,
);

const kGeneralTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w700,
);

const kCellTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 12,
  color: Color(
    0xff000000,
  ),
  fontWeight: FontWeight.w400,
);

const kColumnHeadlineTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Color(0xFF263238),
);

const kGreenTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 22,
  color: Color(
    0xff21BC9E,
  ),
  fontWeight: FontWeight.w400,
);

const kBlackTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

const kProblemTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

//Haidy's Constants

const kHistoryPriceStyle = TextStyle(
  color: Color(0xff263238),
  fontFamily: 'Montserrat',
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const kBookNameTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 16,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w700,
);

const kBookPriceTextStyle2 = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 16,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w600,
);

const kCommentTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w500,
);

const kDateTextStyle = TextStyle(
  color: Color(0xff263238),
  fontFamily: 'Montserrat',
  fontSize: 11,
  fontWeight: FontWeight.w400,
);

const kHeadingStyle = TextStyle(
  fontFamily: 'Montserrat',
  letterSpacing: -2,
  fontSize: 28,
  color: Color(0xff21BC9E),
  fontWeight: FontWeight.w500,
);

const kDarkButtonTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: Color(0xff263238),
  fontWeight: FontWeight.w500,
);

const kTextButtonStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 13,
  color: Color(0xFF263238),
  fontWeight: FontWeight.w400,
);

const kBox = BoxDecoration(
  color: Color(0xFFE5E5E5),
  borderRadius: BorderRadius.all(
    Radius.circular(
      15,
    ),
  ),
);

// BOX 2 FOR BOOKS IN ADMIN PAGE
const kBoxLightGreen = BoxDecoration(
  color: Color(0xffECF6F4),
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

const k28TextStyle = TextStyle(
    fontFamily: 'Montserrat',
    color: Color(0xFF263238),
    fontSize: 27.0,
    fontWeight: FontWeight.w500,
    letterSpacing: -2);

//Hager

const kUserInnerContainerTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Color(0xFF263238),
    letterSpacing: -2);

const UserNameTextStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Color(0xFF263238),
    letterSpacing: -2);

const kEditButtonTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 25,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w400,
);

const kMenuItemTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  fontSize: 24.0,
  color: Color(0xFF263238),
);

const kMenuItemGreenTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  fontSize: 24.0,
  color: Color(0xFF21BC9E),
);

const kGeneralBoldTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 24,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w700,
);

const UserNameHeadingTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 42,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

const kHistoryBookNameStyle = TextStyle(
  color: Color(0xff263238),
  fontFamily: 'Montserrat',
  fontSize: 15,
  fontWeight: FontWeight.w400,
);

const kLinkTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 15.0,
  color: Color(0xff263238),
  fontWeight: FontWeight.w500,
);

const kUserEditLabelStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22,
    color: Color(0xff263238),
    fontWeight: FontWeight.w600);

//Yomna

const kAboutStyle = TextStyle(
    fontFamily: 'Montserrat',
    color: Color(0xff3A5461),
    fontWeight: FontWeight.w500,
    fontSize: 20);

const kLoginTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 25,
  color: Color(
    0xff263238,
  ),
  decoration: TextDecoration.underline,
  fontWeight: FontWeight.w500,
);

const kLoginButtonTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 25,
  color: Color(
    0xff263238,
  ),
  fontWeight: FontWeight.w500,
);

const kSignUpLabelStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22,
    color: Color(0xff263238),
    fontWeight: FontWeight.w500);

const k20TextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    color: Color(0xff5D7B8A),
    letterSpacing: -1.5,
    fontWeight: FontWeight.w600);

const kPreferGenre = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  letterSpacing: -1,
  fontWeight: FontWeight.w500,
  color: Color(0xffFAFAFA),
);

const kPrefTextStyle = TextStyle(
  fontSize: 24,
  fontFamily: 'Montserrat',
  color: Color(
    0xff15A186,
  ),
  fontWeight: FontWeight.w500,
);

const kTextFieldHeading = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    color: Color(0xff5D7B8A),
    fontWeight: FontWeight.w500);
///////////////////////////////////////////////////////////////////////
const List<String> kBookCondition = ['New', 'Fair', 'defect', 'bad'];
const List<String> kBookArea = [
  'El-Amireya',
  'El-Zawia El-Hamraa',
  'El-Zaitoun District',
  'El-Sahel',
  'El-Sharabia',
  'Hadayek El-Kobba',
  'Rod El-Farag',
  'Shubra',
  '15 May',
  'El-Basatin',
  'El-Tebin',
  'El-Khalifa',
  'El- Sayeda Zeinab',
  'El-Maadi',
  'Masara',
  'Al-Mokattam',
  'Helwan',
  'Dar El-Salam',
  'Tora',
  'Misr El-Qadima',
  'El-Salam-1',
  'El-Salam-2',
  'el-marg',
  'El-Matarya',
  'El-Nozha',
  'Misr-Elgadida',
  'west-m-nasr',
  'Ain-Shams',
  'East-m-nasr'
];

///////////////////////////////////////////////////////////////////////////
enum BookType { rent, exchange }
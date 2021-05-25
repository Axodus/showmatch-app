import 'dart:convert';

import 'package:ShowMatch/components/buttons.dart';
import 'package:ShowMatch/helpers/helper.dart';
import 'package:ShowMatch/widgets/homeScreen/card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final numberOfMovies = TextEditingController();

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'DinNext',
  fontSize: 18.0
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'DinNext',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.blueGrey[300],
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var movieTitle;
  var releaseYear;
  var rating;
  var trailerUrl;
  var thumbnailUrl;

  int howManyMovies;
  bool hasSelectedNo = false;

  int id = 0;

  void initState() {
    super.initState();

    getMovies();
  }

  Widget inputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: < Widget > [
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            cursorWidth: 2.5,
            cursorColor: Colors.white,
            controller: numberOfMovies,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15.0),
              hintText: "How many movies to select",
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }
  
  playTrailer(){
    launch(trailerUrl);
  }

  setNoOfMovies() {

    setState(() {
      howManyMovies = int.parse(numberOfMovies.text);
      hasSelectedNo = true;
    });

    print("URL OF THUMBNAIL: $thumbnailUrl");
  }

  goBack() {
    setState(() {
      id--;
      if (id < 0) {
        id = 0;
        return;
      }
    });
    getMovies();
  }

  unlikeMovie(){
    if (id == howManyMovies-1) {
      return;
    }
    setState(() {
      id++;
    });
    getMovies();
  }

  likeMovie(){
    if (id == howManyMovies-1) {
      return;
    }
    setState(() {
      id++;
    });
    getMovies();
  }

  Future < dynamic > getMovies() async {

    var response = await getRequest(context, 'movies');

    var movieList = jsonDecode(response);
    print(movieList);
    print("\n\n");

    print("~~~~ MOVIE NO. $id ~~~~");
    print(movieList[0]["movie_titles"][id]["name"]);
    print(movieList[0]["movie_titles"][id]["thumbnails"]);
    print(movieList[0]["movie_titles"][id]["ratings"]);
    print(movieList[0]["movie_titles"][id]["year"]);
    print("~~~~~~~~~~~~~~~~~~~~~~");

    print("\n\n\n");

    setState(() {
      movieTitle = movieList[0]["movie_titles"][id]["name"];
      releaseYear = movieList[0]["movie_titles"][id]["year"];
      rating = movieList[0]["movie_titles"][id]["ratings"];
      thumbnailUrl = movieList[0]["movie_titles"][id]["thumbnails"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.blueGrey[600],
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: hasSelectedNo ? generateCard(
                  context,
                  playTrailer,
                  movieTitle,
                  releaseYear,
                  rating,
                  thumbnailUrl
                )
                :
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: inputField(),
                    ),
                    SizedBox(height: 15.0),
                    mainButton(
                      setNoOfMovies,
                      "GO",
                      Alignment.center,
                      100.0,
                      30.0,
                      Colors.blueGrey[900],
                      5.0,
                      14.0,
                      Colors.white
                    )
                  ],
                )
              ),
              hasSelectedNo ? Padding(
                padding: EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: likeMovie,
                    child: Icon(Icons.favorite),
                    backgroundColor: Colors.green[800],
                  ),
                ),
              ) : Container(),
              hasSelectedNo ? Padding(
                padding: EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: unlikeMovie,
                    child: Icon(Icons.clear),
                    backgroundColor: Colors.red[800],
                  ),
                ),
              ) : Container(),
              hasSelectedNo ? Padding(
                padding: EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    onPressed: goBack,
                    child: Icon(Icons.settings_backup_restore),
                  ),
                ),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
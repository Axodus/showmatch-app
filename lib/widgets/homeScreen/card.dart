import 'package:flutter/material.dart';

generateCard(context, playTrailer, movieTitle, releaseYear, rating, imgUrl) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.7,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.center,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.blueGrey[400],
          elevation: 12,
          child: Column(
            children: [
              Container(
                child: Image.network(
                  imgUrl,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Stack(
                  children: [
                    new Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "$movieTitle $releaseYear",
                          style: TextStyle(
                            fontFamily: 'DinNext',
                            color: Colors.white,
                            fontSize: 22
                          ),

                        ),
                      )
                    ),
                    new Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Rating: $rating',
                          style: TextStyle(
                            fontFamily: 'DinNext',
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                      )
                    ),
                    /*new Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromRGBO(172, 232, 148, 1.0),
                          onPressed: playTrailer,
                          child: Icon(Icons.play_arrow),
                          tooltip: "Plays trailer",
                          mini: true,
                        ),
                      ),
                    )*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
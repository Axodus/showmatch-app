import 'package:ShowMatch/components/buttons.dart';
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
  String movieTitle;
  String releaseYear;
  String rating;
  String trailerUrl;
  String thumbnailUrl;

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
            autofillHints: < String > [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
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

  Map<String, dynamic> movieList = {
    "movie_titles": [
      {
        "name": "The Shawshank Redemption",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0111161/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_1",
        "ratings": "9.2",
        "year": "(1994)"
      }, 
      {
        "name": "The Godfather",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR1,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0068646/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_2",
        "ratings": "9.1",
        "year": "(1972)"
      },
      {
        "name": "The Godfather: Part II",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR1,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0071562/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_3",
        "ratings": "9.0",
        "year": "(1974)"
      },
      {
        "name": "The Dark Knight",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UY67_CR0,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0468569/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_4",
        "ratings": "9.0",
        "year": "(2008)"
      },
      {
        "name": "12 Angry Men",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UX45_CR0,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0050083/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_5",
        "ratings": "8.9",
        "year": "(1957)"
      },
      {
        "name": "Schindler's List",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0108052/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_6",
        "ratings": "8.9",
        "year": "(1993)"
      },
      {
        "name": "The Lord of the Rings: The Return of the King",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0167260/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_7",
        "ratings": "8.9",
        "year": "(2003)"
      },
      {
        "name": "Pulp Fiction",
        "thumbnails": "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg",
        "thumbnails_url": "https://www.imdb.com/title/tt0110912/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=18X779R1PE319MR59MTT&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_8",
        "ratings": "8.8",
        "year": "(1994)"
      }  
    ]
  };
  
  playTrailer(){
    launch(trailerUrl);
  }

  setNoOfMovies() {
    setState(() {
      howManyMovies = int.parse(numberOfMovies.text);
      hasSelectedNo = true;
    });
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
    print("~~~~ MOVIE NO. $id ~~~~");
    print(movieList["movie_titles"][id]["name"]);
    print(movieList["movie_titles"][id]["thumbnails"]);
    print(movieList["movie_titles"][id]["ratings"]);
    print(movieList["movie_titles"][id]["year"]);
    print("~~~~~~~~~~~~~~~~~~~~~~");

    print("\n\n\n");

    setState(() {
      movieTitle = movieList["movie_titles"][id]["name"];
      releaseYear = movieList["movie_titles"][id]["year"];
      rating = movieList["movie_titles"][id]["ratings"];
      thumbnailUrl = movieList["movie_titles"][id]["thumbnails"];
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
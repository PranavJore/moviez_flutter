import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviez/util/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List MyList = [
    "3 Idiots",
    "Dangal",
    "PK",
    "Bajrangi Bhaijaan",
    "Robot"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CinemaHolic'),
        backgroundColor: (Colors.blue.shade900),
      ),
      backgroundColor: Colors.blue.shade50,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                MovieCard(movieList[index], context),
                Positioned(top: 10,child: movieImage(movieList[index].images[0]))
              ],
            );

            /*return Card(
          elevation: 2.5,
          color: Colors.blueAccent.shade100,
          child: ListTile(
            leading: CircleAvatar(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(13.0)
                ),
                child:
                  Text(movieList[index].title[0]),
              ),
            ),
            subtitle: Text(movieList[index].genre),
            title: Text(movieList[index].title),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieListViewDetails(MovieName: movieList[index].title,))),
          ),
        );*/
          }),
    );
  }

  Widget MovieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width:  MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.lightBlueAccent,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5,left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white
                          ),
                        )),
                    Text("Rating ${movie.imdbRating} /10", style: mainTextStyle(),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Released: ${movie.released}", style: mainTextStyle(),),
                    Text("${movie.runtime}", style: mainTextStyle(),),
                    Text("${movie.rated}", style: mainTextStyle(),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieListViewDetails(movie: movie))),
    );
  }
  TextStyle mainTextStyle(){
    return TextStyle(
      fontSize: 11,
      color: Colors.white,
    );
  }

  Widget movieImage(String ImageUrl){
    return Container(
      margin: EdgeInsets.only(left: 4),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape .circle,
          // color: Colors.white
          image: DecorationImage(
              image: NetworkImage(ImageUrl ?? 'https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png' ),
              fit: BoxFit.cover
          )
      ),
    );
  }



}




//Another Activity
class MovieListViewDetails extends StatelessWidget {
  final Movie movie;

  const MovieListViewDetails({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie)
        ],
      )
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(image:NetworkImage(thumbnail), fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outline, size: 100, color: Colors.black,)
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00000), Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          height: 50,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MoviePoster(Poster: movie.images[1]),
        SizedBox(width: 16),
        Expanded(child: MovieDetailsHeader(movie: movie))
      ],
    );
  }
}

//Movie Poster
class MoviePoster extends StatelessWidget {
  final String Poster;
  const MoviePoster({Key? key, required this.Poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Poster), fit: BoxFit.cover,
            )
          ),
        ),
      ),
    );
  }
}

//Movie detail
class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        Text("${movie.title}" , style: TextStyle(
          fontWeight:  FontWeight.w700,
          fontSize: 32
        ),),
        Text.rich(TextSpan(
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300
          ),
          children: [
            TextSpan(
              text: movie.plot
            ),
            TextSpan(text: "More...", style: TextStyle(
              color: Colors.indigoAccent
            ))
          ]
        )),
      ],
    );
  }
}

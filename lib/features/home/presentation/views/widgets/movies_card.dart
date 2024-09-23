import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_adv/constants.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';

class MoviesCard extends StatelessWidget {
  MoviesCard({super.key, required this.movies});

  final MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  //color: Colors.grey.withOpacity(.1),
                  color: KprimaryColor.withOpacity(.0),
                  spreadRadius: 0,
                  offset: const Offset(5, 5))
            ]),
        width: double.infinity,
        height: 115,
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push('/detailsView', extra: movies);
          },
          child: Card(
            elevation: 15,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CachedNetworkImage(
                    imageUrl: movies.image,
                    height: 100.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),

                  // child: Image.network(
                  //   //'assets/movie3.png',
                  //   movies.image,
                  //   height: 100,
                  //   width: 120,
                  //   fit: BoxFit.cover,

                  //   //product.image,
                  // ),
                ),
                //Spacer(),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      //movies.name,
                      //"harriy potter",
                      movies.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      //overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

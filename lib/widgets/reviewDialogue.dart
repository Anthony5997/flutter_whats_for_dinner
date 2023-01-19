import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class ReviewDialog extends StatefulWidget {
  ReviewDialog(this.recipe);
  Recipe recipe;

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  var rate = 0;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showMyDialog(context, widget.recipe),
      child: Text(
        "Donnez nous votre avis",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300, fontSize: 12),
        textAlign: TextAlign.start,
        softWrap: true,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

Future<void> _showMyDialog(context, Recipe recipe) async {
  var rate = 0.0;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close_outlined),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      recipe.title,
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        rate = rating;
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      print('jenvoie rate :'),
                      print(rate),
                      BlocProvider.of<RecipeListBloc>(context).add(RecipeRatingEvent(id : recipe.id, rate: rate)),
                      Navigator.of(context).pop(),
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Noter",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
    },
  );
}

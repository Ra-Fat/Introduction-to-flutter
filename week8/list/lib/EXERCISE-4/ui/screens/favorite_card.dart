import 'package:flutter/material.dart';
import '../../data/jokes_data.dart';


class FavoriteCardContainer extends StatefulWidget {
  const FavoriteCardContainer({super.key});

  @override
  State<FavoriteCardContainer> createState() => _FavoriteJokesContainerState();
}

class _FavoriteJokesContainerState extends State<FavoriteCardContainer> {
  int? favoriteJokeIndex;

  void onFavoritedSelected(int index) {
    setState(() {
      if (favoriteJokeIndex == index) {
        favoriteJokeIndex = null;
      } else {
        favoriteJokeIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          jokes.length,
          (index) => FavoriteCard(
            title: jokes[index].title,
            description: jokes[index].description,
            isFavorite: favoriteJokeIndex == index,
            onFavorite: () => onFavoritedSelected(index),
          ),
        ),
      ),
    );
  }
}


class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(description),
              ],
            ),
          ),

          IconButton(
            onPressed: onFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC17EBD),
              Color(0xFF9B6198),
              Color(0xFF754472),
              Color(0xFF4E304C),
            ],
            stops: [0.0, 0.31, 0.62, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        '3.9',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '19 reseñas',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ReviewBars(),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showReviewDialog(context);
                    },
                    child: const Text('Escribir una reseña'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF754472),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      ReviewTile(
                        username: 'Pedro',
                        review:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        rating: 4,
                        timeAgo: 'Hace 2 semanas',
                      ),
                      ReviewTile(
                        username: 'Juan',
                        review:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        rating: 4,
                        timeAgo: 'Hace 2 semanas',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showReviewDialog(BuildContext context) {
    final TextEditingController _reviewController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escribir una reseña'),
          content: TextField(
            controller: _reviewController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Escribe tu reseña aquí...',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar el código para enviar la reseña
                String reviewText = _reviewController.text;
                print('Reseña enviada: $reviewText');
                Navigator.of(context).pop();
              },
              child: const Text('Enviar comentario'),
            ),
          ],
        );
      },
    );
  }
}

class ReviewBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewBar(rating: 5, percentage: 0.5),
        ReviewBar(rating: 4, percentage: 0.3),
        ReviewBar(rating: 3, percentage: 0.1),
        ReviewBar(rating: 2, percentage: 0.05),
        ReviewBar(rating: 1, percentage: 0.05),
      ],
    );
  }
}

class ReviewBar extends StatelessWidget {
  final int rating;
  final double percentage;

  ReviewBar({required this.rating, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String username;
  final String review;
  final int rating;
  final String timeAgo;

  ReviewTile({
    required this.username,
    required this.review,
    required this.rating,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  timeAgo,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.white,
                );
              }),
            ),
            const SizedBox(height: 8),
            Text(
              review,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:administrador/services/api_services.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _reviews = [];
  bool _isLoading = false;
  final TextEditingController _reviewController = TextEditingController();

  double averageRating = 0.0;
  Map<int, double> ratingDistribution = {
    1: 0.0,
    2: 0.0,
    3: 0.0,
    4: 0.0,
    5: 0.0,
  };

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<dynamic> reviews = await _apiService.getAllOpinions();
      setState(() {
        _reviews = reviews;
        _calculateRatingDistribution();
      });
    } catch (e) {
      print('Error fetching reviews: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _submitReview(String reviewText) async {
    final data = {
      'contenido': reviewText,
    };

    try {
      final response = await _apiService.createOpinion(data);
      if (response != null) {
        _fetchReviews();
      }
    } catch (e) {
      print('Error submitting review: $e');
    }
  }

  void _calculateRatingDistribution() {
    if (_reviews.isEmpty) return;

    Map<int, int> ratingCounts = {
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
    };

    double totalRating = 0.0;

    for (var review in _reviews) {
      int rating = review['calificacion'] ?? 0;
      if (rating >= 1 && rating <= 5) {
        ratingCounts[rating] = (ratingCounts[rating] ?? 0) + 1;
        totalRating += rating;
      }
    }

    setState(() {
      averageRating = totalRating / _reviews.length;

      for (var entry in ratingCounts.entries) {
        ratingDistribution[entry.key] = entry.value / _reviews.length;
      }
    });
  }

  void _showReviewDialog(BuildContext context) {
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
                String reviewText = _reviewController.text;
                if (reviewText.isNotEmpty) {
                  _submitReview(reviewText);
                  Navigator.of(context).pop();
                  _reviewController.clear();
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('La reseña no puede estar vacía.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Enviar comentario'),
            ),
          ],
        );
      },
    );
  }

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
                Center(
                  child: Column(
                    children: [
                      Text(
                        averageRating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${_reviews.length} reseñas',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ReviewBars(ratingDistribution: ratingDistribution),
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
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _reviews.length,
                          itemBuilder: (context, index) {
                            final review = _reviews[index];
                            return ReviewTile(
                              username: review['username'] ?? 'Anonymous',
                              review: review['contenido'],
                              rating: review['calificacion'] ?? 0,
                              timeAgo: review['createdAt'],
                              sentimentScores: review['sentiment_scores'],
                            );
                          },
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

class ReviewBars extends StatelessWidget {
  final Map<int, double> ratingDistribution;

  ReviewBars({required this.ratingDistribution});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ratingDistribution.entries.map((entry) {
        return ReviewBar(rating: entry.key, percentage: entry.value);
      }).toList(),
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
  final String sentimentScores;

  ReviewTile({
    required this.username,
    required this.review,
    required this.rating,
    required this.timeAgo,
    required this.sentimentScores,
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
            const SizedBox(height: 8),
            Text(
              'Sentiment Scores: $sentimentScores',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

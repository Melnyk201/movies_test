abstract final class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const bearerToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMjRkZDEyMWYxNjQ1YmNkOGZmNjlhMzE1OGIxNWExOSIsIm5iZiI6MTc4MTY5MjczNS45MzYsInN1YiI6IjZhMzI3OTNmZmQ0OGZiNjI1YWQ5ZWRmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.esiZRTqPHx1kmganUrfSNqIGMaLovSM_UJdCjBmQ_4s';

  static const topRated = '/movie/top_rated';
  static const searchMovie = '/search/movie';
  static String movieDetails(int id) => '/movie/$id';
  static String posterUrl(String path) => '$imageBaseUrl$path';
}

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:infinite_list_flutter_bloc/models/post_model.dart';

class PostApi {
  static Future<List<PostModel?>?> getPosts(
      [int startIndex = 0, int limit = 20]) async {
    try {
      String url =
          "https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit";

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("data");
        final postModel = postModelFromJson((response.body));

        return postModel!;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class MovieResponse {
  List<Categories> categories;
  String createAt;
  String description;
  List<Links> links;
  String movieId;
  String name;

  MovieResponse(
      {this.categories,
      this.createAt,
      this.description,
      this.links,
      this.movieId,
      this.name});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    createAt = json['createAt'];
    description = json['description'];
    if (json['links'] != null) {
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
    movieId = json['movieId'] as String;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (categories != null) {
      data['categories'] = categories.map((v) => v.toJson()).toList();
    }
    data['createAt'] = createAt;
    data['description'] = description;
    if (links != null) {
      data['links'] = links.map((v) => v.toJson()).toList();
    }
    data['movieId'] = movieId;
    data['name'] = name;
    return data;
  }
}

class Categories {
  String categoryId;
  String name;

  Categories({this.categoryId, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['name'] = name;
    return data;
  }
}

class Links {
  String linkId;
  String movieId;
  String origin;
  String url;

  Links({this.linkId, this.movieId, this.origin, this.url});

  Links.fromJson(Map<String, dynamic> json) {
    linkId = json['linkId'];
    movieId = json['movieId'];
    origin = json['origin'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['linkId'] = this.linkId;
    data['movieId'] = this.movieId;
    data['origin'] = this.origin;
    data['url'] = this.url;
    return data;
  }
}

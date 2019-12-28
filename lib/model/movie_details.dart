// To parse this JSON data, do
//
//     final movieDetails = movieDetailsFromJson(jsonString);

import 'dart:convert';

MovieDetails movieDetailsFromJson(String str) => MovieDetails.fromJson(json.decode(str));

String movieDetailsToJson(MovieDetails data) => json.encode(data.toJson());

class MovieDetails {
    MovieDetailsRating rating;
    int reviewsCount;
    List<dynamic> videos;
    int wishCount;
    String originalTitle;
    List<String> blooperUrls;
    int collectCount;
    Images images;
    String doubanSite;
    String year;
    List<PopularComment> popularComments;
    String alt;
    String id;
    String mobileUrl;
    int photosCount;
    DateTime pubdate;
    String title;
    dynamic doCount;
    bool hasVideo;
    String shareUrl;
    dynamic seasonsCount;
    List<String> languages;
    String scheduleUrl;
    List<Cast> writers;
    List<String> pubdates;
    String website;
    List<String> tags;
    bool hasSchedule;
    List<String> durations;
    List<String> genres;
    dynamic collection;
    List<Blooper> trailers;
    dynamic episodesCount;
    List<String> trailerUrls;
    bool hasTicket;
    List<Blooper> bloopers;
    List<String> clipUrls;
    dynamic currentSeason;
    List<Cast> casts;
    List<String> countries;
    DateTime mainlandPubdate;
    List<Photo> photos;
    String summary;
    List<Blooper> clips;
    String subtype;
    List<Cast> directors;
    int commentsCount;
    List<PopularReview> popularReviews;
    int ratingsCount;
    List<String> aka;

    MovieDetails({
        this.rating,
        this.reviewsCount,
        this.videos,
        this.wishCount,
        this.originalTitle,
        this.blooperUrls,
        this.collectCount,
        this.images,
        this.doubanSite,
        this.year,
        this.popularComments,
        this.alt,
        this.id,
        this.mobileUrl,
        this.photosCount,
        this.pubdate,
        this.title,
        this.doCount,
        this.hasVideo,
        this.shareUrl,
        this.seasonsCount,
        this.languages,
        this.scheduleUrl,
        this.writers,
        this.pubdates,
        this.website,
        this.tags,
        this.hasSchedule,
        this.durations,
        this.genres,
        this.collection,
        this.trailers,
        this.episodesCount,
        this.trailerUrls,
        this.hasTicket,
        this.bloopers,
        this.clipUrls,
        this.currentSeason,
        this.casts,
        this.countries,
        this.mainlandPubdate,
        this.photos,
        this.summary,
        this.clips,
        this.subtype,
        this.directors,
        this.commentsCount,
        this.popularReviews,
        this.ratingsCount,
        this.aka,
    });

    factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        rating: MovieDetailsRating.fromJson(json["rating"]),
        reviewsCount: json["reviews_count"],
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        wishCount: json["wish_count"],
        originalTitle: json["original_title"],
        blooperUrls: List<String>.from(json["blooper_urls"].map((x) => x)),
        collectCount: json["collect_count"],
        images: Images.fromJson(json["images"]),
        doubanSite: json["douban_site"],
        year: json["year"],
        popularComments: List<PopularComment>.from(json["popular_comments"].map((x) => PopularComment.fromJson(x))),
        alt: json["alt"],
        id: json["id"],
        mobileUrl: json["mobile_url"],
        photosCount: json["photos_count"],
        pubdate: DateTime.parse(json["pubdate"]),
        title: json["title"],
        doCount: json["do_count"],
        hasVideo: json["has_video"],
        shareUrl: json["share_url"],
        seasonsCount: json["seasons_count"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        scheduleUrl: json["schedule_url"],
        writers: List<Cast>.from(json["writers"].map((x) => Cast.fromJson(x))),
        pubdates: List<String>.from(json["pubdates"].map((x) => x)),
        website: json["website"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        hasSchedule: json["has_schedule"],
        durations: List<String>.from(json["durations"].map((x) => x)),
        genres: List<String>.from(json["genres"].map((x) => x)),
        collection: json["collection"],
        trailers: List<Blooper>.from(json["trailers"].map((x) => Blooper.fromJson(x))),
        episodesCount: json["episodes_count"],
        trailerUrls: List<String>.from(json["trailer_urls"].map((x) => x)),
        hasTicket: json["has_ticket"],
        bloopers: List<Blooper>.from(json["bloopers"].map((x) => Blooper.fromJson(x))),
        clipUrls: List<String>.from(json["clip_urls"].map((x) => x)),
        currentSeason: json["current_season"],
        casts: List<Cast>.from(json["casts"].map((x) => Cast.fromJson(x))),
        countries: List<String>.from(json["countries"].map((x) => x)),
        mainlandPubdate: DateTime.parse(json["mainland_pubdate"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        summary: json["summary"],
        clips: List<Blooper>.from(json["clips"].map((x) => Blooper.fromJson(x))),
        subtype: json["subtype"],
        directors: List<Cast>.from(json["directors"].map((x) => Cast.fromJson(x))),
        commentsCount: json["comments_count"],
        popularReviews: List<PopularReview>.from(json["popular_reviews"].map((x) => PopularReview.fromJson(x))),
        ratingsCount: json["ratings_count"],
        aka: List<String>.from(json["aka"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "rating": rating.toJson(),
        "reviews_count": reviewsCount,
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "wish_count": wishCount,
        "original_title": originalTitle,
        "blooper_urls": List<dynamic>.from(blooperUrls.map((x) => x)),
        "collect_count": collectCount,
        "images": images.toJson(),
        "douban_site": doubanSite,
        "year": year,
        "popular_comments": List<dynamic>.from(popularComments.map((x) => x.toJson())),
        "alt": alt,
        "id": id,
        "mobile_url": mobileUrl,
        "photos_count": photosCount,
        "pubdate": "${pubdate.year.toString().padLeft(4, '0')}-${pubdate.month.toString().padLeft(2, '0')}-${pubdate.day.toString().padLeft(2, '0')}",
        "title": title,
        "do_count": doCount,
        "has_video": hasVideo,
        "share_url": shareUrl,
        "seasons_count": seasonsCount,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "schedule_url": scheduleUrl,
        "writers": List<dynamic>.from(writers.map((x) => x.toJson())),
        "pubdates": List<dynamic>.from(pubdates.map((x) => x)),
        "website": website,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "has_schedule": hasSchedule,
        "durations": List<dynamic>.from(durations.map((x) => x)),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "collection": collection,
        "trailers": List<dynamic>.from(trailers.map((x) => x.toJson())),
        "episodes_count": episodesCount,
        "trailer_urls": List<dynamic>.from(trailerUrls.map((x) => x)),
        "has_ticket": hasTicket,
        "bloopers": List<dynamic>.from(bloopers.map((x) => x.toJson())),
        "clip_urls": List<dynamic>.from(clipUrls.map((x) => x)),
        "current_season": currentSeason,
        "casts": List<dynamic>.from(casts.map((x) => x.toJson())),
        "countries": List<dynamic>.from(countries.map((x) => x)),
        "mainland_pubdate": "${mainlandPubdate.year.toString().padLeft(4, '0')}-${mainlandPubdate.month.toString().padLeft(2, '0')}-${mainlandPubdate.day.toString().padLeft(2, '0')}",
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "summary": summary,
        "clips": List<dynamic>.from(clips.map((x) => x.toJson())),
        "subtype": subtype,
        "directors": List<dynamic>.from(directors.map((x) => x.toJson())),
        "comments_count": commentsCount,
        "popular_reviews": List<dynamic>.from(popularReviews.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "aka": List<dynamic>.from(aka.map((x) => x)),
    };
}

class Blooper {
    String medium;
    String title;
    String subjectId;
    String alt;
    String small;
    String resourceUrl;
    String id;

    Blooper({
        this.medium,
        this.title,
        this.subjectId,
        this.alt,
        this.small,
        this.resourceUrl,
        this.id,
    });

    factory Blooper.fromJson(Map<String, dynamic> json) => Blooper(
        medium: json["medium"],
        title: json["title"],
        subjectId: json["subject_id"],
        alt: json["alt"],
        small: json["small"],
        resourceUrl: json["resource_url"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "title": title,
        "subject_id": subjectId,
        "alt": alt,
        "small": small,
        "resource_url": resourceUrl,
        "id": id,
    };
}

class Cast {
    Images avatars;
    String nameEn;
    String name;
    String alt;
    String id;

    Cast({
        this.avatars,
        this.nameEn,
        this.name,
        this.alt,
        this.id,
    });

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        avatars: Images.fromJson(json["avatars"]),
        nameEn: json["name_en"],
        name: json["name"],
        alt: json["alt"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "avatars": avatars.toJson(),
        "name_en": nameEn,
        "name": name,
        "alt": alt,
        "id": id,
    };
}

class Images {
    String small;
    String large;
    String medium;

    Images({
        this.small,
        this.large,
        this.medium,
    });

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"],
        large: json["large"],
        medium: json["medium"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
        "medium": medium,
    };
}

class Photo {
    String thumb;
    String image;
    String cover;
    String alt;
    String id;
    String icon;

    Photo({
        this.thumb,
        this.image,
        this.cover,
        this.alt,
        this.id,
        this.icon,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        thumb: json["thumb"],
        image: json["image"],
        cover: json["cover"],
        alt: json["alt"],
        id: json["id"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "image": image,
        "cover": cover,
        "alt": alt,
        "id": id,
        "icon": icon,
    };
}

class PopularComment {
    PopularCommentRating rating;
    int usefulCount;
    Author author;
    String subjectId;
    String content;
    DateTime createdAt;
    String id;

    PopularComment({
        this.rating,
        this.usefulCount,
        this.author,
        this.subjectId,
        this.content,
        this.createdAt,
        this.id,
    });

    factory PopularComment.fromJson(Map<String, dynamic> json) => PopularComment(
        rating: PopularCommentRating.fromJson(json["rating"]),
        usefulCount: json["useful_count"],
        author: Author.fromJson(json["author"]),
        subjectId: json["subject_id"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating.toJson(),
        "useful_count": usefulCount,
        "author": author.toJson(),
        "subject_id": subjectId,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}

class Author {
    String uid;
    String avatar;
    String signature;
    String alt;
    String id;
    String name;

    Author({
        this.uid,
        this.avatar,
        this.signature,
        this.alt,
        this.id,
        this.name,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        uid: json["uid"],
        avatar: json["avatar"],
        signature: json["signature"],
        alt: json["alt"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "avatar": avatar,
        "signature": signature,
        "alt": alt,
        "id": id,
        "name": name,
    };
}

class PopularCommentRating {
    dynamic max;
    dynamic value;
    dynamic min;

    PopularCommentRating({
        this.max,
        this.value,
        this.min,
    });

    factory PopularCommentRating.fromJson(Map<String, dynamic> json) => PopularCommentRating(
        max: json["max"],
        value: json["value"],
        min: json["min"],
    );

    Map<String, dynamic> toJson() => {
        "max": max,
        "value": value,
        "min": min,
    };
}

class PopularReview {
    PopularCommentRating rating;
    String title;
    String subjectId;
    Author author;
    String summary;
    String alt;
    String id;

    PopularReview({
        this.rating,
        this.title,
        this.subjectId,
        this.author,
        this.summary,
        this.alt,
        this.id,
    });

    factory PopularReview.fromJson(Map<String, dynamic> json) => PopularReview(
        rating: PopularCommentRating.fromJson(json["rating"]),
        title: json["title"],
        subjectId: json["subject_id"],
        author: Author.fromJson(json["author"]),
        summary: json["summary"],
        alt: json["alt"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating.toJson(),
        "title": title,
        "subject_id": subjectId,
        "author": author.toJson(),
        "summary": summary,
        "alt": alt,
        "id": id,
    };
}

class MovieDetailsRating {
    int max;
    double average;
    Map<String, dynamic> details;
    String stars;
    int min;

    MovieDetailsRating({
        this.max,
        this.average,
        this.details,
        this.stars,
        this.min,
    });

    factory MovieDetailsRating.fromJson(Map<String, dynamic> json) => MovieDetailsRating(
        max: json["max"],
        average: json["average"].toDouble(),
        details: Map.from(json["details"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        stars: json["stars"],
        min: json["min"],
    );

    Map<String, dynamic> toJson() => {
        "max": max,
        "average": average,
        "details": Map.from(details).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "stars": stars,
        "min": min,
    };
}

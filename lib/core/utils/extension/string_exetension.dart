
// ignore_for_file: unnecessary_this

  extension StringFormat on String {
  String get toFullImageUrl {
    return "https://flower.elevateegy.com/uploads/${this.split("https://flower.elevateegy.com/uploads/").last}";
  }
}



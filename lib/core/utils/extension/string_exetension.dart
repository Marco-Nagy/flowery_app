
// ignore_for_file: unnecessary_this

extension StringFormate on String {
  String imageFormat() {
    return "https://flower.elevateegy.com/uploads/${this.split("https://flower.elevateegy.com/uploads/").last}";
  }


}

class FoodWastePost {
  DateTime date;
  String imageURL;
  double latitude;
  double longitude;
  int quantity;

  FoodWastePost(snapshot, int index) {
    var post = snapshot.data.docs[index];
    this.date = post['date'].toDate();
    this.imageURL = post['imageURL'];
    this.latitude = post['latitude'];
    this.longitude = post['longitude'];
    this.quantity = post['quantity'];
  }
}

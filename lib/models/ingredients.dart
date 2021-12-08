class Ingredients{
  String? original;
  Ingredients({this.original});
  factory Ingredients.fromJson(Map<String , dynamic> json){

    return Ingredients(original:json['original']);
    }
}


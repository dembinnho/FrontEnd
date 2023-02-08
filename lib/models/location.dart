class Location {
  final String id_lieu;
  final int annee_tournage;
  final String type_tournage;
  final String nom_tournage;
  final String nom_realisateur;
  final String nom_producteur;
  final String adresse_lieu;

  const Location({ required this.id_lieu,
  required this.annee_tournage, required this.type_tournage, required this.nom_tournage, required this.nom_realisateur, required this.nom_producteur, required this.adresse_lieu,});

  factory Location.fromJson(Map json) {
    return Location(
      annee_tournage: json['year'] ?? "", id_lieu: json['sourceLocationId'] ?? "", type_tournage: json['filmType'] ?? "", nom_tournage: json['filmName'] ?? "", nom_realisateur: json['filmDirectorName'] ?? "", nom_producteur: json['filmProducerName'] ?? "", adresse_lieu: json['address'] ?? "",
    );
  }
}

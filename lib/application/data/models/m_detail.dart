import 'package:equatable/equatable.dart';
import 'package:foodies/application/domain/entities/detail.dart';

class MDetail extends Equatable {

  final String idMeal;
  final String strMeal;
  final String? strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strIngredient16;
  final String? strIngredient17;
  final String? strIngredient18;
  final String? strIngredient19;
  final String? strIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  const MDetail(
      {required this.idMeal,
        required this.strMeal,
        this.strDrinkAlternate,
        this.strCategory,
        this.strArea,
        this.strInstructions,
        this.strMealThumb,
        this.strTags,
        this.strYoutube,
        this.strIngredient1,
        this.strIngredient2,
        this.strIngredient3,
        this.strIngredient4,
        this.strIngredient5,
        this.strIngredient6,
        this.strIngredient7,
        this.strIngredient8,
        this.strIngredient9,
        this.strIngredient10,
        this.strIngredient11,
        this.strIngredient12,
        this.strIngredient13,
        this.strIngredient14,
        this.strIngredient15,
        this.strIngredient16,
        this.strIngredient17,
        this.strIngredient18,
        this.strIngredient19,
        this.strIngredient20,
        this.strMeasure1,
        this.strMeasure2,
        this.strMeasure3,
        this.strMeasure4,
        this.strMeasure5,
        this.strMeasure6,
        this.strMeasure7,
        this.strMeasure8,
        this.strMeasure9,
        this.strMeasure10,
        this.strMeasure11,
        this.strMeasure12,
        this.strMeasure13,
        this.strMeasure14,
        this.strMeasure15,
        this.strMeasure16,
        this.strMeasure17,
        this.strMeasure18,
        this.strMeasure19,
        this.strMeasure20,
        this.strSource,
        this.strImageSource,
        this.strCreativeCommonsConfirmed,
        this.dateModified});

  factory MDetail.fromJson(Map<String, dynamic> json) {
    return MDetail(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strDrinkAlternate: json['strDrinkAlternate'],
        strCategory: json['strCategory'],
        strArea: json['strArea'],
        strInstructions: json['strInstructions'],
        strMealThumb: json['strMealThumb'],
        strTags: json['strTags'],
        strYoutube: json['strYoutube'],
        strIngredient1: json['strIngredient1'],
        strIngredient2: json['strIngredient2'],
        strIngredient3: json['strIngredient3'],
        strIngredient4: json['strIngredient4'],
        strIngredient5: json['strIngredient5'],
        strIngredient6: json['strIngredient6'],
        strIngredient7: json['strIngredient7'],
        strIngredient8: json['strIngredient8'],
        strIngredient9: json['strIngredient9'],
        strIngredient10: json['strIngredient10'],
        strIngredient11: json['strIngredient11'],
        strIngredient12: json['strIngredient12'],
        strIngredient13: json['strIngredient13'],
        strIngredient14: json['strIngredient14'],
        strIngredient15: json['strIngredient15'],
        strIngredient16: json['strIngredient16'],
        strIngredient17: json['strIngredient17'],
        strIngredient18: json['strIngredient18'],
        strIngredient19: json['strIngredient19'],
        strIngredient20: json['strIngredient20'],
        strMeasure1: json['strMeasure1'],
        strMeasure2: json['strMeasure2'],
        strMeasure3: json['strMeasure3'],
        strMeasure4: json['strMeasure4'],
        strMeasure5: json['strMeasure5'],
        strMeasure6: json['strMeasure6'],
        strMeasure7: json['strMeasure7'],
        strMeasure8: json['strMeasure8'],
        strMeasure9: json['strMeasure9'],
        strMeasure10: json['strMeasure10'],
        strMeasure11: json['strMeasure11'],
        strMeasure12: json['strMeasure12'],
        strMeasure13: json['strMeasure13'],
        strMeasure14: json['strMeasure14'],
        strMeasure15: json['strMeasure15'],
        strMeasure16: json['strMeasure16'],
        strMeasure17: json['strMeasure17'],
        strMeasure18: json['strMeasure18'],
        strMeasure19: json['strMeasure19'],
        strMeasure20: json['strMeasure20'],
        strSource: json['strSource'],
        strImageSource: json['strImageSource'],
        strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
        dateModified: json['dateModified']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strDrinkAlternate'] = strDrinkAlternate;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;
    data['strIngredient1'] = strIngredient1;
    data['strIngredient2'] = strIngredient2;
    data['strIngredient3'] = strIngredient3;
    data['strIngredient4'] = strIngredient4;
    data['strIngredient5'] = strIngredient5;
    data['strIngredient6'] = strIngredient6;
    data['strIngredient7'] = strIngredient7;
    data['strIngredient8'] = strIngredient8;
    data['strIngredient9'] = strIngredient9;
    data['strIngredient10'] = strIngredient10;
    data['strIngredient11'] = strIngredient11;
    data['strIngredient12'] = strIngredient12;
    data['strIngredient13'] = strIngredient13;
    data['strIngredient14'] = strIngredient14;
    data['strIngredient15'] = strIngredient15;
    data['strIngredient16'] = strIngredient16;
    data['strIngredient17'] = strIngredient17;
    data['strIngredient18'] = strIngredient18;
    data['strIngredient19'] = strIngredient19;
    data['strIngredient20'] = strIngredient20;
    data['strMeasure1'] = strMeasure1;
    data['strMeasure2'] = strMeasure2;
    data['strMeasure3'] = strMeasure3;
    data['strMeasure4'] = strMeasure4;
    data['strMeasure5'] = strMeasure5;
    data['strMeasure6'] = strMeasure6;
    data['strMeasure7'] = strMeasure7;
    data['strMeasure8'] = strMeasure8;
    data['strMeasure9'] = strMeasure9;
    data['strMeasure10'] = strMeasure10;
    data['strMeasure11'] = strMeasure11;
    data['strMeasure12'] = strMeasure12;
    data['strMeasure13'] = strMeasure13;
    data['strMeasure14'] = strMeasure14;
    data['strMeasure15'] = strMeasure15;
    data['strMeasure16'] = strMeasure16;
    data['strMeasure17'] = strMeasure17;
    data['strMeasure18'] = strMeasure18;
    data['strMeasure19'] = strMeasure19;
    data['strMeasure20'] = strMeasure20;
    data['strSource'] = strSource;
    data['strImageSource'] = strImageSource;
    data['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    data['dateModified'] = dateModified;
    return data;
  }

  Detail toEntity() => Detail(
      idMeal: idMeal,
      strMeal: strMeal,
      strDrinkAlternate: strDrinkAlternate,
      strCategory: strCategory,
      strArea: strArea,
      strInstructions: strInstructions,
      strMealThumb: strMealThumb,
      strTags: strTags,
      strYoutube: strYoutube,
      strIngredient1: strIngredient1,
      strIngredient2: strIngredient2,
      strIngredient3: strIngredient3,
      strIngredient4: strIngredient4,
      strIngredient5: strIngredient5,
      strIngredient6: strIngredient6,
      strIngredient7: strIngredient7,
      strIngredient8: strIngredient8,
      strIngredient9: strIngredient9,
      strIngredient10: strIngredient10,
      strIngredient11: strIngredient11,
      strIngredient12: strIngredient12,
      strIngredient13: strIngredient13,
      strIngredient14: strIngredient14,
      strIngredient15: strIngredient15,
      strIngredient16: strIngredient16,
      strIngredient17: strIngredient17,
      strIngredient18: strIngredient18,
      strIngredient19: strIngredient19,
      strIngredient20: strIngredient20,
      strMeasure1: strMeasure1,
      strMeasure2: strMeasure2,
      strMeasure3: strMeasure3,
      strMeasure4: strMeasure4,
      strMeasure5: strMeasure5,
      strMeasure6: strMeasure6,
      strMeasure7: strMeasure7,
      strMeasure8: strMeasure8,
      strMeasure9: strMeasure9,
      strMeasure10: strMeasure10,
      strMeasure11: strMeasure11,
      strMeasure12: strMeasure12,
      strMeasure13: strMeasure13,
      strMeasure14: strMeasure14,
      strMeasure15: strMeasure15,
      strMeasure16: strMeasure16,
      strMeasure17: strMeasure17,
      strMeasure18: strMeasure18,
      strMeasure19: strMeasure19,
      strMeasure20: strMeasure20,
      strSource: strSource,
      strImageSource: strImageSource,
      strCreativeCommonsConfirmed: strCreativeCommonsConfirmed,
      dateModified: dateModified
  );

  @override
  List<Object?> get props => [idMeal];
}

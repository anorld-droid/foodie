import 'package:trice/model/apartment/apartment_ad.dart';

String image1 =
    'https://plus.unsplash.com/premium_photo-1665520346857-54b9ef5b028a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXBhcnRtZW50JTIwYnVpbGRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';
String image2 =
    'https://images.unsplash.com/photo-1551361415-69c87624334f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXBhcnRtZW50JTIwYnVpbGRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';
String image3 =
    'https://images.unsplash.com/photo-1624204386084-dd8c05e32226?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YXBhcnRtZW50JTIwYnVpbGRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';
String image4 =
    'https://images.unsplash.com/photo-1619542402915-dcaf30e4e2a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YXBhcnRtZW50JTIwYnVpbGRpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60';
String image5 =
    'https://images.unsplash.com/photo-1565363887715-8884629e09ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFwYXJ0bWVudCUyMGJ1aWxkaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
String image6 =
    'https://images.unsplash.com/photo-1582883545851-725a3b9502ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGFwYXJ0bWVudCUyMGJ1aWxkaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';

var apartment1 = ApartmentAdModel(
    unOccupied: 6,
    priceRange: '12,000 - 26,000',
    imagesUrl: [
      image1,
      image2,
      image3,
      image4,
      image5,
      image6,
    ],
    name: 'Imani Hostel',
    location: 'Maseno behind ACK Church');
var apartment2 = ApartmentAdModel(
    unOccupied: 2,
    priceRange: '5,000 - 56,000',
    imagesUrl: [
      image5,
      image3,
      image6,
    ],
    name: 'Nyabundi Hostel',
    location: 'Maseno next Tripple T');
var apartment3 = ApartmentAdModel(
    unOccupied: 4,
    priceRange: '10,000 - 20,000',
    imagesUrl: [
      image6,
      image2,
      image3,
      image1,
    ],
    name: 'Almasi Apartments',
    location: 'Machakos, Konza City');
var apartment4 = ApartmentAdModel(
    unOccupied: 1,
    priceRange: '2,000 - 6,000',
    imagesUrl: [
      image6,
      image5,
      image4,
      image3,
    ],
    name: 'Nyaruki Home',
    location: 'Pipeline next to SouthField Mall');
var apartment5 = ApartmentAdModel(
    unOccupied: 8,
    priceRange: '15,000 - 38,000',
    imagesUrl: [image3, image4, image5],
    name: 'Fadhili Apartments',
    location: 'Webuye before deliverance church');
var apartment6 = ApartmentAdModel(
    unOccupied: 9,
    priceRange: '42,000 - 126,000',
    imagesUrl: [
      image2,
      image3,
      image4,
      image6,
    ],
    name: 'Afya Rentals',
    location: 'Kitale next to Afya centre');
var apartment7 = ApartmentAdModel(
    unOccupied: 3,
    priceRange: '112,000 - 526,000',
    imagesUrl: [
      image6,
      image4,
      image5,
      image1,
      image3,
      image2,
    ],
    name: 'Jenkins Houses',
    location: 'Kiminini behind ST.Teresa\'s Girls');
var apartment8 = ApartmentAdModel(
    unOccupied: 12,
    priceRange: '102,000 - 216,000',
    imagesUrl: [
      image3,
      image4,
      image5,
      image6,
    ],
    name: 'Jaber Apartments',
    location: 'Kisumu 100m after the Airport');
var apartment9 = ApartmentAdModel(
    unOccupied: 0,
    priceRange: '22,000 - 76,000',
    imagesUrl: [
      image1,
      image3,
      image4,
      image6,
    ],
    name: 'Gaichomo Rentals',
    location: 'Moi\'s Bridge net to God\'s Favor Clinic');
var apartment10 = ApartmentAdModel(
    unOccupied: 0,
    priceRange: '2,000 - 4,000',
    imagesUrl: [
      image1,
      image3,
      image5,
    ],
    name: 'Haro Apartments',
    location: 'Eldoret behind Poa Place');
var apartment11 = ApartmentAdModel(
    unOccupied: 7,
    priceRange: '6,000 - 16,000',
    imagesUrl: [
      image1,
      image2,
      image3,
      image4,
      image5,
      image6,
    ],
    name: 'Guest House Apartments',
    location: 'Kericho nest to Aplamo tea factory');
var apartment12 = ApartmentAdModel(
    unOccupied: 10,
    priceRange: '11,000 - 21,000',
    imagesUrl: [image1, image2, image3, image4],
    name: 'Mama Njuguna Apartments',
    location: 'Kitale 200m past Equip Africa');
var apartment13 = ApartmentAdModel(
    unOccupied: 13,
    priceRange: '14,000 - 46,000',
    imagesUrl: [
      image3,
      image4,
      image5,
      image6,
      image1,
      image2,
    ],
    name: 'ODEL Apartments',
    location: 'Kakamega next to Muliro gardens');

var apartments = [
  apartment1,
  apartment2,
  apartment3,
  apartment4,
  apartment5,
  apartment6,
  apartment7,
  apartment8,
  apartment9,
  apartment10,
  apartment11,
  apartment12,
  apartment13,
];

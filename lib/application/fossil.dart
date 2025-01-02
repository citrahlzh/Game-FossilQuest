import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class Fossil {
  final String name;
  final Image image;
  final String description;

  Fossil({required this.name, required this.image, required this.description});
}

final List<Image> collectionImages = [
  Image.asset('../../assets/images/fossil/daun.png'),
  Image.asset('../../assets/images/fossil/ikan.png'),
  Image.asset('../../assets/images/fossil/kepala.png'),
  Image.asset('../../assets/images/fossil/kerang.png'),
  Image.asset('../../assets/images/fossil/mosasaurus.png'),
  Image.asset('../../assets/images/fossil/ornithopoda.png'),
  Image.asset('../../assets/images/fossil/pteranodon.png'),
  Image.asset('../../assets/images/fossil/theropoda.png'),
  Image.asset('../../assets/images/fossil/triceratops.png'),
  Image.asset('../../assets/images/fossil/tulang.png'),
  Image.asset('../../assets/images/fossil/tylosaurus.png'),
  Image.asset('../../assets/images/fossil/tyrannosaurus.png'),
  Image.asset('../../assets/images/fossil/velociraptor.png'),
];

final List<Fossil> fossils = [
  Fossil(name: 'Daun', image: collectionImages[0], description: 'Daun'),
  Fossil(name: 'Ikan', image: collectionImages[1], description: 'Ikan'),
  Fossil(name: 'Kepala', image: collectionImages[2], description: 'Kepala'),
  Fossil(name: 'Kerang', image: collectionImages[3], description: 'Kerang'),
  Fossil(
      name: 'Mosasaurus',
      image: collectionImages[4],
      description:
          'Mosasaurus adalah genus dari reptil laut besar yang hidup pada zaman Kapur Akhir, sekitar 70 hingga 66 juta tahun yang lalu, pada masa akhir periode Mesozoikum.'),
  Fossil(
      name: 'Ornithopoda',
      image: collectionImages[5],
      description:
          'Ornithopoda adalah klad dari dinosaurus ornithischia, yang berevolusi dari perumput kecil bipedal, yang perlahan bertambah ukuran dan jumlahnya hingga akhirnya menjadi salahsatu kelompok herbivor yang paling sukses pada dunia Periode Kapur, mendominasi tanah Amerika Utara.'),
  Fossil(
      name: 'Pteranodon',
      image: collectionImages[6],
      description:
          'Pteranodon adalah genus pterosaurus yang termasuk beberapa reptil terbang terbesar yang pernah diketahui, dengan rentang sayap melebihi 7 meter. '),
  Fossil(
      name: 'Theropoda',
      image: collectionImages[7],
      description:
          'Theropoda adalah klad dinosaurus yang memiliki tulang berongga dan tiga jari kaki. Theropoda biasanya diklasifikasikan sebagai kelompok dinosaurus Saurischia. Theropoda secara garis keturunan adalah karnivora,'),
  Fossil(
      name: 'Triceratops',
      image: collectionImages[8],
      description:
          'Triceratops adalah genus dari dinosaurus ceratopsia chasmosaurinae yang hidup pada sub-kala Maastrichtium akhir pada kala Kapur Akhir, sekitar 68 hingga 66 juta tahun lalu pada wilayah yang sekarang merupakan Amerika Utara.'),
  Fossil(name: 'Tulang', image: collectionImages[9], description: 'Tulang'),
  Fossil(
      name: 'Tylosaurus',
      image: collectionImages[10],
      description:
          'Tylosaurus adalah hewan dari superfamili Mosasauroidea, sebuah kelompok, reptil laut pemangsa yang berkerabat dekat dengan biawak dan ular, dari periode Kapur Akhir.'),
  Fossil(
      name: 'Tyrannosaurus',
      image: collectionImages[11],
      description:
          'Tyrannosaurus adalah sebuah genus dinosaurus teropoda yang tergolong ke dalam klad Coelurosauria. Spesies Tyrannosaurus rex adalah salah satu teropoda besar yang paling dikenal oleh khalayak luas.'),
  Fossil(
      name: 'Velociraptor',
      image: collectionImages[12],
      description:
          'Velociraptor adalah genus dari dinosaurus Dromaeosaurid yang hidup di Asia pada kala Kapur Akhir, sekitar 75 hingga 71 juta tahun lalu. Dari genus tersebut, dua spesies sudah dideskripsikan. Spesies tipenya adala V. mongoliensis, yang dinamai dan dideskripsikan pada 1924.'),
];

Type FossilIsar = Fossil;
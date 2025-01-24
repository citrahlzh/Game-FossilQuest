class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnswer});

  List<String> getShuffledOptions() {
    final shuffledOptions = List<String>.from(options)..shuffle();
    return shuffledOptions;
  }
}

List<Question> questions = [
  Question(
      question: 'Apa ibu kota Indonesia?',
      options: ['Jakarta', 'Bandung', 'Surabaya'],
      correctAnswer: 'Jakarta'),
  Question(
      question: 'Siapa penemu lampu pijar?',
      options: ['Thomas Edison', 'Nikola Tesla', 'Alexander Graham Bell'],
      correctAnswer: 'Thomas Edison'),
  Question(
      question: 'Gunung tertinggi di dunia adalah?',
      options: ['Gunung Everest', 'Gunung Kilimanjaro', 'Gunung Elbrus'],
      correctAnswer: 'Gunung Everest'),
  Question(
      question: 'Berapakah hasil dari 9 x 8?',
      options: ['72', '81', '64'],
      correctAnswer: '72'),
  Question(
      question: 'Siapa presiden pertama Indonesia?',
      options: ['Soekarno', 'Soeharto', 'B.J. Habibie'],
      correctAnswer: 'Soekarno'),
  Question(
      question: 'Hewan nasional Australia adalah?',
      options: ['Kanguru', 'Koala', 'Emu'],
      correctAnswer: 'Kanguru'),
  Question(
      question: 'Sebutkan planet terkecil di tata surya kita?',
      options: ['Merkurius', 'Mars', 'Venus'],
      correctAnswer: 'Merkurius'),
  Question(
      question: 'Berapa jumlah provinsi di Indonesia pada tahun 2022?',
      options: ['34', '35', '36'],
      correctAnswer: '34'),
  Question(
      question: 'Siapa pengarang buku Harry Potter?',
      options: ['J.K. Rowling', 'J.R.R. Tolkien', 'George R.R. Martin'],
      correctAnswer: 'J.K. Rowling'),
  Question(
      question: 'Apa simbol kimia untuk air?',
      options: ['H2O', 'O2', 'CO2'],
      correctAnswer: 'H2O'),
  Question(
      question: 'Apa nama ibu kota Jepang?',
      options: ['Tokyo', 'Osaka', 'Kyoto'],
      correctAnswer: 'Tokyo'),
  Question(
      question: 'Berapa sisi pada segitiga?',
      options: ['3', '4', '5'],
      correctAnswer: '3'),
  Question(
      question: 'Benua terbesar di dunia adalah?',
      options: ['Asia', 'Afrika', 'Eropa'],
      correctAnswer: 'Asia'),
  Question(
      question: 'Lagu kebangsaan Indonesia adalah?',
      options: ['Indonesia Raya', 'Tanah Airku', 'Bagimu Negeri'],
      correctAnswer: 'Indonesia Raya'),
  Question(
      question: 'Apa nama planet merah di tata surya?',
      options: ['Mars', 'Jupiter', 'Venus'],
      correctAnswer: 'Mars'),
  Question(
      question: 'Siapa tokoh yang dijuluki "Bapak Pendidikan Nasional"?',
      options: ['Ki Hajar Dewantara', 'Soekarno', 'Hatta'],
      correctAnswer: 'Ki Hajar Dewantara'),
  Question(
      question: 'Apa warna bendera Indonesia?',
      options: ['Merah dan Putih', 'Merah dan Kuning', 'Putih dan Biru'],
      correctAnswer: 'Merah dan Putih'),
  Question(
      question: 'Hewan tercepat di darat adalah?',
      options: ['Cheetah', 'Kuda', 'Singa'],
      correctAnswer: 'Cheetah'),
  Question(
      question: 'Berapa jumlah huruf dalam alfabet bahasa Indonesia?',
      options: ['26', '28', '30'],
      correctAnswer: '26'),
  Question(
      question: 'Siapa ilmuwan yang mengembangkan teori relativitas?',
      options: ['Albert Einstein', 'Isaac Newton', 'Galileo Galilei'],
      correctAnswer: 'Albert Einstein'),
  Question(
      question: 'Apa nama mata uang Jepang?',
      options: ['Yen', 'Won', 'Ringgit'],
      correctAnswer: 'Yen'),
  Question(
      question: 'Apa zat yang membuat daun berwarna hijau?',
      options: ['Klorofil', 'Nitrogen', 'Oksigen'],
      correctAnswer: 'Klorofil'),
  Question(
      question: 'Berapa jumlah pemain dalam tim sepak bola?',
      options: ['11', '10', '12'],
      correctAnswer: '11'),
  Question(
      question: 'Apa nama hewan yang bisa hidup di darat dan di air?',
      options: ['Amfibi', 'Reptil', 'Mamalia'],
      correctAnswer: 'Amfibi'),
  Question(
      question: 'Siapa penulis novel "Laskar Pelangi"?',
      options: ['Andrea Hirata', 'Tere Liye', 'Habiburrahman El Shirazy'],
      correctAnswer: 'Andrea Hirata'),
  Question(
      question: 'Apa nama laut terbesar di dunia?',
      options: ['Samudra Pasifik', 'Samudra Atlantik', 'Samudra Hindia'],
      correctAnswer: 'Samudra Pasifik'),
  Question(
      question: 'Apa lambang kimia untuk besi?',
      options: ['Fe', 'Cu', 'Au'],
      correctAnswer: 'Fe'),
  Question(
      question: 'Siapa dewa utama dalam mitologi Yunani?',
      options: ['Zeus', 'Poseidon', 'Hades'],
      correctAnswer: 'Zeus'),
  Question(
      question: 'Apa nama alat untuk mengukur gempa bumi?',
      options: ['Seismograf', 'Barometer', 'Higrometer'],
      correctAnswer: 'Seismograf'),
  Question(
      question: 'Siapa penulis puisi "Aku"?',
      options: ['Chairil Anwar', 'WS Rendra', 'Sapardi Djoko Damono'],
      correctAnswer: 'Chairil Anwar'),
  Question(
      question: 'Apa ibu kota Italia?',
      options: ['Roma', 'Milan', 'Napoli'],
      correctAnswer: 'Roma'),
  Question(
      question: 'Berapa jumlah warna dalam pelangi?',
      options: ['7', '6', '8'],
      correctAnswer: '7'),
  Question(
      question: 'Apa alat musik tradisional dari Jawa Barat?',
      options: ['Angklung', 'Gamelan', 'Sasando'],
      correctAnswer: 'Angklung'),
  Question(
      question: 'Siapa ilmuwan yang menemukan gravitasi?',
      options: ['Isaac Newton', 'Albert Einstein', 'Galileo Galilei'],
      correctAnswer: 'Isaac Newton'),
  Question(
      question: 'Apa nama pulau terbesar di dunia?',
      options: ['Greenland', 'Madagaskar', 'Kalimantan'],
      correctAnswer: 'Greenland'),
  Question(
      question: 'Berapa sudut dalam sebuah persegi panjang?',
      options: ['4', '6', '8'],
      correctAnswer: '4'),
  Question(
      question: 'Apa ibukota negara Thailand?',
      options: ['Bangkok', 'Chiang Mai', 'Phuket'],
      correctAnswer: 'Bangkok'),
  Question(
      question: 'Apa nama gas yang paling banyak di atmosfer bumi?',
      options: ['Nitrogen', 'Oksigen', 'Karbon dioksida'],
      correctAnswer: 'Nitrogen'),
  Question(
      question: 'Apa hewan yang merupakan simbol nasional Tiongkok?',
      options: ['Panda', 'Harimau', 'Gajah'],
      correctAnswer: 'Panda'),
  Question(
      question: 'Siapa pelukis terkenal yang melukis "Starry Night"?',
      options: ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci'],
      correctAnswer: 'Vincent van Gogh'),
  Question(
      question: 'Berapa jumlah tulang dalam tubuh manusia dewasa?',
      options: ['206', '210', '199'],
      correctAnswer: '206'),
  Question(
      question: 'Apa nama sungai terpanjang di dunia?',
      options: ['Sungai Nil', 'Sungai Amazon', 'Sungai Yangtze'],
      correctAnswer: 'Sungai Nil'),
  Question(
      question: 'Apa ibukota negara Mesir?',
      options: ['Kairo', 'Iskandariyah', 'Luxor'],
      correctAnswer: 'Kairo'),
  Question(
      question: 'Apa simbol kimia untuk oksigen?',
      options: ['O', 'O2', 'O3'],
      correctAnswer: 'O'),
  Question(
      question: 'Apa nama festival lampion terkenal di Tiongkok?',
      options: ['Festival Musim Semi', 'Festival Qingming', 'Festival Lentera'],
      correctAnswer: 'Festival Lentera'),
];

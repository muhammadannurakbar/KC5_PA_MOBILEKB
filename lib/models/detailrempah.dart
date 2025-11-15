import 'package:flutter/material.dart';

class DetailRempah {
  final String name;
  final String latinName;
  final String imagePath;
  final Color color;
  final String family;
  final String origin;
  final String description;
  final List<String> activeCompounds;
  final List<Map<String, dynamic>> benefits;
  final List<String> usage;
  final List<String> warnings;

  DetailRempah({
    required this.name,
    required this.latinName,
    required this.imagePath,
    required this.color,
    required this.family,
    required this.origin,
    required this.description,
    required this.activeCompounds,
    required this.benefits,
    required this.usage,
    required this.warnings,
  });

  static final Map<String, DetailRempah> allSpices = {
    'Jahe': DetailRempah(
      name: 'Jahe',
      latinName: 'Zingiber officinale',
      imagePath: 'assets/images/jahe.jpg',
      color: const Color(0xFFD4A574),
      family: 'Zingiberaceae',
      origin: 'Asia Tenggara',
      description: 'Jahe adalah tanaman rimpang yang sangat populer sebagai rempah-rempah dan bahan obat. Rimpang jahe berbentuk jemari yang menggembung di ruas-ruas tengah. Rasa dominan pedas disebabkan senyawa keton bernama zingeron.',
      activeCompounds: [
        'Gingerol (senyawa anti-inflamasi)',
        'Shogaol (memberikan rasa pedas)',
        'Minyak atsiri (aroma khas jahe)',
        'Vitamin C (antioksidan)',
        'Magnesium (mineral penting)',
      ],
      benefits: [
        {'icon': Icons.local_fire_department, 'title': 'Anti-inflamasi', 'desc': 'Mengurangi peradangan'},
        {'icon': Icons.restaurant, 'title': 'Pencernaan', 'desc': 'Melancarkan sistem cerna'},
        {'icon': Icons.sick, 'title': 'Pereda Mual', 'desc': 'Mengatasi mual & muntah'},
        {'icon': Icons.shield, 'title': 'Imunitas', 'desc': 'Meningkatkan daya tahan'},
        {'icon': Icons.fitness_center, 'title': 'Nyeri Otot', 'desc': 'Meredakan nyeri sendi'},
        {'icon': Icons.trending_up, 'title': 'Metabolisme', 'desc': 'Meningkatkan pembakaran'},
      ],
      usage: [
        'Wedang jahe untuk menghangatkan badan',
        'Bumbu masakan (rendang, soto, gulai)',
        'Teh jahe untuk kesehatan',
        'Permen jahe untuk pereda tenggorokan',
        'Kompres untuk nyeri otot',
      ],
      warnings: [
        'Hindari konsumsi berlebihan (>4 gram/hari)',
        'Bisa berinteraksi dengan obat pengencer darah',
        'Tidak dianjurkan untuk penderita batu empedu',
        'Konsultasi dokter jika sedang hamil',
      ],
    ),
    'Kencur': DetailRempah(
      name: 'Kencur',
      latinName: 'Kaempferia galanga',
      imagePath: 'assets/images/kencur.jpg',
      color: const Color(0xFFE8D5B7),
      family: 'Zingiberaceae',
      origin: 'Asia Tenggara',
      description: 'Kencur adalah tanaman rimpang yang memiliki aroma yang sangat khas dan menyengat. Tanaman ini tumbuh subur di dataran rendah atau pegunungan. Kencur banyak digunakan dalam jamu tradisional Indonesia.',
      activeCompounds: [
        'Etil sinamat (senyawa aromatik utama)',
        'Minyak atsiri (aroma khas kencur)',
        'Alkaloid (senyawa aktif)',
        'Flavonoid (antioksidan)',
        'Mineral (kalium, fosfor)',
      ],
      benefits: [
        {'icon': Icons.air, 'title': 'Pereda Batuk', 'desc': 'Melegakan tenggorokan'},
        {'icon': Icons.energy_savings_leaf, 'title': 'Stamina', 'desc': 'Meningkatkan energi'},
        {'icon': Icons.restaurant_menu, 'title': 'Pencernaan', 'desc': 'Mengatasi masuk angin'},
        {'icon': Icons.favorite, 'title': 'Afrodisiak', 'desc': 'Meningkatkan vitalitas'},
        {'icon': Icons.water_drop, 'title': 'Diuretik', 'desc': 'Melancarkan BAK'},
        {'icon': Icons.healing, 'title': 'Anti-radang', 'desc': 'Mengurangi bengkak'},
      ],
      usage: [
        'Jamu beras kencur tradisional',
        'Bumbu pecel dan rujak',
        'Obat batuk dan flu alami',
        'Campuran minuman herbal',
        'Bumbu masakan tradisional',
      ],
      warnings: [
        'Tidak dianjurkan untuk ibu hamil',
        'Hindari konsumsi berlebihan',
        'Dapat menyebabkan iritasi lambung jika berlebihan',
        'Konsultasi dokter jika ada alergi',
      ],
    ),
    'Kunyit': DetailRempah(
      name: 'Kunyit',
      latinName: 'Curcuma longa',
      imagePath: 'assets/images/kunyit.jpg',
      color: const Color(0xFFFFD54F),
      family: 'Zingiberaceae',
      origin: 'Asia Tenggara',
      description: 'Kunyit adalah tanaman rimpang yang memiliki warna kuning cerah khas. Digunakan sebagai bumbu masakan dan obat tradisional sejak ribuan tahun yang lalu. Rimpang kunyit memiliki aroma khas dan rasa sedikit pahit.',
      activeCompounds: [
        'Kurkumin (senyawa anti-inflamasi kuat)',
        'Minyak atsiri (aroma khas kunyit)',
        'Vitamin C (antioksidan alami)',
        'Kalium & Magnesium (mineral penting)',
        'Zat besi (pembentuk darah)',
      ],
      benefits: [
        {'icon': Icons.local_fire_department, 'title': 'Anti-inflamasi', 'desc': 'Mengurangi peradangan'},
        {'icon': Icons.shield, 'title': 'Antioksidan', 'desc': 'Melawan radikal bebas'},
        {'icon': Icons.favorite, 'title': 'Kesehatan Jantung', 'desc': 'Menurunkan kolesterol'},
        {'icon': Icons.psychology, 'title': 'Kesehatan Otak', 'desc': 'Mencegah Alzheimer'},
        {'icon': Icons.coronavirus, 'title': 'Antibakteri', 'desc': 'Melawan bakteri'},
        {'icon': Icons.star, 'title': 'Imunitas', 'desc': 'Memperkuat tubuh'},
      ],
      usage: [
        'Bumbu masakan (kari, rendang, soto, gulai)',
        'Minuman (jamu kunyit asam, golden milk)',
        'Pewarna alami makanan (nasi kuning)',
        'Jamu untuk kesehatan wanita',
        'Masker kecantikan untuk kulit glowing',
      ],
      warnings: [
        'Konsultasi dokter jika sedang hamil/menyusui',
        'Tidak dianjurkan bagi penderita batu empedu',
        'Dapat berinteraksi dengan obat pengencer darah',
        'Hindari konsumsi berlebihan',
      ],
    ),
    'Lengkuas': DetailRempah(
      name: 'Lengkuas',
      latinName: 'Alpinia galanga',
      imagePath: 'assets/images/lengkuas.jpg',
      color: const Color(0xFFFFAB91),
      family: 'Zingiberaceae',
      origin: 'Asia Tenggara',
      description: 'Lengkuas adalah tanaman rimpang yang memiliki aroma tajam dan rasa pedas. Rimpangnya berwarna putih kemerahan dengan cincin-cincin cokelat. Lengkuas sangat populer dalam masakan Asia Tenggara.',
      activeCompounds: [
        'Galangin (antioksidan kuat)',
        'Minyak atsiri (aroma khas lengkuas)',
        'Flavonoid (anti-inflamasi)',
        'Beta-sitosterol (kesehatan jantung)',
        'Eugenol (antiseptik alami)',
      ],
      benefits: [
        {'icon': Icons.coronavirus, 'title': 'Antibakteri', 'desc': 'Melawan infeksi'},
        {'icon': Icons.restaurant, 'title': 'Pencernaan', 'desc': 'Mengatasi masalah perut'},
        {'icon': Icons.healing, 'title': 'Rematik', 'desc': 'Meredakan nyeri sendi'},
        {'icon': Icons.bug_report, 'title': 'Anti-jamur', 'desc': 'Mencegah infeksi jamur'},
        {'icon': Icons.medical_services, 'title': 'Pereda Nyeri', 'desc': 'Mengurangi sakit'},
        {'icon': Icons.shield, 'title': 'Antioksidan', 'desc': 'Melawan radikal bebas'},
      ],
      usage: [
        'Bumbu gulai dan kari',
        'Rendang dan opor ayam',
        'Soto dan sup',
        'Tom yum (masakan Thailand)',
        'Obat tradisional untuk rematik',
      ],
      warnings: [
        'Aman dalam jumlah wajar sebagai bumbu',
        'Hindari konsumsi berlebihan dalam bentuk suplemen',
        'Konsultasi dokter jika ada kondisi kesehatan khusus',
        'Tidak dianjurkan untuk ibu hamil dalam dosis tinggi',
      ],
    ),
  };

  static DetailRempah? getSpiceByName(String name) {
    return allSpices[name];
  }

  static DetailRempah getDefaultSpice() {
    return allSpices['Kunyit']!;
  }
}
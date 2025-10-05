class Mahasiswa {
// Properties (atribut)
  String nama;
  String nim;
  String jurusan;
  int angkatan;
// Constructor
  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.angkatan,
  });
// Method
  void tampilkanData() {
    print("Nama : $nama");
    print("NIM : $nim");
    print("Jurusan : $jurusan");
    print("Angkatan : $angkatan");
  }
}

class AsistenDosen extends Mahasiswa {
  String mataKuliah;
  AsistenDosen({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
    required this.mataKuliah,
  }) : super(
          nama: nama,
          nim: nim,
          jurusan: jurusan,
          angkatan: angkatan,
        );
// Override method
  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Asisten MK: $mataKuliah");
  }
}

abstract class Pendaftaran {
  void daftarMatkul(String matkul);
}

class MahasiswaAktif extends Mahasiswa implements Pendaftaran {
  List<String> matkulDiambil = [];
  MahasiswaAktif({
    required super.nama,
    required super.nim,
    required super.jurusan,
    required super.angkatan,
  });

  @override
  void daftarMatkul(String matkul) {
    matkulDiambil.add(matkul);
    print("$nama berhasil daftar mata kuliah $matkul");
  }
}

void main() {
// Buat object mahasiswa biasa
  var mhs1 = Mahasiswa(
    nama: "Mahesha Suro",
    nim: "1125170737",
    jurusan: "Teknik Informatika",
    angkatan: 2025,
  );
  mhs1.tampilkanData();
  print("----------");
// Buat object asisten dosen
  var asdos = AsistenDosen(
    nama: "Siti Aminah",
    nim: "654321",
    jurusan: "Sistem Informasi",
    angkatan: 2021,
    mataKuliah: "Pemrograman Mobile",
  );
  asdos.tampilkanData();
  print("----------");
// Mahasiswa aktif implementasi interface
  var mhs2 = MahasiswaAktif(
    nama: "Wahyu Slamet Adi Triyono",
    nim: "1125170131",
    jurusan: "Teknik Informatika",
    angkatan: 2025,
  );
  mhs2.daftarMatkul("Algoritma");
  mhs2.daftarMatkul("Basis Data");
  mhs2.tampilkanData();
  print("Matkul yang diambil: ${mhs2.matkulDiambil}");
}

-- Soal 1 : Buat Table & Database
-- buatlah sebuah database dengan nama books_store ;
CREATE DATABASE books_store;

-- buatlah skrip untuk membuat table books & category sesuai dengan struktur diatas

CREATE TABLE books ( id_buku INT PRIMARY KEY AUTO_INCREMENT, judul_buku VARCHAR(255), pengarang VARCHAR(255), tahun_terbit INT(100), penerbit VARCHAR(255), tanggal_dibuat DATE, tanggal_diupdate DATE );
--=====================================================================--
CREATE TABLE category ( id_category INT PRIMARY KEY AUTO_INCREMENT, nama_category VARCHAR(255), tanggal_dibuat DATE, tanggal_diupdate DATE );

--Soal 2 : Tambahkan Data Baru
-- setelah berhasil membuat tabel books , kemudian masukan 10 data baru meliputi struktur seperti dibawah ini :
INSERT INTO `books` (`id`, `judul_buku`, `pengarang`, `tahun_terbit`, `penerbit`, `tanggal_dibuat`, `tanggal_diupdate`) VALUES (NULL, 'Building Microservices', 'Sam Newman', '2014', "O'Reilly Media", '2023-09-18', '2023-09-18'), (NULL, 'Clean Code', 'Robert C. Martin', '2008', 'Prentice Hall', '2023-09-18', '2023-09-18'), (NULL, 'The Pragmatic Programmer', 'Andrew Hunt\r\n', '1999', 'Addison-Wesley', '2023-09-18', '2023-09-18'), (NULL, 'Design Patterns', 'Erich Gamma\r\n', '1994', 'Addison-Wesley', '2023-09-18', '2023-09-18'), (NULL, 'Introduction to Algorithms', 'Thomas H.Cormen', '1990', 'MIT Press', '2023-09-18', '2023-09-18'), (NULL, 'The Art of Computer Prog', 'Donald E.Knuth', '1968', 'Addison-Wesley', '2023-09-18', '2023-09-18'), (NULL, 'Clean Architecture', 'Robert C. Martin', '2017', 'Prentice Hall\r\n', '2023-09-18', '2023-09-18'), (NULL, 'Refactoring', 'Martin Fowler', '1999', 'Addison-Wesley', '2023-09-18', '2023-09-18'), (NULL, 'Domain-Driven Design', 'Eric Evans', '2003', 'Addison-Wesley\r\n', '2023-09-18', '2023-09-18'), (NULL, 'The Mythical Man-Month\r\n', 'Frederick Brooks', '1975', 'Addison-Wesley', '2023-09-18', '2023-09-18');

--tambahkan juga 10 data untuk tabel category
INSERT INTO `category` (`id_category`, `nama_category`, `tanggal_dibuat`, `tanggal_diupdate`) VALUES (NULL, 'Pemrograman', '2023-09-18', '2023-09-18'), (NULL, 'Fiksi', '2023-09-18', '2023-09-18'), (NULL, 'Nonfiksi', '2023-09-18', '2023-09-18'), (NULL, 'Bisnis', '2023-09-18', '2023-09-18'), (NULL, 'Teknologi', '2023-09-18', '2023-09-18'), (NULL, 'Seni', '2023-09-18', '2023-09-18'), (NULL, 'Sejarah', '2023-09-18', '2023-09-18'), (NULL, 'Sains', '2023-09-18', '2023-09-18'), (NULL, 'Hukum', '2023-09-18', '2023-09-18'), (NULL, 'Kesehatan', '2023-09-18', '2023-09-18');

--Soal 3 : Tampilkan Semua Data 
-- buatlah skrip untuk menampilkan semua data pada table books & category
SELECT * FROM `books`
--======================================--
SELECT * FROM `category`

-- Soal 4 : Update Data Tertentu
UPDATE `books` SET `judul_buku`='Building Microservices:Designing FineGrained Systems 1st',`pengarang`='Sam Newman',`tahun_terbit`=2015,`penerbit`="O'Reilly Media",`tanggal_dibuat`='2023-09-18',`tanggal_diupdate`='2023-09-20' WHERE id_buku = 1;
---===========
UPDATE `category` SET `nama_category`='Sastra',`tanggal_dibuat`='2023-09-18',`tanggal_diupdate`='2023-09-20' WHERE id_category = 1;

-- Soal 5 : Hapus Data Tertentu
-- buatlah skrip untuk menghapus data dengan id 10 pada tabel books & category
DELETE FROM `books` WHERE id_buku = 10;
--=============================================--
DELETE FROM `category` WHERE id_category = 10;

-- Soal 6 : Tampilkan Data Buku Tertentu
-- buatlah skrip untuk menampilkan data judul buku dengan penerbit Addison-Wesley
SELECT * FROM `books` WHERE penerbit = "Addison-Wesley";

-- buatlah skrip untuk menampilkan data buku dengan rentan tahun terbit 2003 sampai 2023
SELECT * FROM books WHERE tahun_terbit >= 2003 AND tahun_terbit <= 2023;

-- buatlah skrip untuk menampilkan data buku tertentu dengan judul mengandung kata design
SELECT * FROM books WHERE judul_buku LIKE '%design%';

-- Soal 7 : Buatlah Tabel Book Category
-- buatlah skrip untuk membuat tabel book_categories dengan struktur sebagai berikut :
CREATE TABLE book_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_category INT,
    id_buku INT,
    tanggal_dibuat DATE,
    tanggal_diupdate DATE,
    FOREIGN KEY (id_category) REFERENCES category(id_category),
    FOREIGN KEY (id_buku) REFERENCES books(id_buku)
);
--========================================---
INSERT INTO `book_categories` (`id`, `id_category`, `id_buku`, `tanggal_dibuat`, `tanggal_diupdate`) VALUES (NULL, '1', '1', '2023-09-18', '2023-09-18');

--================================================================-

-- Soal 8 : Tambahkan Data Baru Pada Tabel Book Category
-- buatlah skrip untuk menambahkan 3 data kedalam tabel book_categories sebagai berikut :
INSERT INTO `book_categories` (`id`, `id_category`, `id_buku`, `tanggal_dibuat`, `tanggal_diupdate`) VALUES (NULL, '5', '3', '2023-09-18', '2023-09-18'), (NULL, '1', '1', '2023-09-18', '2023-09-18');


-- Soal 9 : Tampilkan Data Relasi Antar Tabel
-- buatlah skrip untuk menampilkan data pada books dengan data pada category
-- hasil yang benar (ekspektasi hasil)
-- kurang lebih seperti ini, untuk value datanya menyesuaikan isi, yg penting struktur yang keluar
-- sesuai dibawah ini :

SELECT id, books.judul_buku, category.nama_category 
FROM book_categories
INNER JOIN books ON book_categories.id_buku = books.id_buku 
INNER JOIN category ON book_categories.id_category = category.id_category;

-- Soal 10 : Ubah Struktur Tabel
-- buatlah skrip untuk menambahkan kolom jumlah halaman dengan tipe data number

ALTER TABLE books ADD jumlah_halaman INT AFTER penerbit;
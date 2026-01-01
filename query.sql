-- 1. Membuat Tabel Mahasiswa
CREATE TABLE mahasiswa (
    NPM TEXT PRIMARY KEY,
    Nama_Mahasiswa TEXT NOT NULL,
    Kelas TEXT NOT NULL
);

-- 2. Menambahkan 5 Record Mahasiswa
INSERT INTO mahasiswa (NPM, Nama_Mahasiswa, Kelas) VALUES 
('20234350013', 'Gilang Hadi', 'R5A'),
('20234350001', 'Putra Pratama', 'R5B'),
('20234350002', 'Maulana Malik', 'R5A'),
('20234350003', 'Siti Aminah', 'R5C'),
('20234350004', 'Budi Pamungkas', 'R5B');

-- 3. Menampilkan Nama dan Kelas (Filter huruf 'p' atau 'm')
SELECT Nama_Mahasiswa, Kelas 
FROM mahasiswa 
WHERE Nama_Mahasiswa LIKE '%p%' OR Nama_Mahasiswa LIKE '%m%';

-- 4. Menambah Tabel Mata Kuliah
CREATE TABLE mata_kuliah (
    Kode_Mata_Kuliah TEXT PRIMARY KEY,
    Nama_Mata_Kuliah TEXT NOT NULL
);

-- 5. Menambahkan 5 Record Mata Kuliah
INSERT INTO mata_kuliah (Kode_Mata_Kuliah, Nama_Mata_Kuliah) VALUES 
('MK01', 'Pemrograman Java'),
('MK02', 'Jaringan Komputer'),
('MK03', 'Basis Data'),
('MK04', 'Sistem Operasi'),
('MK05', 'Arsitektur Komputer');

-- 6. Menambahkan Kolom SKS dan Mengisi Nilainya
-- Menambah Kolom
ALTER TABLE mata_kuliah ADD COLUMN SKS INTEGER;

-- Update SKS masing-masing
UPDATE mata_kuliah SET SKS = 3 WHERE Kode_Mata_Kuliah = 'MK01';
UPDATE mata_kuliah SET SKS = 4 WHERE Kode_Mata_Kuliah = 'MK02';
UPDATE mata_kuliah SET SKS = 3 WHERE Kode_Mata_Kuliah = 'MK03';
UPDATE mata_kuliah SET SKS = 2 WHERE Kode_Mata_Kuliah = 'MK04';
UPDATE mata_kuliah SET SKS = 4 WHERE Kode_Mata_Kuliah = 'MK05';

-- 7. Menghapus Mata Kuliah yang SKS-nya > 3
DELETE FROM mata_kuliah WHERE SKS > 3;

-- 8. Membuat Tabel Penilaian
CREATE TABLE penilaian (
    NPM TEXT,
    Kode_Mata_Kuliah TEXT,
    Nilai_Tugas INTEGER,
    Nilai_UTS INTEGER,
    Nilai_UAS INTEGER,
    FOREIGN KEY (NPM) REFERENCES mahasiswa(NPM),
    FOREIGN KEY (Kode_Mata_Kuliah) REFERENCES mata_kuliah(Kode_Mata_Kuliah)
);


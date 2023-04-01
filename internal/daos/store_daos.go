package daos

import (
	// "time"

	"time"

	_ "github.com/go-sql-driver/mysql"

	"gorm.io/gorm"
)

// var date = time.Time

type (
	alamat struct {
		gorm.Model
		id            int
		id_user       int
		judul_alamat  string
		nama_penerima string
		no_telp       string
		detail_alamat string
		updated_at    time.Time
		created_at    time.Time
	}

	// FilterBooks struct {
	// 	Limit, Offset int
	// 	Title         string
	// }

	category struct {
		gorm.Model
		id            int
		nama_category string
		updated_at    time.Time
		created_at    time.Time
	}

	detail_trx struct {
		gorm.Model
		id            int
		id_trx        int
		id_log_produk int
		id_toko       int
		kuantitas     int
		harga_total   int
		updated_at    time.Time
		created_at    time.Time
	}

	foto_produk struct {
		gorm.Model
		id         int
		id_produk  int
		url        string
		updated_at time.Time
		created_at time.Time
	}

	log_produk struct {
		gorm.Model
		id             int
		id_produk      int
		nama_produk    string
		slug           string
		harga_reseller string
		harga_konsumen string
		deskripsi      string
		updated_at     time.Time
		created_at     time.Time
		id_toko        int
		id_category    int
	}

	produk struct {
		gorm.Model
		id             int
		nama_produk    string
		slug           string
		harga_reseller string
		harga_konsumen string
		stock          int
		deskripsi      string
		updated_at     time.Time
		created_at     time.Time
		id_toko        int
		id_category    int
	}

	toko struct {
		gorm.Model
		id         int
		id_user    string
		nama_toko  string
		url_foto   string
		updated_at time.Time
		created_at time.Time
	}

	trx struct {
		gorm.Model
		id                int
		id_user           int
		alamat_pengiriman int
		harga_total       int
		kode_invoice      string
		method_bayar      string
		updated_at        time.Time
		created_at        time.Time
	}

	user struct {
		gorm.Model
		id            int
		nama          string
		kata_sandi    string
		notelp        string
		tanggal_lahir time.Time
		jenis_kelamin string
		tentang       string
		pekerjaan     string
		email         string
		id_provinsi   string
		id_kota       string
		isAdmin       bool
		updated_at    time.Time
		created_at    time.Time
	}
)

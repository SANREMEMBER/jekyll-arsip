Jekyyl Arsip - Cara Mudah Sematkan Berkas dari Internet Archive di Jekyll
==============

Sebuah *plugin* untuk  Jekyll agar memudahkan penyematan berkas dari [Internet Archive](https://arvhive.org), seperti video, audio, daftar audio, atau bahkan gambar kedalam blog Jekyll milik Anda.

> [jekyll-arsip](https://gitlab.com/SANREMEMBER/jekyll-arsip/) dibuat berdasarkan [jekyll-archive-org](https://github.com/tarteka/jekyll-archive-org) yang dibuat oleh [Tarteka](https://github.com/tarteka)
> [jekyll-archive-org](https://github.com/tarteka/jekyll-archive-org) dibuat berdasarkan [jekyll-youtube](https://github.com/pibby/jekyll-youtube) oleh [Katie Harron](https://github.com/pibby)


## Contoh Penggunaan
[Rilis Jekyll Arsip](https://sanremember.com/2016/11/02/jekyll-arsip-cara-mudah-sematkan-berkas-dari-archive-org-di-jekyll/)

## Petunjuk Instalasi
Unduh berkas `arsip.rb` dan letakkan didalam direktori `_plugins` yang ada pada direktori blog Jekyll milik Anda, jika tidak ada, Anda bisa menambahkannya sendiri.

## Petunjuk Penggunaan
Di dalam berkas Markdown pada postingan Anda, tambahkan baris perintah berikut, sesuai kebutuhan:

+ `{% arsip_video ID_VIDEO %}`
+ `{% arsip_audio ID_AUDIO %}`
+ `{% arsip_daftar ID_DAFTAR_AUDIO %}`
+ `{% arsip_gambar ID_GAMBAR/NAMA_BERKAS_GAMBAR|KETERANGAN BEBAS %}`

Contoh video, `{% arsip_video TimeLapseUsandoMEncoder %}` akan di *render* sebagai berikut:
```html
<div class="video">
  <figure>
    <iframe width="800" height="480" src="//archive.org/embed/TimeLapseUsandoMEncoder" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
  </figure>
</div>
```

Contoh audio, `{% arsip_audio WanitaDiSurgaDapatApaAlUstadzMuhammadUmarAsSewed %}` akan di *render* sebagai berikut:

```html
<div class="audio">
  <iframe width="800" height="30" src="//archive.org/embed/killallradiojingle" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
</div>
```

Contoh daftar audio, `{% arsip_daftar KajianPetanahan20160424 %}` akan di *render* sebagai berikut:

```html
<div class="video">
  <figure>
    <iframe width="800" height="300" src="//archive.org/embed/rsnlrckmtrkrsnlrckmtrk" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
  </figure>
</div>
```

---

Jika Anda tertarik untuk menambahkan CSS, Anda dapat menambahkan gaya berikut, agar ukuran video menjadi responsif untuk perangkat seluler.

```css
/* responsive videos */
.video figure {
	position: relative;
	nowhitespace: afterproperty;
	padding-bottom: 56.25%;
	height: 0;
	overflow: hidden;
}

.video iframe, .video object, .video embed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.audio iframe, .audio object, .audio embed {
  width: 100%;
}
```

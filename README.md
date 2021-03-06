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
<iframe width="676" height="380" src="//archive.org/embed/TimeLapseUsandoMEncoder" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
```

Contoh audio, `{% arsip_audio WanitaDiSurgaDapatApaAlUstadzMuhammadUmarAsSewed %}` akan di *render* sebagai berikut:

```html
<iframe width="676" height="30" src="//archive.org/embed/WanitaDiSurgaDapatApaAlUstadzMuhammadUmarAsSewed" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
```

Contoh daftar audio, `{% arsip_daftar KajianPetanahan20160424 %}` akan di *render* sebagai berikut:

```html
<iframe width="676" height="300" src="//archive.org/embed/KajianPetanahan20160424" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
```

Contoh gambar, `{% arsip_gambar gambar-sanremember-1438-001/gambar-sanremember-1438-001.png|Beribadah Hanya Kepada Allah %}` akan di *render* sebagai berikut:

```html
<p><img src="//archive.org/download/arsip_gambar gambar-sanremember-1438-001/gambar-sanremember-1438-001.png" alt="Beribadah Hanya Kepada Allah" title="Beribadah Hanya Kepada Allah" / ></p>
```

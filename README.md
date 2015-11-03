Easy Archive.org Embed for Jekyll
==============

A plugin for Jekyll to easily embed [Archive.org](https://arvhive.org) videos, audios and audio lists into your site.

> Based on [Easy Youtube Embed for Jekyll](https://github.com/pibby/jekyll-youtube) by [Katie Harron](https://pibby.com/)

## Demo
[Jekyll Archive.org Plugin](https://tarteka.net/2015/11/insertar-audios-y-vdeos-de-archiveorg-en-jekyll/)

## Installation Instructions
Download the file `archive.rb` and place it in your `_plugins` folder of your Jekyll installation.

## Usage Instructions
In your Markdown post, simply include the following command:

+ `{% archive_video VIDEO_ID %}`
+ `{% archive_audio AUDIO_ID %}`
+ `{% archive_list AUDIO_LIST_ID %}`

Video example, `{% archive_video TimeLapseUsandoMEncoder %}` will render as:  
```html
<div class="video">
  <figure>
    <iframe width="800" height="480" src="//archive.org/embed/TimeLapseUsandoMEncoder" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
  </figure>
</div>
```

Audio example, `{% archive_audio killallradiojingle %}` will render as:

```html
<div class="audio">
  <iframe width="800" height="30" src="//archive.org/embed/killallradiojingle" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
</div>
```

Audio List example, `{% archive_list rsnlrckmtrkrsnlrckmtrk %}` will render as:

```html
<div class="video">
  <figure>
    <iframe width="800" height="300" src="//archive.org/embed/rsnlrckmtrkrsnlrckmtrk" frameborder="0" allowfullscreen="" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
  </figure>
</div>
```

---

If you're interested in the CSS, you can add it to your stylesheet and your videos will resize responsively for users on mobile devices.

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

# Creekside CBT

Website for Creekside Cognitive Behavioral Therapy, LLC (Jessica F. Magidson, PhD), Boulder, Colorado.

Plain HTML, CSS, and JS. There's no framework and no build step. It's deployed with GitHub Pages at
https://jessicamagidson.com.

## Structure

```
index.html            About (home): overall bio, research and practice
cbt-practice/         CBT practice: credentials, logistics
research/             Coming soon
media/                Articles and recommended episodes
retreats/             Coming soon
404.html              GitHub Pages "not found" page
css/styles.css        All styles; colors and fonts are tokens at the top
js/nav.js             Mobile menu toggle
images/               Photos (Pexels placeholders, plus Jess's portrait)
favicon.svg           Logo mark (plus favicon-32.png and apple-touch-icon.png)
tools/                Share-card source and the script that renders it (not linked from the site)
robots.txt, sitemap.xml
CNAME                 Custom domain for GitHub Pages
```

Each page repeats the same header and footer. If you change the navigation, the footer, or the
appointment email, update every `index.html` and `404.html`.

Links and assets use relative paths (`css/styles.css` on the home page, `../css/styles.css` one folder
down), so the site works both at https://galavant-web-design.github.io/creekside-cbt/ and on the custom
domain. Keep it that way: a leading `/` breaks the github.io URL. The exception is `404.html`, which
GitHub serves at any depth. It sets a `<base>` from the hostname instead.

## Run locally

```bash
python3 -m http.server 8421
```

Then open http://localhost:8421.

## Swapping in Jess's photos

Replace the files in `images/` and keep the same names, or update the references. Each photo has a
large version (used for page banners, about 1600–2400px wide) and an `-800` version (used for cards).
Update the photo credits in the footer once the Pexels images are gone, and re-render the share card
(see "Search and link previews" below) if the Flatirons photo changes.

## Deploying

1. Push to GitHub, then go to Settings → Pages and set **Deploy from a branch** to `main` / root.
2. The custom domain is `jessicamagidson.com`, set under Settings → Pages (that's what the `CNAME`
   file records), with **Enforce HTTPS** on.

## Search and link previews

Each page's `<head>` has a title, description, canonical URL, Open Graph and Twitter tags. All pages
share one 1200×630 preview image, `images/share-card.jpg`. The home page also has JSON-LD structured
data describing Jess and the practice.

- If you add a page, copy the head tags from a sibling page, update the title, description and URLs,
  and add it to `sitemap.xml`.
- To change the share card (new photo or text), edit `tools/share-card.html`, then run
  `tools/render-share-card.sh` (macOS with Google Chrome). It also regenerates the PNG icons from
  `favicon.svg`.
- Preview checkers cache, so after changing the card use LinkedIn Post Inspector or the Facebook
  Sharing Debugger to refresh it.

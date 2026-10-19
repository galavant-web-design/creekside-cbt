# Creekside CBT

Website for Creekside Cognitive Behavioral Therapy, LLC (Jessica F. Magidson, PhD), Boulder, Colorado.

Plain HTML, CSS, and JS. There's no framework and no build step. It's deployed with GitHub Pages at
https://creeksidecognitivebehavioraltherapy.org.

## Structure

```
index.html            Home
cbt-practice/         About, credentials, logistics
research/             Resources (articles)
podcasts/             Coming soon
retreats/             Coming soon
404.html              GitHub Pages "not found" page
css/styles.css        All styles; colors and fonts are tokens at the top
js/nav.js             Mobile menu toggle
images/               Photos (Pexels placeholders, plus Jess's portrait)
favicon.svg           Logo mark
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
Update the photo credits in the footer once the Pexels images are gone.

## Deploying

1. Push to GitHub, then go to Settings → Pages and set **Deploy from a branch** to `main` / root.
2. When it's time to switch domains, add `creeksidecognitivebehavioraltherapy.org` as the custom
   domain under Settings → Pages (this creates a `CNAME` file). Point the domain's DNS at GitHub Pages
   (see GitHub's "Managing a custom domain" docs), then turn on **Enforce HTTPS**.

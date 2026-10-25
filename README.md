# Yugen Chen — academic website

Jekyll / Academic Pages website for Yugen Chen, Ph.D. Candidate in Economics at the University of Southern California, affiliated with the USC Schaeffer Center.

Public site: https://yugenchen.github.io/
Repository: YugenChen/YugenChen.github.io; default branch: master.

## Edit content

- `_pages/about.md`: introduction and homepage sections.
- `_data/research.yml`: Job Market Paper, working papers, work in progress, and publications. Titles/coauthors are sourced from the supplied CV; descriptions use the owner-supplied project scope. Blank paper links are intentional.
- `_data/cv.json`: verified education and teaching for the HTML CV summaries.
- `files/yugen-chen-cv.pdf`: the supplied CV (USC_YChen(5).pdf), used by every CV navigation/download link. Update the version query on those links when replacing the PDF so browsers load the new file. `files/cv.pdf` remains an identical compatibility copy. Do not create `CV.pdf`.
- `_data/navigation.yml`: header links.
- `_config.yml`: identity, email, GitHub profile, and root-site settings.
- `_pages/talks.html`: presentation list.

`images/profile.png` is the photo uploaded directly to the repository by Yugen Chen. The sidebar safely omits an unset photo if it is removed later. An unused pre-existing portrait with a UUID filename has not been assigned an identity.

## Build and verify

Use Ruby 3.2 (the version used by the existing deployment workflow):

```sh
bundle install
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter
bundle exec ruby scripts/check_site.rb _site
```

To check project-site paths without changing the root-site configuration:

```sh
bundle exec jekyll build --baseurl /Yugen-Website --destination /tmp/yugen-project-site
bundle exec ruby scripts/check_site.rb /tmp/yugen-project-site /Yugen-Website
```

The checker verifies generated internal links, fragments, assets, unresolved Liquid, and absence of known former-owner/demo content. It checks local targets rather than external services.

## Deployment

The existing `.github/workflows/deploy.yml` builds with Jekyll and deploys the `_site` artifact on pushes to `master`, or a manual workflow run. Keep GitHub Pages configured to use GitHub Actions. The workflow also verifies internal links before upload.

For the current personal root site, keep:

```yaml
url: "https://yugenchen.github.io"
baseurl: ""
repository: "YugenChen/YugenChen.github.io"
```

If intentionally hosting a separate `Yugen-Website` project site, use the same `url`, `baseurl: "/Yugen-Website"`, and `repository: "YugenChen/Yugen-Website"`. Use Liquid's `relative_url` filter for new internal links.

## Template functionality

The original design, typography, Sass, layouts, collection definitions, and utilities remain. Demonstration content is preserved under `_template_examples/`, excluded from the public build. Generator notebooks/TSV files still contain template examples and are also excluded; replace their sample data before running them. Do not copy the former owner's papers or CV back into `files/`.

See `docs/website-audit.md` for the content inventory and outstanding items. Academic Pages / Minimal Mistakes attribution and the MIT license are retained.

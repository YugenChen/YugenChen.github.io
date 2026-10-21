# Website update audit

Audited all 313 original tracked files, including text/configuration, PDF contents, and profile-image candidates. The full file-by-file inventory is in content-inventory.tsv.

## Changes

- `_config.yml`: accurate identity, position, affiliation, research description, GitHub username, uploaded profile image, and exclusions for template/development sources. Existing root-site URL/baseurl/repository retained.
- `_pages/about.md`, `_data/research.yml`, `_includes/research.html`: introduction, Job Market Paper, other working papers, work in progress, and publications grounded in the supplied CV and project descriptions. Public article URLs were extracted from the CV's hyperlinks.
- `_data/navigation.yml`: working Research, Job Market Paper, Teaching, and CV links.
- `files/cv.pdf`: latest supplied CV, byte-for-byte; lowercase canonical filename. Former owner's uppercase CV and main paper removed.
- `images/profile.png`: photo uploaded directly to the repository by Yugen Chen and used as supplied. Six former-owner profile JPEGs removed; an unused UUID-named portrait is unverified and has not been configured as Yugen Chen.
- `_data/authors.yml`, `_data/cv.json`, `_pages/cv.md`, `_pages/cv-json.md`: replace example identities and qualifications with verified data; correct CV summary links and redirects.
- `_pages/teaching.html`, `_includes/teaching-list.html`: verified teaching experience from the supplied CV.
- `_pages/publications.html`, `_pages/portfolio.html`, `_pages/talks.html`, `_pages/talkmap.html`: accurate research/presentation content; remove demonstration claims and sample map from the public site.
- `_includes/author-profile.html`, `_includes/head/custom.html`, `_includes/footer/custom.html`, `_includes/cv-template.html`, `images/manifest.json`: missing-photo guard and baseurl-safe website, favicon, sitemap, CV and manifest links.
- `.github/workflows/deploy.yml`: preserve the existing build/artifact/deploy jobs, Ruby version, branch and permissions; add strict front matter and generated-site verification before upload.
- `scripts/check_site.rb`: verify YAML/JSON, generated links/fragments/assets, source exclusions, CV presence and absence of known former-owner/demo content.
- `README.md`, `docs/`: maintenance/deployment instructions and audit inventory.
- `_template_examples/`: retain demonstration collections, posts, comments, pages, PDFs, map assets and original README as excluded reference material. Layouts, typography, Sass, collection definitions and development tools are preserved.

## Removed former-owner content

Homepage pension/insurance, marriage, housing, Dibao, land-expropriation and migration research; all associated coauthors and abstracts; the previous teaching list and job-market year; both old CV PDFs, the linked main paper and six profile portraits. Sample publications, qualifications, courses, talks, posts, comments and map locations no longer publish under Yugen Chen's identity. Original Git history remains intact.

## Remaining information

Public JMP and working-paper PDF URLs are intentionally blank and visibly marked. No paper results, titles, coauthors or publication status were invented. The homepage uses the owner's requested fields; the uploaded PDF remains unchanged.

## Verification

Ruby 3.2.3 / Jekyll 4.4.1 production build succeeded with strict front matter. Root-site and simulated `/Yugen-Website` builds passed YAML/JSON, internal-link, fragment and asset checks (19 HTML pages, 378 internal targets before article-link additions). Existing vendor Sass emits deprecation warnings but the build succeeds. No typography/layout redesign was made. Deployment status is reported separately after the GitHub Actions run.

## Repository / public address

The repository was already renamed to `YugenChen/YugenChen.github.io`; `Yugen-Website` redirects to it. Root-site configuration: `url: https://yugenchen.github.io`, `baseurl: ""`. Public address: https://yugenchen.github.io/.

## Research hierarchy and CV follow-up

Research and Teaching remain H2 sections. Job Market Paper, Working Papers / Work in Progress, and Publications are peer H3 sections; each paper title is H4. Abstracts from the uploaded CV are presented under expandable Abstract controls, including the JMP, rebate working paper, mortality/unemployment working paper and global-health report. All three CV work-in-progress items are listed without invented abstracts. The global-health spending report appears under Publications as forthcoming November 2026 with the named initiative. Header navigation contains Research, Teaching and CV. Every CV entry now points to files/yugen-chen-cv.pdf, containing the exact latest uploaded CV; the old lowercase path remains a compatibility copy.

## Research typography follow-up

Removed the duplicate homepage CV/email row while keeping the header CV and sidebar Email links. Paper coauthors, publication authors and venue information now share the title font size. Working-paper/work-in-progress status labels no longer render. Article links appear inline as [Article] immediately after publication titles and inherit the title font size. The global-health spending report's abstract remains in source data but is hidden on the site.

## Abstract size, CV-style publications and research assistance

Abstract controls and text now match paper-title sizing, with a smaller gap after coauthors. Publications render as complete CV-style citations: authors, title, venue/year/status, then [Article]. The global-health report uses Chen Y. and the specified forthcoming citation; its missing article URL remains an unlinked placeholder. Research Assistance follows Teaching and lists only Timothy Armstrong (2022–2023), Karen Van Nuys (2023–2025), and Alice Chen (2025–Present), matching the CV's Research Assistant entries.

## Author emphasis and expanded research assistance

Every publication citation now bolds Chen Y in its author list. Research Assistance now uses the owner's latest experience screenshot, superseding the earlier CV-only summary: PBM rebate rule (09/2024–Present), PBM industry concentration (08/2023–Present), and the rdhonest Stata routine (06/2022–05/2023). Each project includes its institution, supervisors with Professor before each name, dates, and concise descriptions grounded in the screenshot. The owner's latest sidebar biography is preserved.

## Concise research assistance layout

The latest layout screenshot supersedes the expanded experience entries above. Research Assistance now lists Timothy Armstrong (Su2022 - Win2022), Karen Van Nuys (Fall2023 - Sp2025), and Alice Chen (Sp2025 – present), in that order. Each entry has a regular-weight Professor name at left, dates at right, and one short italic topic on the next line. Long descriptions and institution lines have been removed. Scoped styles match the screenshot's relative font sizes and spacing; dates wrap onto their own line on narrow mobile screens.

## Combined TA/RA section

Teaching and Research Assistance are now peer H3 subsections within the H2 TA/RA section. Their existing content templates and styling are unchanged. The masthead links to TA/RA; the existing teaching and research-assistance anchors continue to work.

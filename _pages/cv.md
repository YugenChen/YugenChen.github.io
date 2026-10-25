---
layout: single
title: "Curriculum Vitae"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume/
---

[Download my CV (PDF)]({{ '/files/yugen-chen-cv.pdf?v=20261025' | relative_url }})

## Education

{% for degree in site.data.cv.education %}
- **{{ degree.area }}**, {{ degree.institution }}, {{ degree.endDate }}.
{% endfor %}

## Research

Health Economics, Industrial Organization, and Pharmaceutical Markets. Research affiliation: USC Schaeffer Center.

[Research and Job Market Paper]({{ '/' | relative_url }}#research)

## Teaching

{% include teaching-list.html %}

For the complete CV, including research experience, publications, and service, please see the PDF above.

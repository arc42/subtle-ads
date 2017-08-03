# subtle-ads
Contains the common code for subtle advertisements that's included in several of the arc42 websites

## What? Advertisements?
Yes - that's right. Gernot and Peter, founders of arc42, make part of their living by training and coaching,
therefore we include (very subtle, silent, low-voiced, unobtrusive) ads in the arc42 websites.

These ads simply announce the dates of our upcoming public trainings, sometimes presentations or similar.

## How does it work?

**Short answer**: Via [git submodules](https://git-scm.com/docs/git-submodule).

**Longer answer**:

Git submodule as subdirectory of (jekyll standard) `_includes` directory.

1. I created THIS repository (subtle-ads) to contain the text of the ads
2. I include this repo (subtle-ads) as submodule in the site
I need the subtle-ads content in `_includes`:
``` bash
cd _includes
git submodule add https://github.com/arc42/subtle-ads/
```

4. Then add the submodule to git by
```bash
cd ..
git add .gitmodules _includes/subtle-ads.html
```

5. When updating the ad, I have to pull
the modified submodule (aka this repo) from
every of the sites I use it in. Goto the directory containing the site:
```bash
git submodule update --remote
```

5. This concerns (at least) the following arc42 sites:
  * [docs.arc2.org](http://docs.arc42.org) with repository [github.com/arc42/docs.arc42.org-site](https://github.com/arc42/docs.arc42.org-site)
  * [faq.arc42.org](http://faq.arc42.org) with repository
  [https://github.com/arc42/faq.arc42.org-site](https://github.com/arc42/faq.arc42.org-site)
  * [patterns.arc42.org](http://patterns.arc42.org) with repository [https://github.com/arc42/patterns.arc42.org-site](https://github.com/arc42/patterns.arc42.org-site)
  * [arc42.org](https://github.com/arc42/arc42.org-site)



## Sources
As the official git documentation is quite hard to understand, I used several additional sources:

* [Pavel Šimerda on Stackoverflow](https://stackoverflow.com/questions/15844542/git-symlink-reference-to-a-file-in-an-external-repository/27770463#27770463)
* [Payne Digitals Intro to Git Submodules](http://paynedigital.com/articles/2011/10/introduction-to-git-submodules)

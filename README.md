# subtle-ads
Contains the common code for subtle advertisements that's included in several of the arc42 websites

## What? Advertisements?
Yes - that's right. Gernot and Peter, founders of arc42, make part of their living by training and coaching,
therefore we include (very subtle, silent, low-voiced, unobtrusive) ads in the arc42 websites.

These ads simply announce the dates of our upcoming public trainings, sometimes presentations or similar.

## How does it work?

**Short answer**: Via [git submodules](https://git-scm.com/docs/git-submodule).

**Longer answer**:

Git submodule with symlink to the file(s) needed.

1. I created THIS repository to contain the text of the ads, located in the directory '/ads'
2. I include this repo (subtle-ads) as submodule in the site
I need the subtle-ads content in:
``` bash
git submodule add https://github.com/arc42/subtle-ads/
```

3. In the sites' '\includes' folder I add a symlink pointing to this submodule,
more specifically to `subtle-ads/ads/subtle-ads.html` with the following commands:
``` bash
cd _includes
ln -s ../subtle-ads/ads/subtle-ads.html
```

4. When updating the ad, I have to pull
the modified submodule (aka this repo) from
every of the sites I use it in...

5. This concerns (at least) the following arc42 sites:
  * [docs.arc2.org](http://docs.arc42.org) with repository [github.com/arc42/docs.arc42.org-site](https://github.com/arc42/docs.arc42.org-site)
  * faq.arc42.org
  * arc42.org
  * patterns.arc42.org



## Sources
As the official git documentation is quite hard to understand, I used several additional sources:

* [Pavel Šimerda on Stackoverflow](https://stackoverflow.com/questions/15844542/git-symlink-reference-to-a-file-in-an-external-repository/27770463#27770463)
* [Payne Digitals Intro to Git Submodules](http://paynedigital.com/articles/2011/10/introduction-to-git-submodules)

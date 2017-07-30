# subtle-ads
Contains the common code for subtle advertisements that's included in several of the arc42 websites

## What? Advertisements?
Yes - that's right. Gernot and Peter, founders of arc42, make part of their living by training and coaching,
therefore we include (very subtle, silent, low-voiced, unobtrusive) ads in the arc42 websites.

These ads simply announce the dates of our upcoming public trainings, sometimes presentations or similar.

## How does it work?

**Short answer**: Via [git submodules](https://git-scm.com/docs/git-submodule). 

**Longer answer**: 

* Git submodule with symlink to the file(s) needed
* I created THIS repository to contain the text of the ads, located in the directory '/ads'
* I included this repository in all the sites requiring the ads:
  * [docs.arc2.org](http://docs.arc42.org) with repository [github.com/arc42/docs.arc42.org-site](https://github.com/arc42/docs.arc42.org-site)
  * faq.arc42.org
  * arc42.org
  * patterns.arc42.org


## Sources
As the official git documentation is quite hard to understand, I used several additional sources:

* [Pavel Šimerda on Stackoverflow](https://stackoverflow.com/questions/15844542/git-symlink-reference-to-a-file-in-an-external-repository/27770463#27770463)
* [Payne Digitals Intro to Git Submodules](http://paynedigital.com/articles/2011/10/introduction-to-git-submodules)



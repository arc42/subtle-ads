# subtle-ads
Contains the common code for subtle advertisements that's included in several of the arc42 websites,
plus Dockerfile so the update can be performed by a Docker container.

## What? Advertisements in Open-Source projects?
Yes - that's right. Gernot and Peter, founders of arc42, make part of their living by training and coaching,
therefore we include (very subtle, silent, low-voiced, unobtrusive) ads in the arc42 websites.

These ads simply announce the dates of our upcoming public trainings, sometimes presentations or similar.

## How to ...

* build the container, if not already done (see below)
* run the script `update-subtle-ads.sh`


## How does it work?

**Short answer**: Via [git submodules](https://git-scm.com/docs/git-submodule)
and a custom Docker container.

#### Longer answer - part 1: Git Submodule:

###### Create Git submodule as subdirectory of (jekyll standard) `_includes` directory.

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
every of the sites I use it in. That's actually done by the Docker container...
In case you need to do it manually: Goto the directory containing the site:
```bash
git submodule update --remote
git add .
git commit -m "updated submodule"
git push
```
#### Longer answer - part 2: Docker container

I defined a container based upon Alpine linux
(see `Dockerfile` in this repo):

```Docker
FROM alpine:3.6

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
```

In short:
* [Alpine 3.6](https://alpinelinux.org/) based container
* Installs git
* Installs ncurses (to enable colored output)

1. Building the container:
```
docker build --tag subtle-ads .
```

2. Running the container:
```
docker run --interactive --tty --rm subtle-ads
```
  The container needs to run in interactive mode,
as it prompts for a github username and
credentials. In case of 2-factor-auth,
you need to provide your
[personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/),
otherwise your password will suffice.


3. What the container does...
is pretty simple: read the script
`update-ads-on-sites.sh`,
you'll understand.

### Concerned arc42 Repositories

Updating ads concerns (at least) the following arc42 sites:
  * [docs.arc2.org](https://docs.arc42.org) with repository https://github.com/arc42/docs.arc42.org-site
  * [faq.arc42.org](https://faq.arc42.org) with repository
  https://github.com/arc42/faq.arc42.org-site
  * [patterns.arc42.org](https://patterns.arc42.org) with repository https://github.com/arc42/patterns.arc42.org-site
  * [arc42.org](https://github.com/arc42/arc42.org-site) with repository
  https://github.com/arc42/arc42.org-site)
  * [softwareknigge.de](https://softwareknigge.de) with repository https://github.com/gernotstarke/softwareknigge.de-site



## Sources
As the official git documentation is quite hard to understand, I used several additional sources:

* [Pavel Šimerda on Stackoverflow](https://stackoverflow.com/questions/15844542/git-symlink-reference-to-a-file-in-an-external-repository/27770463#27770463)
* [Payne Digitals Intro to Git Submodules](http://paynedigital.com/articles/2011/10/introduction-to-git-submodules)

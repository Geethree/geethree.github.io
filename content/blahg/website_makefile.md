---
title: "Website Makefile"
date: 2018-11-11T12:00:00-07:00
showDate: true
draft: false
tags: ["automation", "blog","software"]
---

Computers and software are wonderful things, instead of remembering to:

1. Ensure all node packages are installed and/or up-to-date
2. Compile css bits
3. Generate the resume: markdown -> laTex -> laTex -> PDF
4. Compile the static hugo site
5. Add all of the changed files to the git repo
6. Insert a helpful commit message to remember the work that was done
7. Push the changes to master

In particular, I always seem to forget step 5 and end up with missing files since everything wasn't appropriately staged before the commit. So lets automate that entire process with a [*Makefile*](https://www.gnu.org/software/make/) so it happens repeatably each time across all of my machines.

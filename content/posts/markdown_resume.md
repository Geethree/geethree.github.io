---
title: "Markdown resume"
date: 2018-11-03T12:18:59-07:00
showDate: true
draft: false
tags: ["blog","software"]
---

I'll be honest, I hate maintaiting my resume and CV. There is something about opening *your editor of choice* fiddling with parameters, saving as a PDF, naming the file and uploading it somewhere that requires too many steps. It sure would be nice if we could use MarkDown to generate a PDF automagically whenever I press a new version of this website.

[Pandoc](https://pandoc.org/) and [ConText](https://wiki.contextgarden.net/Main_Page) to the rescue!

## Markdown -> PDF
- Pandoc is used to convert the Markdown file to a latex file
- ConText is then used to to convert the latex file to a pdf

## Markdown -> html
- Pandoc and a css style sheet can convert the resume markdown file to an html page

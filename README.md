Welcome to the Joyner Document Format official LaTeX class.
This class was written and tested using a default MacTeX installation,
so it should work out of the box
as long as you’re running an up-to-date LaTeX distribution.

## Quick start

### Using PdfLatex

You can clone this repo and try typesetting `jdf-starter.tex`
with the following commands:

```sh
biber jdf-starter.tex
pdflatex jdf-starter.tex
```

The result should look like `jdf-starter.pdf`.

* `biber` command generates used referenes from `references.bib`
* `pdflatex` command generates the final pdf

### Using R Markdown

Assuming you already have [R](https://cran.r-project.org) installed, install dependencies:

```sh
Rscript ./install.r
```

You can then knit `jdf-starter.Rmd`
with the following command:

```sh
Rscript -e 'library(rmarkdown); rmarkdown::render("jdf-starter.Rmd")'
```

For [VS Code](https://code.visualstudio.com) user, see also
[R Markdown All in One](https://marketplace.visualstudio.com/items?itemName=TianyiShi.rmarkdown)
and [Pandoc Citer Extension](https://marketplace.visualstudio.com/items?itemName=notZaki.pandocciter)

## License

Copyright 2019 by Jake Warner, 2020 TruongSinh Tran-Nguyen.

You have my permission to use JDF in whatever projects you wish,
whether commercial, personal, or otherwise, in whatever way you like.
Official license information can be found in [LICENSE](LICENSE)
(spoiler: it's the MIT License).

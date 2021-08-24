Welcome to the Joyner Document Format official LaTeX class.
This class was written and tested using a default MacTeX installation,
so it should work out of the box
as long as you’re running an up-to-date LaTeX distribution.

## Quick start

You can clone this repo and try typesetting `jdf-starter.tex`
with the following commands:

    biber jdf-starter
    pdflatex jdf-starter

The result should look like `jdf-starter.pdf`.
* `biber` command generates used referenes from `references.bib` 
* `pdflatex` command generates the final pdf 

## License

Copyright 2019 by Jake Warner.

You have my permission to use JDF in whatever projects you wish,
whether commercial, personal, or otherwise, in whatever way you like.
Official license information can be found in [LICENSE](LICENSE)
(spoiler: it's the MIT License).

## Local Setup
- **OS**: Ubuntu Linux 20.04
- **Code Editor**: VS Code with [Latex Workshop](https://github.com/James-Yu/LaTeX-Workshop) Extension.

Finally, intsall texlive:
```
sudo apt-get install texlive-full
```

Use the preview icon (top left) or use the keyboard shortcut (Ctrl + Alt + V). This will open up a live preview.

Once done, use the green play button, or use keyboard shortcut (Ctrl + Alt + B) to build the project and generate PDF.

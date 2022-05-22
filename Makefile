# Based on: https://www.systutorials.com/a-simple-makefile-for-latex/

# Filename without ".tex". Can be passed inline
# make FILESTEM="assignment_p01"
FILESTEM=jdf-starter

# Based on: https://news.ycombinator.com/item?id=11195539
help:
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

pdf: ps
	ps2pdf ${FILESTEM}.ps

pdf-print: ps
	ps2pdf -dColorConversionStrategy=/LeaveColorUnchanged -dPDFSETTINGS=/printer ${FILESTEM}.ps

text: html
	html2text -width 100 -style pretty ${FILESTEM}/${FILESTEM}.html | sed -n '/./,$$p' | head -n-2 >${FILESTEM}.txt

html:
	@#latex2html -split +0 -info "" -no_navigation ${FILESTEM}
	htlatex ${FILESTEM}

ps: dvi
	dvips -t letter ${FILESTEM}.dvi

dvi:  # Action
	pdflatex ${FILESTEM}
	biber ${FILESTEM}
	pdflatex ${FILESTEM}
	pdflatex ${FILESTEM}

read:
	evince ${FILESTEM}.pdf &

aread:
	acroread ${FILESTEM}.pdf

clean: # Remove temporary files
	rm -f ${FILESTEM}.{ps,pdf,log,aux,out,dvi,bbl,blg}

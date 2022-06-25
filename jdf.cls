\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jdf}[2022/05/22 v2.2.0 Joyner Document Format]

\newcommand{\papersize}{letterpaper} % Default value
\DeclareOption{a4paper}{\renewcommand{\papersize}{a4paper}}
\DeclareOption{letterpaper}{\renewcommand{\papersize}{letterpaper}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options
\LoadClass{article}

\RequirePackage{etoolbox} % Required for conditional logic

%%
% Page layout
\ifstrequal{\papersize}{a4paper}{ % A4 paper page geometry settings
% The text block is approximately 141.3x228.3mm, which is a ratio of 1:phi (and the ratio of the top margin to the bottom margin is also 1:phi)
	\RequirePackage[
		a4paper,
		top=26.25mm,
		bottom=42.472mm,
		left=34.361mm,
		right=34.361mm,
		footskip=16.222mm, % Space from the bottom margin to the baseline of the footer
		%showframe, % Uncomment to show how the type block is set on the page
	]{geometry}
}{ % Default (letterpaper) page geometry settings
% The text block is 5.5x8.5in, which is exactly 1/2 the page size, divided lengthwise
	\RequirePackage[
		\papersize,
		top=1in,
		bottom=1.5in,
		left=1.5in,
		right=1.5in,
		footskip=0.5in, % Space from the bottom margin to the baseline of the footer
		%showframe, % Uncomment to show how the type block is set on the page
	]{geometry}
}

\RequirePackage{hyperref} % Required for including links
\RequirePackage{changepage}

\RequirePackage[defaultlines=2,all]{nowidow}  % Prevent line breaks in short paragraphs

%%
% Font stuff

% Encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}

% Set fonts
\RequirePackage[osf]{mathpazo} % Palatino with oldstyle figures
\newcommand\liningnums[1]{\fontfamily{ppl}\selectfont#1} % Enable switch to lining nums
\RequirePackage{amsmath, amssymb}
\RequirePackage{eulervm}
\RequirePackage[scaled=.8819]{sourcecodepro} % Source Code Pro typeface for monospace
\RequirePackage{csquotes}

% Letterspacing
\RequirePackage[
	activate={true,nocompatibility},
	final,
	kerning=true,
	spacing=true,
	factor=1260,
	stretch=10,
	shrink=10
]{microtype}
\frenchspacing  % Prevent double whitespaces between sentences

\lsstyle

\newcommand\lsstylehelp[1]{\edef\MT@letterspace@{#1}\lsstyle} % Enable change to letterspacing
\newcommand{\hairsp}{\ifmmode\mskip1mu\else\kern0.083em\fi}
\renewcommand{\,}{\ifmmode\mskip1mu\else\kern0.167em\fi}

% Font sizes
\renewcommand\huge{%
	\@setfontsize\huge{22}{36}%
}
\renewcommand\normalsize{%
	\@setfontsize\normalsize{11}{17}%
}
\renewcommand\large{%
	\@setfontsize\large{17}{22}
}
\renewcommand\small{%
	\@setfontsize\small{8.5}{14}%
}
\renewcommand\footnotesize{%
	\@setfontsize\small{8.5}{14}%
}

% Paragraph indentation
\setlength{\parindent}{0pt}
\setlength{\parskip}{8.5pt}


%%
% Title
\RequirePackage{titlesec}

\newcommand{\email}[1]{%
	\def \@email {#1}
}

\renewcommand{\maketitle}{\bgroup
	\begin{center}
		{\large\selectfont\liningnums\lsstylehelp{0} \par\@title\par}
		{\normalfont \@author\\\@email}%
		\vspace{-8.5pt}
	\end{center}

	\hypersetup{
		pdftitle=\@title,
		pdfauthor=\@author
	}
}


%%
% Abstract
\renewenvironment{abstract}{%
	\begin{center}
		\begin{adjustwidth}{0.5in}{0.5in}
			\normalfont%
			\textbf{\textit{Abstract\hairsp—\hairsp}}\ignorespaces
			}{%
		\end{adjustwidth}
		\vspace{-8.5pt}
	\end{center}
}


%%
% Quotation
\renewenvironment{quotation}{%
	\begin{center}
		\vspace{-8.5pt}
		\begin{adjustwidth}{0.5in}{0.5in}
			\noindent }{%
		\end{adjustwidth}
		\vspace{-8.5pt}
	\end{center}
}


%%
% Headings

% Heading 1
\titleformat{\section} % Section type being modified
	{\normalfont\liningnums\lsstylehelp{60}\bfseries}
	{\thesection}{0.333em} % Space between the title and label
	{\MakeUppercase}
\titlespacing*{\section}{0pt}{0pt}{0pt}

% Heading 2
\titleformat{\subsection}
	{\normalfont\bfseries}
	{\thesubsection}{0.4em}{}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

% Heading 3
\titleformat{\subsubsection}
	{\normalfont\bfseries\itshape}
	{\textup{\thesubsubsection}}{0.4em}{}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}

% Heading 4
\newcommand{\subsubsubsection}[1]{
	\textbf{\textit{#1}}\hairsp—\hairsp\ignorespaces
}
\renewcommand{\paragraph}[1]{
	\textbf{\textit{#1}}\hairsp—\hairsp\ignorespaces
}


%%
% Captions
% Note: don't use "figures" when floating is not desired. See:
% 	https://texblog.net/latex-archive/uncategorized/prevent-floating-image-figure-table/
\RequirePackage{caption} % Required for customising captions
\DeclareCaptionFormat{letterspaced}{%
	\lsstylehelp{20}{%
			#1#2#3\par%
	}{}%
}
\captionsetup{hypcap=false} % Resolves warning
\captionsetup{format=letterspaced} % Use the letter spaced caption style by default
\captionsetup{margin=1in} % Margin on the left and right sides of captions
\captionsetup{justification=justified, singlelinecheck=false} % Left-align and justify captions
\captionsetup{font=small} % Reduce font size
\captionsetup{labelfont={bf,it}} % BoldItalic label and number
\DeclareCaptionLabelSeparator{emdash}{\hairsp—\hairsp} % Custom caption label separator
\captionsetup{labelsep=emdash} % Change the default colon between number and label to use the custom separator

\RequirePackage{mdframed}
\mdfdefinestyle{nonbreakingframe}{nobreak,linecolor=white,leftmargin=0,rightmargin=0,innerleftmargin=0,innerrightmargin=0,innertopmargin=0,innerbottommargin=0,skipabove=8.5pt,skipbelow=0}

\newenvironment{jdffigure}{%
	\begin{mdframed}[style=nonbreakingframe]
	\begin{center}
	}{%
	\vspace{-8.5pt}
	\end{center}
	\end{mdframed}
}

%%
% Lists
\RequirePackage{enumitem} % Required for list customisation
\setlist{leftmargin=*, noitemsep, nolistsep} % No left margin and space around/within lists
\setlist[itemize]{label={\tiny\textsuperscript{\textbullet}}}


%%
% Image stuff
\RequirePackage{graphicx} % Required for including images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images

% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}

% Set default figure placement to htbp
\def\fps@figure{htbp}


%%
% Tables
\RequirePackage{siunitx}  % Required for "S" to align by decimal

% Set default table placement to htbp
\def\fps@table{htbp}
\def\fps@longtable{htbp}

\RequirePackage{booktabs} % Required for better horizontal rules in tables
\RequirePackage{array} % Required for manipulating table columns
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}} % Define a new right-aligned paragraph column type
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}} % Define a new left-aligned (no justification) paragraph column type
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}} % Define a new centered paragraph column type
\setlength\lightrulewidth{0.03em}

\newenvironment{jdftable}{%
	\begin{mdframed}[style=nonbreakingframe]
	\begin{center}
	}{%
	\vspace{-8.5pt}
	\end{center}
	\end{mdframed}
}

%%
% Footnotes
\RequirePackage[bottom]{footmisc} % Make footnotes flush w/ the bottom of the page
\setlength{\skip\footins}{17pt}
\setlength{\footnotesep}{8.5pt}

\RequirePackage{footnotebackref} % Add backreferencing
\long\def\@makefntext#1{
	\lsstylehelp{20}{
		{\footnotesize\@thefnmark~#1} % Footnote text position and width
	}
}


%%
% References
\RequirePackage[
	bibstyle=authoryear,
	dashed=false,
	sorting=ynt,
	natbib=true,
	maxbibnames=99
]{biblatex}

\DeclareFieldFormat{bibentrysetcount}{\mkbibparens{\mknumalph{#1}}}
\DeclareFieldFormat{labelnumberwidth}{#1.}

\defbibenvironment{bibliography}
	{\list
		{\printtext[labelnumberwidth]{%
			\printfield{labelprefix}%
			\printfield{labelnumber}}
		}%
		{\setlength{\labelwidth}{\labelnumberwidth}%
		\setlength{\leftmargin}{\labelwidth}%
		\setlength{\labelsep}{\biblabelsep}%
		\addtolength{\leftmargin}{\labelsep}%
		\setlength{\itemsep}{\bibitemsep}%
		\setlength{\parsep}{\bibparsep}}%
		\renewcommand*{\makelabel}[1]{\hss##1}}
	{\endlist}
	{\item}

\DeclareNameAlias{sortname}{family-given}

% editing answer by moewe to get multiyear things going (2021a, 2021b)
% https://tex.stackexchange.com/questions/312539/unwanted-comma-between-author-and-year-using-citet-command
\DeclareCiteCommand{\citeyear}
    {\usebibmacro{prenote}}
    {\printfield{year}\printfield{extrayear}}
    {\multicitedelim}
    {\usebibmacro{postnote}}

\DeclareCiteCommand{\citeyearpar}[\mkbibparens]
    {\usebibmacro{prenote}}
    {\printfield{year}\printfield{extrayear}}
    {\multicitedelim}
    {\usebibmacro{postnote}}

% Inline citations
\renewcommand{\cite}[1]{\citeauthor{#1}, \citeyear{#1}}
\renewcommand{\citep}[1]{(\citeauthor{#1}, \citeyear{#1})}
\newcommand{\citeinl}[1]{\citeauthor{#1} (\citeyear{#1})}
% Missing Author
\newcommand{\citenoauth}[1]{\citetitle{#1}, \citeyear{#1}}
\newcommand{\citenoauthp}[1]{(\citetitle{#1}, \citeyear{#1})}
% Missing Author and Year
\newcommand{\citenoauthdate}[1]{\citetitle{#1}, n.d.}
\newcommand{\citenoauthdatep}[1]{(\citetitle{#1}, n.d.)}
% Missing Year
\newcommand{\citeauthnodate}[1]{\citeauthor{#1}, n.d.}
\newcommand{\citeauthnodatep}[1]{(\citeauthor{#1}, n.d.)}

%%
% Metadata
\RequirePackage{xcolor} % Required for defining custom colours
\hypersetup{
	% bookmarks=true,
	% bookmarksopen=true,
	pdfpagemode=UseOutlines,
	colorlinks=true,
	citecolor=blue,
	urlcolor=blue,
	linkcolor=blue
}


%% General Tex Notes
% Remove leading space on tables with "${}": https://stackoverflow.com/a/3155768/3219667
% Why \arraybackslash: https://tex.stackexchange.com/a/387741/224014
% Trailing comment swallows the end-of-line character: https://tex.stackexchange.com/a/7459/224014

%% Utilities
% Source: https://tex.stackexchange.com/a/484219/224014
\newcommand{\comment}[1]{}

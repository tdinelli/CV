% resume.cls
% LaTeX file defining the structure of the resume
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2023/05/28 v1.0 LaTeX class for CVs]

% Load the base class with A4 paper size and 10pt font
\LoadClass[a4paper,10pt]{article}

% Load necessary packages
\RequirePackage[utf8]{inputenc} % For UTF-8 encoding
\RequirePackage{geometry} % To set the page margins
\RequirePackage{amsmath, amssymb} % For math symbols
\RequirePackage{hyperref} % To create hyperlinks
\RequirePackage{enumitem} % To customize lists
\RequirePackage{titlesec} % To format section titles
\RequirePackage{parskip} % To handle paragraph spacing
\RequirePackage{xcolor} % To color text
\RequirePackage{graphicx} % To include graphics
\RequirePackage{etaremune} % To do reverse ordering enumerations
\RequirePackage[style=iso]{datetime2} % Display the date
\RequirePackage{lastpage} % Page numbering
\RequirePackage{fancyhdr} % Custome header and footer

% Bibliography
\RequirePackage[backend=biber, sorting=ydnt, url=false, maxbibnames=99, defernumbers=true]{biblatex}
\addbibresource{publications.bib}

% Set page margins
\geometry{left=1in, right=1in, top=1in, bottom=1in}

% Format section titles
\titleformat{\section}{\scshape\large\raggedright}{}{0em}{}[\titlerule] % Large, small caps, left-aligned, with a line
\titleformat{\subsection}{\bfseries\raggedright}{}{0em}{} % Bold, left-aligned

% Define custom commands
\newcommand{\name}[1]{\Huge \scshape {#1} \par \normalsize \normalfont} % Command for name
\newcommand{\sectiontitle}[1]{\section*{\textbf{#1}}} % Command for section title without numbering
\newcommand{\subsectiontitle}[1]{\subsection*{#1}} % Command for section title without numbering


% Define custom environment for entries
% entry va a capo
\newenvironment{entry}[1]%
  {\noindent\textbf{#1}\vspace{0.5em}\par}
  {\vspace{0.3em}}

% inline_entry NON va a capo
\newenvironment{inline_entry}[1]%
  {\noindent\textbf{#1}} % Bold entry title with spacing
  {\vspace{0.3em}} % Spacing after entry

% Position no date
\newenvironment{position_simple}[2]%
  {\noindent\textbf{#1}, #2 \par} % Position Title, location
  {\vspace{1em}} % Spacing after position

% Position complete
\newenvironment{position}[3]%
  {\noindent\textbf{#1}, #2 \hfill \textbf{#3} \vspace{0.3em}\par} % Position Title, location, year
  {\vspace{1em}} % Spacing after position


% Set hyperlink colors
\hypersetup{
    colorlinks=false, % Default for bordered links
    linkbordercolor=blue, % Color for internal links
    filebordercolor=magenta, % Color for file links
    urlbordercolor=red, % Color for URLs
    pdftitle={CV}, % PDF title
    pdfpagemode=FullScreen, % Open in full screen mode
}

% Headings
\pagestyle{fancy}
\lhead{}
\chead{}
\rhead{}
\lfoot{Timoteo Dinelli --- Curriculum Vitae (as of \today)}
\cfoot{}
\rfoot{\thepage\ of \pageref*{LastPage}}
\renewcommand{\headrulewidth}{0.pt}

% Annotate my name in bibliography
\renewcommand*{\mkbibnamegiven}[1]{%
\ifitemannotation{highlight}
{\underline{\textbf{#1}}}
{#1}}
\renewcommand*{\mkbibnamefamily}[1]{%
\ifitemannotation{highlight}
{\underline{\textbf{#1}}}
{#1}}

% Define the bibliography environment and print it with reverse ordering for the numbers
\defbibenvironment{bibliography}
   {
      \renewcommand\labelenumi{\theenumi.}
      \begin{etaremune}}
   {\end{etaremune}}
   {\item}

\endinput % End of the class file

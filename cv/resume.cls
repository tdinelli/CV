% resume.cls
% LaTeX class file for creating professional CVs/resumes
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2024/12/16 v1.1 LaTeX class for CVs]

% Base class configuration
\LoadClass[a4paper,10pt]{article}  % Use article class with A4 paper and 10pt font

% Required packages and their purposes
\RequirePackage[T1]{fontenc}           % Enhanced font encoding support
\RequirePackage[default,light,semibold]{sourceserifpro}  % Source Serif Pro font
\RequirePackage[margin=1in]{geometry}  % Page margin settings
\RequirePackage[dvipsnames]{xcolor}    % Extended color support
\RequirePackage[                       % Hyperlink configuration
    colorlinks=true,
    linkcolor=PineGreen,
    linkbordercolor=PineGreen,
    filecolor=magenta,
    urlcolor=PineGreen,
    urlbordercolor=PineGreen,
    citecolor=blue
]{hyperref}
\RequirePackage[shortlabels]{enumitem}  % Enhanced list environments
\RequirePackage{titlesec}               % Section title formatting
\RequirePackage{parskip}                % Paragraph spacing
\RequirePackage{etaremune}              % Reverse enumeration
\RequirePackage[style=iso]{datetime2}   % Date formatting
\RequirePackage{lastpage}               % For last page reference
\RequirePackage{fancyhdr}               % Header and footer customization
\RequirePackage{soul}                   % Text highlighting and underlining
\RequirePackage{microtype}              % Typography enhancements
\RequirePackage{ragged2e}               % Text alignment
\RequirePackage[most]{tcolorbox}        % Colored boxes for sections

% Bibliography configuration
\RequirePackage[
    backend=biber,                      % Use biber backend
    sorting=ydnt,                       % Year-descending sorting
    url=false,                          % Don't show URLs
    maxbibnames=99,                     % Show all author names
    defernumbers=true,                  % Automatic numbering
    style=numeric-comp                  % Numeric citation style
]{biblatex}

% Remove "In:" prefix and ISSN from bibliography entries
\renewbibmacro{in:}{}
\DeclareSourcemap{
    \maps[datatype=bibtex]{
        \map{
            \step[fieldset=issn, null]
        }
    }
}

% Custom section formatting with boxes
\newcommand{\boxedsection}[1]{%
    \begin{tcolorbox}[
            colback=gray!20,   % Box background color
            colframe=black,    % Box frame color
            boxrule=.5pt,      % Frame thickness
            width=\textwidth,  % Full width
            arc=0mm,           % No rounded corners
            sharp corners,     % Ensure rectangular shape
            top=1.3pt,         % Top padding
            bottom=1.3pt,      % Bottom padding
            right=0pt,
            left=0pt,
        ]
        \textbf{#1}
    \end{tcolorbox}%
}

% Section and subsection formatting
\titleformat{\section}     % Section format
{\large}
{}
{0em}
{\boxedsection}
\titlespacing{\section}
{0pt}                      % Left margin
{-3.ex}                    % Space before
{-4.ex}                    % Space after

\titleformat{\subsection}  % Subsection format
{\large\bfseries\raggedright}
{}{0em}
{}
\titlespacing*{\subsection}
{0pt}
{1.25ex plus .5ex minus .2ex}
{.75ex plus .1ex}

% Custom commands for CV elements
\newcommand{\name}[1]{%                     % Name formatting
    \begingroup
    {\Huge\scshape \textbf{#1}\par}
    \vspace{1em}
    \endgroup
}

% Section and subsection title commands
\newcommand{\sectiontitle}[1]{%
    \section*{#1}
}
\newcommand{\subsectiontitle}[1]{%
    \subsection*{#1}
}

% Entry environment definitions for CV items
\newenvironment{entry}[1]{%                 % Basic entry
    \par\noindent
    \textbf{#1}
    \vspace{0.5em}\par
}{%
    \vspace{0.15em}
}

\newenvironment{inline_entry}[1]{%          % Inline entry
    \par\noindent
    \textbf{#1}
}{%
    \vspace{0.15em}
}

\newenvironment{position_simple}[2]{%       % Simple position entry
    \par\noindent
    \textbf{#1}, \textit{#2}\par
}{%
    \vspace{0.15em}
}

\newenvironment{position}[3]{%              % Detailed position entry
    \par\noindent
    \textbf{#1}, \textit{#2}\hfill\textbf{#3}
    \vspace{0.05em}\par
}{%
    \vspace{0.5em}
}

% Header and footer configuration
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\lfoot{\small\textit{Curriculum Vitae of Timoteo Dinelli --- \today}}
\rfoot{\small\thepage/\pageref*{LastPage}}

% Bibliography name formatting
\renewcommand*{\mkbibnamegiven}[1]{         % Format given names
    \ifitemannotation{highlight}
    {\textbf{#1}}
    {#1}
}

\renewcommand*{\mkbibnamefamily}[1]{        % Format family names
    \ifitemannotation{highlight}
    {\textbf{#1}}
    {#1}%
    \ifitemannotation{equal}
    {{\large \textsuperscript{\textdagger}}}
    {}%
    \ifitemannotation{corresponding}
    {\textsuperscript{*}}
    {}%
}

% Bibliography environment configuration
\defbibenvironment{bibliography}
{\renewcommand\labelenumi{\theenumi.}%
    \begin{etaremune}[leftmargin=2em]}      % Reverse numbered list
        {\end{etaremune}}
{\item}

\endinput

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

return {
  --  Document structure
  s({ trig = "beg", snippetType = "autosnippet" },
    fmta([[
      \begin{<>}
        <>
      \end{<>}
    ]], { i(1), i(0), rep(1) })
  ),

  s("inizio",
    fmta([[
      \documentclass{article}
      \usepackage[tmargin=2cm,rmargin=8cm,lmargin=1in,margin=3cm,bmargin=2cm,footskip=.2in]{geometry}
      \usepackage{amsthm}
      \usepackage{amsmath,amssymb}
      \usepackage{framed}
      \usepackage{graphicx}
      \graphicspath{ {./img} }
      \title{\Huge{<>}}
      \author{<>}
      \setlength{\FrameRule}{0.6pt}
      \begin{document}
      \maketitle
      \pagebreak
      \tableofcontents
      \pagebreak

      <>

      \end{document}
    ]], { i(1), i(2), i(0) })
  ),

  s("box",
    fmta([[
      \begin{framed}
      \textbf{<>}\\
      <>

      \end{framed}
    ]], { i(1), i(0) })
  ),

  s("firma", t({"Cordiali Saluti,", "Pozzobon Luca"})),

  s("oggi", f(function() return os.date("%Y-%m-%d") end, {})),

  s({ trig = "skip", snippetType = "autosnippet" },
    fmta([[
      \medskip
      \hrulefill
      \bigskip


      <>
    ]], { i(0) })
  ),

  s("item", fmta([[\item <>]], { i(0) })),
  
  s({ trig = "pagebreak", snippetType = "autosnippet" }, t([[\pagebreak]])),

  s({ trig = "tabella", snippetType = "autosnippet" },
    fmta([[
      %OPZIONI
      % - per dim massima della colonna usare P{2.5cm} al posto di c
      % - per colonna in grassetto, ? al posto di |
      % - per riga in grassetto, \hhline al posto di \hline
      \begin{tabular}{|c|c|}
      	\hline
      	<> & <> \\
      	\hline
      	<>
      \end{tabular}<>
    ]], { i(1), i(2), i(3), i(0) })
  ),

  -- Text Formatting
  s({ trig = "bf", snippetType = "autosnippet" }, fmta([[\textbf{<>}<>]], { i(1), i(0) })),
  s({ trig = "ital", snippetType = "autosnippet" }, fmta([[\textit{<>}<>]], { i(1), i(0) })),
  s({ trig = "und", snippetType = "autosnippet" }, fmta([[\uline{<>}<>]], { i(1), i(0) })),
  s({ trig = "segnato", snippetType = "autosnippet" }, fmta([[\overline{<>}<>]], { i(1), i(0) })),
  s({ trig = "text", snippetType = "autosnippet" }, fmta([[\text{<>}<>]], { i(1), i(0) })),
  
  s({ trig = "chapter", snippetType = "autosnippet" }, fmta([[\chapter{<>}<>]], { i(1), i(0) })),
  s({ trig = "section", snippetType = "autosnippet" }, fmta([[\section{<>}<>]], { i(1), i(0) })),
  s({ trig = "subsection", snippetType = "autosnippet" }, fmta([[\subsection{<>}<>]], { i(1), i(0) })),
  s({ trig = "subsubsection", snippetType = "autosnippet" }, fmta([[\subsubsection{<>}<>]], { i(1), i(0) })),
  
  s({ trig = "tcolor", snippetType = "autosnippet" }, fmta([[\textcolor{<>}{<>} <>]], { i(1), i(2), i(0) })),
  s("blu", fmta([[\textcolor{blue}{<>} <>]], { i(1), i(0) })),
  s("rosso", fmta([[\textcolor{red}{<>} <>]], { i(1), i(0) })),
  s("teal", fmta([[\textcolor{teal}{<>} <>]], { i(1), i(0) })),

  -- Images
  s({ trig = "imgc", snippetType = "autosnippet" },
    fmta([[
      \begin{center}
      	\includegraphics[scale=0.5]{<>}
      	\label{fig:<>}
      \end{center}
      <>
    ]], { i(1), rep(1), i(0) })
  ),

  s({ trig = "imgdx", snippetType = "autosnippet" },
    fmta([[
      \begin{wrapfigure}{r}{0.5\textwidth}
      \centering
      \includegraphics[scale=0.2]{<>}
      \label{fig:<>}
      %\caption{}
      \end{wrapfigure}
      <>
    ]], { i(1), i(2), i(0) })
  ),

  s({ trig = "imgsx", snippetType = "autosnippet" },
    fmta([[
      \begin{wrapfigure}{l}{0.5\textwidth}
      \centering
      \includegraphics[scale=0.2]{<>}
      \label{fig:<>}
      %\caption{}
      \end{wrapfigure}
      <>
    ]], { i(1), i(2), i(0) })
  ),

  -- Math
  s({ trig = "form" },
    fmta([[
      \[
      <>
      \] <>
    ]], { i(1), i(0) })
  ),
  
  s({ trig = "$", snippetType = "autosnippet" }, fmta([[$<>$<>]], { i(1), i(0) })),
  s({ trig = "^", snippetType = "autosnippet", wordTrig = false }, fmta([[^{<>}<>]], { i(1), i(0) })),
  s({ trig = "_", snippetType = "autosnippet", wordTrig = false }, fmta([[_{<>}<>]], { i(1), i(0) })),
  s({ trig = "frac", snippetType = "autosnippet", wordTrig = false }, fmta([[\frac{<>}{<>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "binom", snippetType = "autosnippet" }, fmta([[\binom{<>}{<>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "\\{", snippetType = "autosnippet", wordTrig = false }, fmta([[\left\{<>\right\}<>]], { i(1), i(0) })),
  s({ trig = "left|", snippetType = "autosnippet", wordTrig = false }, fmta([[\left| <> \right| <>]], { i(1), i(0) })),

  -- Advance operators
  s({ trig = "sm", snippetType = "autosnippet" }, fmta([[\sum_{<>}^{<>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "limite"}, fmta([[\lim_{<> \to <>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "integ", snippetType = "autosnippet" }, fmta([[\int_{<>}^{<>}<>]], { i(1), i(2), i(0) })),
  
  s({ trig = "sotto" }, fmta([[\underset{<>}{<>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "sopra" }, fmta([[\overset{<>}{<>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "tendesu", snippetType = "autosnippet" }, fmta([[\overbrace{<>}^{<>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "tendegiu", snippetType = "autosnippet" }, fmta([[\underbrace{<>}_{<>}<>]], { i(1), i(2), i(0) })),

  s({ trig = "rad2", snippetType = "autosnippet" }, fmta([[\sqrt{<>}<>]], { i(1), i(0) })),
  s({ trig = "radsemp2", snippetType = "autosnippet" }, fmta([[\sqrt[\cancel{2}]{<>}<>]], { i(1), i(0) })),
  s({ trig = "rad3", snippetType = "autosnippet" }, fmta([[\sqrt[3]{<>}<>]], { i(1), i(0) })),
  s({ trig = "radsemp3", snippetType = "autosnippet" }, fmta([[\sqrt[\cancel{3}]{<>}<>]], { i(1), i(0) })),
  s({ trig = "radn", snippetType = "autosnippet" }, fmta([[\sqrt[<>]{<>}<>]], { i(1), i(2), i(0) })),
  s({ trig = "radsempn", snippetType = "autosnippet" }, fmta([[\sqrt[\cancel{<>}]{<>}<>]], { i(1), i(2), i(0) })),

  s({ trig = "vect", snippetType = "autosnippet" },
    fmta([[
      \begin{pmatrix}
      	<> \\
      	\vdots
      \end{pmatrix} <>
    ]], { i(1), i(0) })
  ),

  -- Trigonometric functions
  s("log", fmta([[\log_{<>}<>]], { i(1), i(0) })),
  s({ trig = "floor", snippetType = "autosnippet" }, fmta([[\left\lfloor <> \right\rfloor<>]], { i(1), i(0) })),
  s({ trig = "ceil", snippetType = "autosnippet" }, fmta([[\left\lceil <> \right\rceil<>]], { i(1), i(0) })),
  s("sin", fmta([[\sin <>]], { i(0) })),
  s("cos", fmta([[\cos <>]], { i(0) })),
  s("tan", fmta([[\tan <>]], { i(0) })),
  s("cot", fmta([[\cot <>]], { i(0) })),
  s("arctan", fmta([[\arctan <>]], { i(0) })),
  s("arcsin", fmta([[\arcsin <>]], { i(0) })),
  s("arccos", fmta([[\arccos <>]], { i(0) })),

  -- Greek letters
  s({ trig = "alpha", snippetType = "autosnippet" }, t([[\alpha]])),
  s({ trig = "lmb", snippetType = "autosnippet" }, t([[\lambda]])),
  s({ trig = "Lmb", snippetType = "autosnippet" }, t([[\Lambda]])),
  s({ trig = "beta", snippetType = "autosnippet" }, t([[\beta]])),
  s({ trig = "eta", snippetType = "autosnippet" }, t([[\eta]])),
  s({ trig = "gamma", snippetType = "autosnippet" }, t([[\gamma]])),
  s({ trig = "phi", snippetType = "autosnippet" }, t([[\phi]])),
  s({ trig = "psi", snippetType = "autosnippet" }, t([[\psi]])),
  s({ trig = "delta", snippetType = "autosnippet" }, t([[\delta]])),
  s({ trig = "theta", snippetType = "autosnippet" }, t([[\theta]])),
  s({ trig = "sigma", snippetType = "autosnippet" }, t([[\sigma]])),
  s({ trig = "rho", snippetType = "autosnippet" }, t([[\rho]])),
  s("pi", t([[\pi]])),
  s({ trig = "eps", snippetType = "autosnippet", wordTrig = false }, t([[\varepsilon]])),

  -- Sets and logic
  s({ trig = "varnot", snippetType = "autosnippet" }, t([[\varnothing]])),
  s({ trig = "allora" }, t([[\Rightarrow]])),
  s({ trig = "onlyif", snippetType = "autosnippet" }, t([[\Leftrightarrow]])),
  s({ trig = "forall", snippetType = "autosnippet" }, t([[\forall]])),
  s({ trig = "ex", snippetType = "autosnippet" }, t([[\exists]])),
  s({ trig = "nex", snippetType = "autosnippet" }, t([[\nexists]])),
  s({ trig = "inf" }, t([[\infty]])),
  s({ trig = "resteso", snippetType = "autosnippet" }, t([[\widetilde{R}]])),
  s({ trig = "bb", snippetType = "autosnippet" }, fmta([[\mathbb{<>}<>]], { i(1), i(0) })),
  s("in", t([[\in]])),
  s({ trig = "neq", snippetType = "autosnippet" }, t([[\neq]])),
  s({ trig = "subset", snippetType = "autosnippet" }, t([[\subset]])),
  s({ trig = "setminus", snippetType = "autosnippet" }, t([[\setminus]])),
  s("to", t([[\to]])),
  s({ trig = "mapsto", snippetType = "autosnippet" }, t([[\mapsto]])),
  s({ trig = "geq", snippetType = "autosnippet" }, t([[\geq]])),
  s({ trig = "leq", snippetType = "autosnippet" }, t([[\leq]])),

  -- boh
  s({ trig = "quad", snippetType = "autosnippet" }, t([[\quad]])),
  s({ trig = "qquad", snippetType = "autosnippet" }, t([[\qquad]])),
  s({ trig = "cdot", snippetType = "autosnippet" }, t([[\cdot]])),
  s({ trig = "bigg", snippetType = "autosnippet" }, t([[\bigg]])),
  s({ trig = "rightarrow", snippetType = "autosnippet" }, t([[\rightarrow]])),
  s({ trig = "fresop", snippetType = "autosnippet" }, fmta([[\vec{<>}<>]], { i(1), i(0) })),
  
  s("cal", fmta([[\mathcal{<>}<>]], { i(1), i(0) })),
  s("parz", t([[\partial]])),
  s("nabla", t([[\nabla]])),
  s("Theta", t([[\Theta]])),
  s("Omega", t([[\Omega]])),
}

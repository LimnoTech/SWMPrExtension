% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarise_handoff_files.R
\name{summarise_handoff_files}
\alias{summarise_handoff_files}
\title{Summarise Hand-off Files from Reserve Level Reports}
\usage{
summarise_handoff_files(path, param, res_region = NULL)
}
\arguments{
\item{path}{chr string of full path to .csv handoff files}

\item{param}{chr string of variable to summarise}

\item{res_region}{a \code{data.frame} of look-up values that match 3-letter NERR site ids with regions}
}
\value{
Returns a \code{data.frame}
}
\description{
Summarise the seasonal kendall results from reserve level report hand-off files
}
\details{
This function is intended for use with the NERRS national level reporting scripts. It returns a \code{data.frame} that summarises the result of the reserve level seasonal kendall trend analyses found in the hand-off files generated by the reserve level reporting scripts. The summary groups reserves into regional classifications based on user-specified regions given in \code{res_region}.
}
\author{
Julie Padilla
}
\concept{
reporting
}

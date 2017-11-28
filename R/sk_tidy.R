#' Tidy Seasonal Kendall Results
#'
#' Tidy results from \code{\link[EnvStats]{kendallSeasonalTrendTest}}
#'
#' @param data a XXX object produced
#' @param station chr string sampling station
#' @param param chr string of variable to plot
#' @param stat chr, label to be used for statistic used to group data
#' @param pval num, significance level
#'
#' @export
#'
#' @details A helper function used by \code{sk_seasonal} to return a table of tidied values.
#'
#' @author Julie Padilla
#'
#' @concept miscellaneous
#'
#' @return a \code{data.frame} of results from \code{\link[EnvStats]{kendallSeasonalTrendTest}}
#'
#' @examples
#' \dontrun{
#' data(elksmwq)
#' }
#'
sk_tidy <- function(data, station, param, stat, pval) {
  # have a check that verifies the data type as whatever kendallSeasonalTrend returns
  dat <- data
  parm <- param

  results <- data.frame(station, stat, parm
               , dat$estimate[[1]]
               , dat$estimate[[2]]
               , dat$p.value[[1]]
               , dat$p.value[[2]])

  names(results) <- c('station', 'type', 'parameter', 'tau', 'slope', 'pval.chisq', 'pval.trend')

  results$sig.chi <- NA
  results$sig.trend <- NA

  results[results$pval.chisq > pval, ]$sig.chi <- 'insig'
  results[results$pval.chisq < pval, ]$sig.chi <- 'sig'


  results[results$pval.trend > pval, ]$sig.chi <- 'insig'

  results[results$pval.trend < pval & results$trend > 0, ]$sig.chi <- 'inc'
  results[results$pval.trend < pval & results$trend < 0, ]$sig.chi <- 'dec'
  results[results$pval.trend < pval & results$trend == 0, ]$sig.chi <- 'zero slope'

  return(results)
}
#' Moving-Average Coefficients of a Gegenbauer Process
#'
#' Compute the MA representation psi(j) for 1- or 2-factor Gegenbauer processes.
#'
#' @param d Numeric vector of length 1 or 2.
#' @param u Numeric vector of same length as d.
#' @param trun Integer, truncation order.
#'
#' @return Numeric vector of length trun + 1.
#' @export
gegenbauer_ma <- function(d, u, trun = 50000) {
  k <- length(d)
  stopifnot(k %in% c(1, 2))

  if (k == 1) {
    C <- gegenbauer_poly(u, d, trun)
    return(C)
  }

  C1 <- gegenbauer_poly(u[1], d[1], trun)
  C2 <- gegenbauer_poly(u[2], d[2], trun)

  psi <- numeric(trun)
  for (j in 1:trun) {
    psi[j] <- sum(C1[1:j] * rev(C2[1:j]))
  }
  psi
}

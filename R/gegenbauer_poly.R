#' Gegenbauer Polynomial Coefficients
#'
#' Compute the coefficients C(n; d, u) of the Gegenbauer polynomial expansion:
#' (1 - 2uB + B^2)^(-d) = sum_{n>=0} C(n; d, u) B^n.
#'
#' @param u Numeric scalar, Gegenbauer parameter.
#' @param d Numeric scalar, fractional exponent.
#' @param n Integer, number of coefficients to compute.
#'
#' @return Numeric vector of length n.
#' @export
gegenbauer_poly <- function(u, d, n) {
  stopifnot(n >= 2)
  C <- numeric(n)
  C[1] <- 1
  C[2] <- 2 * d * u

  if (n > 2) {
    for (i in 3:n) {
      C[i] <- (2 * (i - 2 + d) * u * C[i - 1] -
               (i - 3 + 2 * d) * C[i - 2]) / (i - 1)
    }
  }
  C
}

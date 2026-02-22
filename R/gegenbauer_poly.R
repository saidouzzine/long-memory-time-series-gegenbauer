#' Coefficients du polynôme de Gegenbauer
#'
#' Cette fonction calcule les coefficients C(n; d, u) définis par le
#' développement :
#' (1 - 2uB + B^2)^(-d) = Σ C(n; d, u) B^n.
#'
#' @param u Numérique. Paramètre de Gegenbauer.
#' @param d Numérique. Paramètre fractionnaire.
#' @param n Entier. Nombre de coefficients à calculer.
#'
#' @return Un vecteur numérique de longueur n contenant les coefficients.
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

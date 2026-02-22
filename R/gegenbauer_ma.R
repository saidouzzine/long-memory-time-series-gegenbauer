#' Coefficients MA d'un processus de Gegenbauer
#'
#' Calcule la représentation en moyenne mobile (MA) d’un processus
#' Gegenbauer à 1 ou 2 facteurs.
#'
#' @param d Vecteur numérique (1 ou 2 éléments). Paramètres fractionnaires.
#' @param u Vecteur numérique (même longueur que d). Paramètres Gegenbauer.
#' @param trun Entier. Ordre de troncature.
#'
#' @return Un vecteur numérique contenant les coefficients MA.
#' @export
gegenbauer_ma <- function(d, u, trun = 50000) {
  k <- length(d)
  stopifnot(k %in% c(1, 2))

  if (k == 1) {
    return(gegenbauer_poly(u, d, trun))
  }

  C1 <- gegenbauer_poly(u[1], d[1], trun)
  C2 <- gegenbauer_poly(u[2], d[2], trun)

  psi <- numeric(trun)
  for (j in 1:trun) {
    psi[j] <- sum(C1[1:j] * rev(C2[1:j]))
  }
  psi
}

#' Simulation d'un processus de Gegenbauer
#'
#' Génère une réalisation d’un processus de Gegenbauer à 1 ou 2 facteurs
#' via sa représentation MA tronquée.
#'
#' @param d Vecteur numérique (1 ou 2). Paramètres fractionnaires.
#' @param u Vecteur numérique (1 ou 2). Paramètres Gegenbauer.
#' @param n Entier. Longueur de la série simulée.
#' @param trun Entier. Ordre de troncature.
#' @param sigma2 Numérique. Variance du bruit blanc.
#' @param seed Entier optionnel pour la reproductibilité.
#'
#' @return Un vecteur numérique de longueur n.
#' @export
gegenbauer_sim <- function(d, u, n = 200, trun = 50000, sigma2 = 1, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)

  psi <- gegenbauer_ma(d, u, trun)
  white <- rnorm(trun + n, sd = sqrt(sigma2))

  stats::filter(white, psi, method = "convolution", sides = 1)[(trun + 1):(trun + n)]
}

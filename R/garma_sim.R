#' Simulation d'un processus GARMA
#'
#' @param d Paramètres fractionnaires.
#' @param u Paramètres Gegenbauer.
#' @param phi Coefficients AR.
#' @param theta Coefficients MA.
#' @param n Longueur de la série simulée.
#' @param sigma2 Variance du bruit blanc.
#' @param seed Optionnel.
#'
#' @return Un vecteur numérique simulé.
#' @export
garma_sim <- function(d, u, phi, theta = numeric(0),
                      n = 200, sigma2 = 1, seed = NULL) {

  x <- gegenbauer_sim(d, u, n + 500, sigma2 = sigma2, seed = seed)
  x <- tail(x, n + max(length(phi), length(theta)))

  stats::filter(x, c(1, -phi), method = "recursive")[(length(phi) + 1):(length(phi) + n)]
}

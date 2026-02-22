#' ACF théorique d'un modèle GARMA
#'
#' Calcule l'autocovariance et l'autocorrélation théoriques d’un modèle
#' GARMA à partir de son spectre.
#'
#' @param u Vecteur des paramètres Gegenbauer.
#' @param lambda Vecteur des paramètres fractionnaires.
#' @param phi Coefficients AR.
#' @param theta Coefficients MA.
#' @param lags Entier. Nombre de retards.
#' @param sigma2 Variance du bruit blanc.
#'
#' @return Une liste contenant acv et acf.
#' @export
garma_acf <- function(u, lambda, phi = numeric(0), theta = numeric(0),
                      lags = 50, sigma2 = 1) {

  integrand <- function(f, k) {
    z <- exp(2 * pi * 1i * f)
    num <- if (length(theta)) Mod(sum(c(1, -theta) * z^(0:length(theta))))^2 else 1
    den <- if (length(phi))   Mod(sum(c(1, -phi)   * z^(0:length(phi))))^2 else 1
    spec <- sigma2 * num / den * prod((4 * (cos(2*pi*f) - u)^2)^(-lambda))
    Re(spec * exp(2 * pi * 1i * f * k))
  }

  acv <- sapply(0:lags, function(k) 2 * integrate(integrand, 0, 0.5, k = k)$value)
  list(acv = acv, acf = acv / acv[1])
}

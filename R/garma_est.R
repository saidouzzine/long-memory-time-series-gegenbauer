#' Estimation d'un modèle GARMA par recherche sur grille
#'
#' Effectue une recherche sur grille sur les paramètres (u, d) puis ajuste
#' un modèle AR sur la série transformée.
#'
#' @param x Série temporelle.
#' @param grid_u Valeurs candidates pour u.
#' @param grid_d Valeurs candidates pour d.
#' @param p_max Ordre AR maximal.
#'
#' @return Une liste contenant les paramètres estimés et l'AIC minimal.
#' @export
garma_est <- function(x, grid_u, grid_d, p_max = 5) {

  best <- list(aic = Inf)

  for (u in grid_u) {
    for (d in grid_d) {

      psi <- gegenbauer_ma(d, u, trun = length(x))
      w <- stats::filter(x - mean(x), psi, method = "convolution", sides = 1)

      for (p in 0:p_max) {
        fit <- try(stats::arima(w, order = c(p, 0, 0), include.mean = FALSE), silent = TRUE)
        if (inherits(fit, "try-error")) next

        if (fit$aic < best$aic) {
          best <- list(u = u, d = d, p = p, aic = fit$aic, model = fit)
        }
      }
    }
  }
  best
}

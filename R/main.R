###############################################################################
# main.R
# Script principal d'exécution du projet Gegenbauer / GARMA
# Auteur : Said Ouzzine
# Description : Ce script charge les modules, installe les dépendances,
#               importe les données climatiques, simule, estime et analyse
#               des modèles à mémoire longue (Gegenbauer, GARMA).
###############################################################################

# ---------------------------------------------------------------------------
# 1. Installation et chargement des dépendances
# ---------------------------------------------------------------------------

source("install_packages.R")   # installe les packages listés dans requirements.txt

library(stats)
library(utils)

# ---------------------------------------------------------------------------
# 2. Chargement des modules du package
# ---------------------------------------------------------------------------

source("R/gegenbauer_poly.R")
source("R/gegenbauer_ma.R")
source("R/gegenbauer_sim.R")
source("R/garma_acf.R")
source("R/garma_sim.R")
source("R/garma_est.R")

# ---------------------------------------------------------------------------
# 3. Importation des données climatiques (exemple : LNINO)
# ---------------------------------------------------------------------------

data_path <- "data/DLNINO.csv"
if (!file.exists(data_path)) stop("Le fichier DLNINO.csv est introuvable.")

Mydata <- read.csv2(data_path)

LNINO12 <- ts(Mydata$LNINO12, start = c(1991,1), frequency = 12)

# ---------------------------------------------------------------------------
# 4. Analyse exploratoire rapide
# ---------------------------------------------------------------------------

plot(LNINO12, main = "Série LNINO12", ylab = "Valeur", xlab = "Temps")
acf(LNINO12, main = "ACF LNINO12")

# ---------------------------------------------------------------------------
# 5. Simulation d’un processus Gegenbauer
# ---------------------------------------------------------------------------

sim_g <- gegenbauer_sim(d = 0.25, u = 0.9, n = 300, trun = 20000)
plot(sim_g, type = "l", main = "Simulation Gegenbauer")

# ---------------------------------------------------------------------------
# 6. Simulation d’un modèle GARMA
# ---------------------------------------------------------------------------

sim_garma <- garma_sim(d = 0.25, u = 0.9, phi = 0.8, n = 300)
plot(sim_garma, type = "l", main = "Simulation GARMA")

# ---------------------------------------------------------------------------
# 7. Estimation d’un modèle GARMA sur LNINO12
# ---------------------------------------------------------------------------

grid_u <- seq(0.5, 0.95, by = 0.05)
grid_d <- seq(0.1, 0.45, by = 0.05)

est <- garma_est(LNINO12, grid_u = grid_u, grid_d = grid_d, p_max = 5)

print("Meilleur modèle trouvé :")
print(est)

# ---------------------------------------------------------------------------
# 8. ACF théorique du modèle estimé
# ---------------------------------------------------------------------------

acf_theo <- garma_acf(u = est$u, lambda = est$d, lags = 40)
plot(acf_theo$acf, type = "h", main = "ACF théorique GARMA estimé")

# ---------------------------------------------------------------------------
# 9. Fin du workflow
# ---------------------------------------------------------------------------

cat("\nAnalyse terminée avec succès.\n")

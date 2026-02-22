# install_packages.R
# Installe automatiquement les packages listés dans requirements.txt

install_from_requirements <- function(file = "requirements.txt") {

  if (!file.exists(file)) stop("Le fichier requirements.txt est introuvable.")

  lines <- readLines(file)

  # Extraire uniquement les noms de packages (avant ==)
  pkgs <- lines[grepl("==", lines)]
  pkgs <- sub("==.*", "", pkgs)

  # Nettoyage
  pkgs <- pkgs[pkgs != ""]
  pkgs <- pkgs[!grepl("^#", pkgs)]

  for (pkg in pkgs) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      message(paste("Installation du package :", pkg))
      install.packages(pkg)
    } else {
      message(paste("Déjà installé :", pkg))
    }
  }

  message("Installation des dépendances terminée.")
}

install_from_requirements()

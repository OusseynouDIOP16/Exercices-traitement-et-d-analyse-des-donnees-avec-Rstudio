
## EXERCICE 2

# 1
import<- function(chemin,tour) {
  acces<-paste0(chemin,"\\",tour)
  extension <- tools::file_ext(acces)
  if (extension == "csv") {
    base <- read.csv(acces)
  } else if (extension == "xlsx" || extension == "xls") {
    base <- readxl::read_excel(acces)
  } else if (extension == "dta") {
    base <- haven::read_dta(acces)
  } else {
    stop("Le type de fichier n'est pas supporté.")
  }
  return(base)

  
}

# 2

renome_vars <- function(df, nomAncien, nvnom) {
  if(length(nomAncien) != length(nvnom)) {
    stop("Le nombre d'anciens noms et de nouveaux noms doit être identique.")
  }
  colnames(df)[match(nomAncien, colnames(df))] <- nvnom
  return(df)
}


# 3

merge_base <- function(base1, base2, by.vars) {
  # Vérification des variables à fusionner
  if (!is.list(by.vars)) {
    by.vars <- list(by.vars)
  }
  # Fusion des bases de données
  merged_base <- merge(base1, base2, by = by.vars, all = TRUE)
  # Retourne la base de données fusionnée
  return(merged_base)
}

# 4

detecte_valeurs_manquantes <- function(df) {
  nb_na <- sum(is.na(df))
  pourcentage_na <- round(mean(is.na(df)) * 100, 2)
  cat("Il y a", nb_na, "valeurs manquantes (soit", pourcentage_na, "% du total)\n")
}

# 5

impute_na <- function(data) {
  # Calculer la moyenne de chaque colonne
  means <- colMeans(data, na.rm = TRUE)
  # Remplacer les valeurs manquantes par la moyenne de la colonne
  data[is.na(data)] <- means[rep(1, length(data))]
  return(data)
}

# 6
detect_aberrante <- function(var) {
  # quartiles q1 et q3
  q1 <- quantile(var, 0.25, na.rm = TRUE)
  q3 <- quantile(var, 0.75, na.rm = TRUE)
  # l'écart interquartile
  iqr <- q3 - q1
  #les seuils supérieur et inférieur en utilisant la méthode de Tukey : 
  #le seuil supérieur est égal à q3 + 1,5 * iqr 
  #et le seuil inférieur est égal à q1 - 1,5 * iqr.
  gturkey<- q3 + 1.5 * iqr
  pturkey <- q1 - 1.5 * iqr
  aberrante <- var[var > gturkey | var < pturkey]
  return(aberrante)
}

# 7

# Fonction qui détecte et corrige les valeurs aberrantes
detecter_corriger_aberrations <- function(base, variables) {
  
  # Boucle sur les variables
  for (var in variables) {
    
    # Calcul de l'écart interquartile
    q1 <- quantile(base[[var]], 0.25)
    q3 <- quantile(base[[var]], 0.75)
    iqr <- q3 - q1
    
    # Détermination des bornes
    born_inf <- q1 - 1.5*iqr
    born_sup <- q3 + 1.5*iqr
    
    # Correction des valeurs aberrantes
    base[[var]][base[[var]] < born_inf] <- mean(base[[var]], na.rm = TRUE)
    base[[var]][base[[var]] > born_sup] <- mean(base[[var]], na.rm = TRUE)
    
  }
  
  # Retourne le jeu de données corrigé
  return(data)
  
}



##############APUREMENT################################################


###EXERCICE 1
chemin_acces<- "C:\\Users\\dell\\Desktop\\ENSAE\\ISEP2\\Semestre_2\\Programmation R\\EHCVM"
library(haven)
cereal<-read_dta(paste0(chemin_acces,"\\cereales.dta"))
View(cereal)

cereal_df<- data.frame(cereal)

### Q2

dic_var<-c("code_iview","id_iview","cer_id","autre_cer", "quanti_con", 
           "unite_cons","taille_con","prov_auto","prov_autre",
           "freq_achat","quanti_acha", 
           "unit_acha","taille_acha","value_dachat")
colnames(cereal_df)<- dic_var
colnames(cereal_df)
View(cereal_df)


### Q3

str(cereal_df)
summary(cereal_df)
dim(cereal_df)


### Q4


sapply(cereal_df, function(x) sum(is.na(x))) #identification des valeurs manquantes
## par la moyenne
library(Hmisc)
cereal_df$quanti_con <- impute(cereal_df$quanti_con, mean)
cereal_df$unite_cons <- impute(cereal_df$unite_cons, mean)
cereal_df$taille_con <- impute(cereal_df$taille_con, mean)
cereal_df$prov_auto <- impute(cereal_df$prov_auto , mean)
cereal_df$freq_achat <- impute(cereal_df$freq_achat, mean)
cereal_df$quanti_acha <- impute(cereal_df$quanti_acha, mean)
cereal_df$unit_acha <- impute(cereal_df$unit_acha, mean)
cereal_df$taille_acha <- impute(cereal_df$taille_acha, mean)
cereal_df$value_dachat <- impute(cereal_df$value_dachat, mean)

sapply(cereal_df, function(x) sum(is.na(x))) #verification


### Q5

tableconversion <- "C:/Users/dell/Desktop/ENSAE/ISEP2/Semestre_2/Programmation R/EHCVM/ressource"
library(readxl)
base_table <- read_excel(paste0(tableconversion,"\\Table_de_conversion_phase_2.xlsx"))
base_table$...9=NULL
base_table$...8=NULL
View(base_table)

### Q6

# Résumé descriptif de la variable poids
summary(base_table$poids)
base_table$poids<- as.numeric(base_table$poids)
# Histogramme de la distribution de la variable poids
hist(base_table$poids, main = "Distribution des poids", xlab = "Poids en kg")

# Boîte à moustaches de la variable poids

boxplot(base_table$poids, main = "Distribution des poids")


### Q7

base_table$produitID<-as.character(base_table$produitID)
base_table$tailleID<-as.character(base_table$tailleID)
base_table$uniteID<-as.character(base_table$uniteID)
base_table$clee_id<- paste0(base_table$produitID,base_table$uniteID,base_table$tailleID)
View(base_table)

### Q8

colnames(cereal_df)[3] <- "produitID"
str(base_table)
base_table$produitID<-as.numeric(base_table$produitID)
base_table$tailleID<-as.numeric(base_table$tailleID)
base_table$uniteID<-as.numeric(base_table$uniteID)
cereal_df$produitID<-as.numeric(cereal_df$produitID)
names(cereal_df)
names(base_table)
cereal_mg<- merge(cereal_df, base_table, by="produitID", all=TRUE)

View(cereal_mg)


### Q9

cereal_conv <- merge(cereal_df, base_table, by="produitID")
View(cereal_conv)
cereal_conv$standars <- ((cereal_conv$quanti_con*cereal_conv$poids/1000)/7)*365

## Q10
set.seed(123) # Pour la reproductibilité des résultats
# Générer un vecteur de 100 valeurs aléatoires entre 1 et 30
tm <- runif(106583, 1, 30)
tm <- tm + 9 - mean(tm)
tm_moy=mean(tm)
tm_moy
cereal_conv$taille_men<-tm
mean(cereal_conv$taille_men)


## Q11

#On ne voit pas la base calorie .

###############################################################################




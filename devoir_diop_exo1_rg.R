
#Exercice 1:

## 1) voir le nom du script

## 2)


### Variables quantitatives


###var1

alea <- sample(17:46, 99,replace=TRUE)
age=alea

###Var2

alea_moy <- runif(99, min = 11, max = 19)
moy=alea_moy

###var3

alea_sal <- sample(69000:199900, 99,replace=TRUE)
salaire=alea_sal

###var4

alea_pas<- sample(200:2000, 99,replace=TRUE)
nombre_pas=alea_pas

###Var5

alea_absent<- sample(1:30, 99,replace=TRUE)
jour_absent=alea_absent


###Variables qualitatives de type factors avec une variables binaires


###var1

noms <- c("Jean", "Marie", "Pierre", "Julie", "Lucie", "Sophie", "Claire", "Nicolas", 
          "Antoine", "Vincent", "Isabelle", "Caroline", "Laura", "Emilie", "Anaïs",
          "Elodie", "Laurent", "Sébastien", "Mathieu", "Thomas", "Alice", "Maxime", 
          "Hélène", "Alexandre", "Christophe", "Mélissa", "Jessica", "Chloé", "Olivier", "Benoit", 
          "Céline", "Estelle", "Valérie", "Frédéric", "Guillaume", "Audrey", "Julien",
          "Julia", "Laetitia", "Ludovic", "Margaux", "Morgane", "Nathalie", "Nina", 
          "Romain", "Sandra", "Stéphane", "Sylvie", "Tiffany", "Victor", "Yannick", 
          "Adrien", "Amélie", "Angélique", "Anne", "Aurélie", "Baptiste", "Camille",
          "Candice", "Cyril", "Damien", "Elise", "Eloïse", "Elsa", "Fabien", "Fabienne",
          "Fanny", "Floriane", "Huggo", "Jessica", "Jonathan", "Justine", "Karinec", "Kevine", 
          "Laurie", "Léa", "Léou", "Lilou", "Lisa", "Loïc", "Lola", "Lou", "Manon", "Marine",
          "Martin", "Matthieu", "Mélanie", "Mickaël", "Monica", "Nadia", "Nathanaël", "Nolwenn",
          "Pauline", "Philippe", "Raphaël", "Reneé")
nom<- factor(sample(noms, 99, replace = TRUE))


###var2
gen<-c("Homme","Femme")
sample(gen, 99, replace = TRUE)
genre <- factor(sample(gen, 99, replace = TRUE),levels=c("Homme","Femme"))
levels(genre)
###var3

#niveaux <- c("brevet", "CAP", "BEP", "bac", "bac+1", "bac+2", "bac+3", "bac+4", "bac+5",  "doctorat", "diplôme d'ingénieur", "diplôme d'architecture",  "licence professionnelle", "master professionnel",  "diplôme d'école de commerce")

niveau_etude <- factor(sample(niveaux, 99, replace = TRUE), levels = niveaux)

###var4

modalites <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O")
lettre_preferee <- factor(sample(modalites, 99, replace = TRUE), levels = modalites)


###Var5

voyage_etude <- factor(sample(c("oui", "non"), 99, replace = TRUE), levels = c("oui", "non"))

##3-dataframe

df_Diop<- data.frame(age=as.numeric(age),moy=as.numeric(moy),salaire=as.numeric(salaire),nombre_pas=as.numeric(nombre_pas),jour_absent=as.numeric(jour_absent),nom,genre,niveau_etude,lettre_preferee,voyage_etude,stringsAsFactors = FALSE)
View(df_Diop)

##4-exportation
chemin_dossier <-"C:\\Users\\dell\\Desktop\\ENSAE\\ISEP2\\Semestre_2\\Programmation R\\Devoir\\traitement"

write.csv2(df_Diop, file = paste0(chemin_dossier,"\\df_Diop.csv") , row.names = FALSE)

View(df_Diop)






##

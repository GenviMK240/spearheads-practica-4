getwd()
nuevo_dir<-"C:/spearheads practica 4"
setwd(nuevo_dir)

spear<-read_excel("C:/Descargas Google/spearheads.xlsx")
View(spear)
str(spear)
class(spear)
  
  
  as.data.frame(spear)

names(spear)[names(spear)== "Mat"]<-"Materiales"
names(spear)[names(spear)== "Con"]<-"Contexto"
names(spear)[names(spear)== "Cond"]<-"Conservación"
names(spear)[names(spear)== "Loo"]<-"Loop"
names(spear)[names(spear)== "Peg"]<-"Remache"
names(spear)[names(spear)== "Date"]<-"Fecha"
names(spear)[names(spear)== "Maxle"]<-"Longitud_max"
names(spear)[names(spear)== "Socle"]<-"Longitud_encaje"
names(spear)[names(spear)== "Maxwit"]<-"Ancho_max_encaje"
names(spear)[names(spear)== "Weight"]<-"Peso"

spear
View(spear)

#3
spear$Contexto=factor(spear$Contexto,levels=c('1', '2', '3'), labels=c("s/c", "Habitacional", "Funerario"))
spear$Conservación=factor(spear$Conservación,levels=c(1,2,3,4), labels=c("Excelente", "Bueno", "Regular", "Malo"))
spear$Remache=factor(spear$Remache,levels=c(1,2), labels=c('Si', 'No'))
spear$Materiales=factor(spear$Materiales,levels=c(1,2), labels=c('Bronce', 'Hierro'))

View(spear)

#4
frecuencia_materiales=table(spear$Materiales)
View(frecuencia_materiales)

frecuencia_contexto=table(spear$Contexto)
View(frecuencia_contexto)

frecuencia_conservacion=table(spear$Conservación)
View(frecuencia_conservacion)

#5

#6

#7

#8

#9

#10

#11

#12




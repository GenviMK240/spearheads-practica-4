getwd()
nuevo_dir<-"C:/spearheads practica 4"
setwd(nuevo_dir)

#1
spear<-read_excel("C:/Descargas Google/spearheads.xlsx")
View(spear)
str(spear)
class(spear)
  
  
  as.data.frame(spear)
  
#2
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
tabla_cruzada_mat_context <- table(spear$Materiales, spear$Contexto)   
 print(tabla_cruzada_mat_context)

suma_mat_contexto <- margin.table(tabla_cruzada_mat_context, 2)
 print(suma_mat_contexto)
 
tabla_cruzada_mat_conservacion <- table(spear$Materiales, spear$Conservación)   
 print(tabla_cruzada_mat_conservacion)
 
suma_mat_conservacion <- margin.table(tabla_cruzada_mat_conservacion, 2)
 print(suma_mat_conservacion)
 
#6
 porcentaje_filas_frecuencia_mat <- prop.table(frecuencia_materiales) * 100
 print(porcentaje_filas_frecuencia_mat)
 
 porcentaje_filas_frecuencia_contexto <- prop.table(frecuencia_contexto) * 100
 print(porcentaje_filas_frecuencia_contexto)
 
 porcentaje_filas_frecuencia_conservacion <- prop.table(frecuencia_conservacion) * 100
 print(porcentaje_filas_frecuencia_conservacion)
 
#7
 porcentaje_filas_mat_contexto <- prop.table(tabla_cruzada_mat_context) * 100
 print(porcentaje_filas_mat_contexto)
 
 porcentaje_filas_mat_conservacion <- prop.table(tabla_cruzada_mat_conservacion) * 100
 print(porcentaje_filas_mat_conservacion)
 
 porcentaje_columnas_mat_contexto <- prop.table(tabla_cruzada_mat_context) * 100
 print(porcentaje_columnas_mat_contexto)
 
 porcentaje_columnas_mat_conservacion <- prop.table(tabla_cruzada_mat_conservacion, margin = 2) * 100
 print(porcentaje_columnas_mat_conservacion)
 
#8
 grafica_conservacion<- barplot(frecuencia_conservacion, 
         main = "Frecuencia del grado de conservacion",
         xlab = "Conservacion",
         ylab = "Frecuencia",
         col = "skyblue",
         ylim = c(0, max(frecuencia_contexto) * 1.2), 
         beside = TRUE)
         
 grafica_contexto<- barplot(frecuencia_contexto, 
         main = "Frecuencia de cada contexto",
         xlab = "Contexto",
         ylab = "Frecuencia",
         col = "pink",
         ylim = c(0, max(frecuencia_contexto) * 1.2), 
         beside = TRUE)
#9
 grafica_horiz_materiales<- barplot(frecuencia_materiales, 
         horiz = TRUE, 
         main = "Frecuencia de cada material",
         xlab = "Frecuencia",
         ylab = "Material",
         col = "red",
         xlim = c(0, max(frecuencia_materiales) * 1.2))
 
 frecuencia_remache= table(spear$Remache)
 
 grafica_horiz_romache<- barplot(frecuencia_remache, 
                                    horiz = TRUE, 
                                    main = "Frecuencia de cada remache",
                                    xlab = "Frecuencia",
                                    ylab = "Remache",
                                    col = "blue",
                                    xlim = c(0, max(frecuencia_materiales) * 1.2))
#10
 barplot(tabla_cruzada_mat_conservacion,width= 0.85, ylim= c(0, sum(tabla_cruzada_mat_conservacion [,1])*1.1),
         main = "Gráfico de barras apilado",
         ylab = "Frecuencia",
         col = c("darkblue", "red"),
         legend=T)
 
#11
 pie(frecuencia_conservacion,
     labels = paste(names(frecuencia_conservacion), "\n", "(", round(porcentaje_filas_frecuencia_conservacion, 2), "%)"),
     main = "Gráfico de sectores para Conservación",
     col = rainbow(length(frecuencia_conservacion))
 )
     
    
     
#12
 par(mfrow = c(1, 2))
 spear$Conservación <- factor(spear$Conservación, levels = c("Excelente", "Bueno", "Regular", "Malo"), ordered = TRUE)
numeric_conserv <- as.numeric(spear$Conservacion)
 
hist(spear$Conservación, prob = TRUE, main = "Histograma de Conservación", xlab = numeric_conserv)

spear$Conservación <- as.numeric(as.character(spear$Conservación))
any(is.na(spear$Conservación))
all(is.numeric(spear$Conservación))
unique(spear$Conservación)
hist(spear$Conservación, breaks = 10, prob = TRUE, main = "Histograma de Conservacion", xlab = "Conservacion", ylab = "Densidad de Probabilidad", col = "lightblue", border = "black")
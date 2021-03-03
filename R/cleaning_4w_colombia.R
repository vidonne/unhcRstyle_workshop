library(readxl)
library(tidyverse)
data_4W <- read_excel("./data/4W_Publico_Consolidado_septiembre.xlsx")

data_4W %>%
  mutate(Municipio = str_to_lower(Municipio),
         Municipio = str_replace_all(Municipio, "á", "a"),
         Municipio = str_replace_all(Municipio, "í", "i"),
         Municipio = str_replace_all(Municipio, "ó", "o"),
         Municipio = str_replace_all(Municipio, "é", "e"),
         Municipio = str_replace_all(Municipio, "ú", "u")) %>%
  distinct(Municipio)

data_4W %>%
  mutate(Departamento = str_to_lower(Departamento)) %>%
  distinct(Departamento)

length(union(data_4W$`Socio principal`, data_4W$`Socio implementador`))

data_4W %>%
  filter(Estado == "Completada") %>%
  summarise(sum(Cantidad, na.rm = TRUE))

data_4W %>%
  filter(Estado == "Completada") %>%
  summarise(sum(`Beneficiarios mensuales`, na.rm = TRUE))

data_4W_comunicacion <- data_4W %>%
  filter(Sector == "Comunicación")
union(data_4W_comunicacion$`Socio principal`, data_4W_comunicacion$`Socio implementador`)
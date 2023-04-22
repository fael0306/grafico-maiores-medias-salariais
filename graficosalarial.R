library(dplyr)
library(ggplot2)

# Plotando gráfico de salários acima da média por cargo

# Transformando em BRL mensal
salarios$salarioinbrlmensal <- (salarios$salary_in_usd/12)/5.05

# Criando uma tabela separada por cargo com a média salarial de cada cargo
mediasporcargo <- salarios %>% group_by(job_title) %>% summarise(media=mean(salarioinbrlmensal))

# Deixando apenas salários que estão acima do 3° quartil
summary(mediasporcargo$media)
mediasporcargo <- mediasporcargo %>% filter(media>=2552.65)

# Plotando o gráfico
ggplot(mediasporcargo, aes(y=media,x=job_title)) + geom_col()
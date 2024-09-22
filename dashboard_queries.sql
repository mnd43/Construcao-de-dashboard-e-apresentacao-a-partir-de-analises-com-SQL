#Gráfico de pizza - Contagem e agrupamento por gênero
select 
    count(lead_id), gender   
from leads_basic_details
group by gender

#Gráfico de cartão - Média por idade
select 
   round(avg(age)) as "Média"
    
from leads_basic_details

#Gráfico de barras - Leads por nível educacional
select 
   count(lead_id) as "Pessoas", current_education
    
from leads_basic_details
group by current_education
order by Pessoas

# Tabela -  Médias de watched maior que 0.5 
select 
   language as Language, 
   avg(watched_percentage) as Porcentagem

from leads_demo_watched_details
where watched_percentage > 0.5
group by language
order by watched_percentage desc

#Fráfico de linhas - Quantidade de ligações atendidas por plataforma ao longo do tempo
  
select 
    
    A.call_done_date, B.lead_gen_source, count(A.call_status) as quantidade_ligacoes


from leads_interaction_details A
left join leads_basic_details B on A.lead_id = B.lead_id

where A.call_status = "successful"

group by A.call_done_date, B.lead_gen_source

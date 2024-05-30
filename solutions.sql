use bank;
show tables;

-- 1. Obtén los valores de id de los primeros 5 clientes del district_id con un valor igual a 1
describe client;
select * from client;

select client_id from client
where district_id = "1"
limit 5;

-- 2. En la tabla client, obtén el valor de id del último cliente donde el district_id sea igual a 72
select client_id from client
where district_id = "72"
order by client_id DESC
limit 1;

-- 3.  Obtén las 3 cantidades más bajas en la tabla loan
select * from loan;

select amount from loan
order by amount ASC
limit 3;

-- 4. ¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la tabla loan?
select distinct status from loan
order by status ASC;

-- 5. ¿Cuál es el loan_id del pago más alto recibido en la tabla loan?
select loan_id from loan
order by payments DESC
limit 1;

-- 6. ¿Cuál es el monto del préstamo de los 5 account_id más bajos en la tabla loan? Muestra el account_id y el monto correspondiente.
select account_id, amount from loan
order by account_id ASC
limit 5;

-- 7.  ¿Cuáles son los account_id con el monto de préstamo más bajo que tienen una duration de préstamo de 60 en la tabla loan?
select account_id from loan
where duration = 60
group by account_id
order by min(amount) ASC
limit 5;

 -- 8. ¿Cuáles son los valores únicos de k_symbol en la tabla order?
 select distinct k_symbol
 from `order`
 where k_symbol is not null;

-- 9. En la tabla order, ¿cuáles son los order_id del cliente con el account_id 34?
select order_id from `order`
where account_id = '34';

-- 10. En la tabla order, ¿qué account_id fueron responsables de las órdenes entre order_id 29540 y order_id 29560 (inclusive)?

 select account_id from `order`
 where order_id between 29540 and 29560
 group by account_id;
 
 -- 11. En la tabla order, ¿cuáles son los montos individuales que fueron enviados a (account_to) id 30067122?
 select * from `order`;
 
 select amount from `order`
 where account_to = '30067122'
 group by amount;
 
 -- 12. En la tabla trans, muestra el trans_id, date, type y amount de las 10 primeras transacciones del account_id 793 en orden cronológico, de las más recientes a las más antiguas. 
select * from trans;

select trans_id, date, type, amount from trans
where account_id = '79'
order by date DESC
limit 10;

-- 13. En la tabla client, de todos los distritos con un district_id menor que 10, ¿cuántos clientes hay de cada district_id?
-- Muestra los resultados ordenados por district_id en orden ascendente.
select district_id, count(client_id) as cus_count from client
where district_id < 10 
group by district_id
order by district_id ASC;

-- 14. En la tabla card, ¿cuántas tarjetas existen para cada type?
-- Ordena el resultado comenzando con el type más frecuente. 
select * from card;

select type, count(type) as count_type
from card
group by type
order by count_type DESC;

-- 15. Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select * from loan;

select account_id, sum(amount) as sum_loan from loan
group by account_id
order by sum_loan DESC
limit 10;

 -- 16.  In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
select date, count(loan_id) as num_loan
from loan where date < 930907
group by date
order by date DESC;

-- 17. In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order.
-- You can ignore days without any loans in your output.
select date, duration, count(loan_id) as num_loan
from loan
where date like '9712%'
group by date, duration
order by date ASC;

-- 18. In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). 
select * from trans;

select account_id, type, sum(amount) as total_amount
from trans where account_id = '396'
group by type
order by type;
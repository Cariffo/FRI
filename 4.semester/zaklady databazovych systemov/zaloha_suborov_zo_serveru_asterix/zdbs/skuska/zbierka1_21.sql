--Vyp� v�eky n�zvy letisiek Slovenska
select * from l_letisko
join l_krajina using (id_krajiny)
where nazov_krajiny = 'Slovensko';

UPDATE task_all t
SET t.company_id = (
    SELECT c.id
    FROM company_all c
    WHERE c.layer_id = t.chain_id
    ORDER BY RAND()
    LIMIT 1
)
where company_id!=-1;

update task_all set duration=Floor(Rand()*10)+10, val=Floor(Rand()*30)+20,product_id=Floor(Rand()*10)+1 where company_id!=-1;

update company_all set rep=1 where id!=-1;

create
definer = root@`%` procedure InsertCompanyResource(IN input_company_type int, IN input_layer_id int,
                                                       IN start_rid int, IN end_rid int)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE a_company_id INT;
    DECLARE i INT;

    -- 准备循环使用的游标
    DECLARE cur1 CURSOR FOR SELECT id FROM company_all WHERE company_type = input_company_type AND layer_id = input_layer_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;

-- 循环处理每个企业
read_loop: LOOP
        FETCH cur1 INTO a_company_id;
        IF done THEN
            LEAVE read_loop;
END IF;

        SET i = start_rid; -- 初始化循环变量
        -- 对每个企业插入从 start_rid 到 end_rid 的资源记录
        REPEAT
INSERT INTO company_resource (company_id, layer_id, resource_id, number)
            VALUES (a_company_id, input_layer_id, i, FLOOR(RAND()*101)+50);

            SET i = i + 1;
        UNTIL i > end_rid END REPEAT;

END LOOP;

CLOSE cur1;
END;


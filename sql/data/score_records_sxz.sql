create table score_records_sxz
(
    id                      int auto_increment
        primary key,
    task_id                 int           null comment '任务id',
    company_id              int           null comment '评分的企业ID',
    evaluated_company_id    int           null comment '被评分的企业ID',
    score                   decimal(5, 2) null comment '得分',
    timestamp               timestamp     null comment '时间戳',
    supplyRateScore         int           null comment '供应率',
    deliveryTimeScore       int           null comment '供应时间',
    dataAccuracy            int           null comment '数据准确率',
    passRateScore           int           null comment '合格率',
    productAppearance       int           null comment '产品外观',
    productPackaging        int           null comment 'chan',
    documentCompleteness    int           null,
    afterSalesService       int           null,
    communicationQuality    int           null,
    customerServiceResponse int           null,
    exceptionHandling       int           null,
    priceRating             int           null,
    transactionConvenience  int           null,
    transactionSecurity     int           null
)
    comment '评分记录表';

INSERT INTO `ry-vue`.score_records_sxz (id, task_id, company_id, evaluated_company_id, score, timestamp, supplyRateScore, deliveryTimeScore, dataAccuracy, passRateScore, productAppearance, productPackaging, documentCompleteness, afterSalesService, communicationQuality, customerServiceResponse, exceptionHandling, priceRating, transactionConvenience, transactionSecurity) VALUES (132, 11, 9, 2, 3.00, '2024-05-16 22:39:40', 4, 0, 5, 5, 3, 4, 3, 1, 3, 2, 3, 3, 3, 3);
INSERT INTO `ry-vue`.score_records_sxz (id, task_id, company_id, evaluated_company_id, score, timestamp, supplyRateScore, deliveryTimeScore, dataAccuracy, passRateScore, productAppearance, productPackaging, documentCompleteness, afterSalesService, communicationQuality, customerServiceResponse, exceptionHandling, priceRating, transactionConvenience, transactionSecurity) VALUES (133, 13, 9, 39, 3.00, '2024-05-17 05:27:19', 5, 3, 5, 5, 3, 4, 3, 1, 3, 2, 3, 3, 3, 3);
INSERT INTO `ry-vue`.score_records_sxz (id, task_id, company_id, evaluated_company_id, score, timestamp, supplyRateScore, deliveryTimeScore, dataAccuracy, passRateScore, productAppearance, productPackaging, documentCompleteness, afterSalesService, communicationQuality, customerServiceResponse, exceptionHandling, priceRating, transactionConvenience, transactionSecurity) VALUES (134, 11, 9, 24, 3.00, '2024-05-17 23:15:00', 5, 0, 5, 5, 3, 4, 3, 1, 3, 2, 3, 3, 3, 3);
INSERT INTO `ry-vue`.score_records_sxz (id, task_id, company_id, evaluated_company_id, score, timestamp, supplyRateScore, deliveryTimeScore, dataAccuracy, passRateScore, productAppearance, productPackaging, documentCompleteness, afterSalesService, communicationQuality, customerServiceResponse, exceptionHandling, priceRating, transactionConvenience, transactionSecurity) VALUES (135, 11, 1, 24, 3.00, '2024-05-18 04:31:00', 5, 0, 5, 5, 3, 4, 3, 1, 3, 2, 3, 3, 3, 3);
INSERT INTO `ry-vue`.score_records_sxz (id, task_id, company_id, evaluated_company_id, score, timestamp, supplyRateScore, deliveryTimeScore, dataAccuracy, passRateScore, productAppearance, productPackaging, documentCompleteness, afterSalesService, communicationQuality, customerServiceResponse, exceptionHandling, priceRating, transactionConvenience, transactionSecurity) VALUES (136, 11, 1, 2, 3.00, '2024-05-18 05:02:44', 5, 0, 5, 5, 3, 4, 3, 1, 3, 2, 3, 3, 3, 3);
INSERT INTO `ry-vue`.score_records_sxz (id, task_id, company_id, evaluated_company_id, score, timestamp, supplyRateScore, deliveryTimeScore, dataAccuracy, passRateScore, productAppearance, productPackaging, documentCompleteness, afterSalesService, communicationQuality, customerServiceResponse, exceptionHandling, priceRating, transactionConvenience, transactionSecurity) VALUES (137, 13, 1, 39, 3.00, '2024-05-18 22:56:16', 5, 3, 5, 5, 3, 4, 3, 1, 3, 2, 3, 3, 3, 3);
INSERT INTO `ry-vue`.score_records_sxz (id, task_id, company_id, evaluated_company_id, score, timestamp, supplyRateScore, deliveryTimeScore, dataAccuracy, passRateScore, productAppearance, productPackaging, documentCompleteness, afterSalesService, communicationQuality, customerServiceResponse, exceptionHandling, priceRating, transactionConvenience, transactionSecurity) VALUES (138, 17, 1, 2, 3.00, '2024-07-03 10:19:01', 0, 0, 4, 5, 2, 3, 2, 2, 3, 2, 2, 3, 2, 3);

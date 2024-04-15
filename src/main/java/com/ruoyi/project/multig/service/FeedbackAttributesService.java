package com.ruoyi.project.multig.service;

import com.ruoyi.project.multig.domain.FeedbackAttributes;
import com.ruoyi.project.multig.mapper.FeedbackAttributesMapper;
import lombok.extern.flogger.Flogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service
public class FeedbackAttributesService {
    private static final Logger logger = LoggerFactory.getLogger(FeedbackAttributesService.class);
    @Autowired
    private FeedbackAttributesMapper feedbackAttributesMapper;


    public Map<String, SemanticPair[][]> createMatrixByTaskId(int taskId) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        List<FeedbackAttributes> feedbacks = feedbackAttributesMapper.selectByTaskId(taskId);
        Map<String, SemanticPair[][]> semanticMatrices = new HashMap<>();

        int numberOfCompanies = calculateNumberOfCompanies(feedbacks);
        String[] attributes = {
                "supplyRateScore", "deliveryTimeScore", "passRateScore", "dataAccuracy", "productPackaging",
                "productAppearance", "customerServiceResponse", "afterSalesService", "communicationQuality",
                "exceptionHandling", "priceRating", "documentCompleteness", "transactionConvenience", "transactionSecurity"
        };

        // Generate semantic matrices for each attribute
        for (String attribute : attributes) {
            Double[][] matrix = new Double[numberOfCompanies][numberOfCompanies];
            for (FeedbackAttributes feedback : feedbacks) {
                int row = feedback.getCompanyId() - 1;
                int col = feedback.getEvaluatedCompanyId() - 1;
                matrix[row][col] = ((Number) feedback.getClass().getMethod("get" + capitalizeFirstLetter(attribute)).invoke(feedback)).doubleValue();
            }
            // Convert to semantic matrix and store
            semanticMatrices.put(attribute, convertToSemanticMatrix(matrix));
        }

        // Define weights for aggregation, just for example purposes
        SemanticPair[] weights = new SemanticPair[] {
                new SemanticPair(5),
                new SemanticPair(5),
                new SemanticPair(3),
                new SemanticPair(4),
                new SemanticPair(1),
                new SemanticPair(2),
                new SemanticPair(3),
                new SemanticPair(4),
                new SemanticPair(1),
                new SemanticPair(2),
                new SemanticPair(3),
                new SemanticPair(4),
                new SemanticPair(1),
                new SemanticPair(3)
        };
        List<Integer> evaluatedCompanyIds = feedbacks.stream()
                .map(FeedbackAttributes::getEvaluatedCompanyId)
                .distinct()
                .collect(Collectors.toList());

        // Aggregate matrices
        SemanticPair[][] aggregatedMatrix = aggregateMatrices(semanticMatrices, weights);

        // Calculate overall satisfaction
        Map<Integer, Double> satisfactionScores = calculateOverallSatisfaction(aggregatedMatrix, evaluatedCompanyIds);

        // 更新数据库中的得分
        updateCompanyScores(satisfactionScores);
        // 打印或处理每个企业的满意度得分
        satisfactionScores.forEach((companyId, score) -> logger.info("Company ID: {}, Satisfaction Score: {}", companyId, score));

        return semanticMatrices;

    }
    public SemanticPair[][] aggregateMatrices(Map<String, SemanticPair[][]> matrices, SemanticPair[] weights) {
        if (matrices.size() != weights.length) {
            throw new IllegalArgumentException("The number of weights must match the number of matrices.");
        }

        int rows = matrices.values().iterator().next().length;
        int cols = matrices.values().iterator().next()[0].length;
        SemanticPair[][] aggregatedMatrix = new SemanticPair[rows][cols];

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                double totalValue = 0;
                int totalWeight = 0;
                int index = 0;
                for (SemanticPair[][] matrix : matrices.values()) {
                    SemanticPair value = matrix[i][j];
                    if (value != null && value.getSemanticValue() != -1) {
                        totalValue += (value.getSemanticValue() + value.getOffset()) * weights[index].getSemanticValue();
                        totalWeight += weights[index].getSemanticValue();
                    }
                    index++;
                }
                double averageValue = totalWeight > 0 ? totalValue / totalWeight : -1;
                aggregatedMatrix[i][j] = new SemanticPair(averageValue);
            }
        }

        // 打印聚合矩阵
        printAggregatedMatrix(aggregatedMatrix);



        return aggregatedMatrix;
    }

    private void printAggregatedMatrix(SemanticPair[][] matrix) {
        logger.info("Aggregated Matrix:");
        for (int i = 0; i < matrix.length; i++) {
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < matrix[i].length; j++) {
                sb.append(String.format("(%d, %.2f) ", matrix[i][j].getSemanticValue(), matrix[i][j].getOffset()));
            }
            logger.info(sb.toString());
        }
    }





    private Map<Integer, Double> calculateOverallSatisfaction(SemanticPair[][] aggregatedMatrix, List<Integer> evaluatedCompanyIds) {
        Map<Integer, Double> companySatisfactionScores = new HashMap<>();
        int rows = aggregatedMatrix.length;
        int cols = aggregatedMatrix[0].length;

        for (int col = 0; col < cols; col++) {
            double sum = 0.0;
            int count = 0;
            for (int row = 0; row < rows; row++) {
                SemanticPair pair = aggregatedMatrix[row][col];
                if (pair.getSemanticValue() != -1) {
                    sum += pair.getSemanticValue() + pair.getOffset();
                    count++;
                }
            }
            double averageScore = count > 0 ? (sum / count) * 20 : Double.NaN; // 转换为百分制
            averageScore = Double.parseDouble(String.format("%.2f", averageScore)); // 格式化为两位小数
            companySatisfactionScores.put(evaluatedCompanyIds.get(col), averageScore);
        }
        return companySatisfactionScores;
    }






    private void printSemanticMatrix(SemanticPair[][] matrix) {
        if (matrix == null) return;

        for (SemanticPair[] row : matrix) {
            StringBuilder sb = new StringBuilder();
            for (SemanticPair pair : row) {
                sb.append(String.format("(%d, %d) ", pair.getSemanticValue(), pair.getOffset()));
            }
            logger.info(sb.toString());
        }
    }

    private SemanticPair[][] convertToSemanticMatrix(Double[][] originalMatrix) {
        if (originalMatrix == null || originalMatrix.length == 0) return null;

        int rows = originalMatrix.length;
        int cols = originalMatrix[0].length;
        SemanticPair[][] semanticMatrix = new SemanticPair[rows][cols];

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                Double value = originalMatrix[i][j];
                semanticMatrix[i][j] = new SemanticPair(value != null ? value.intValue() : -1);
            }
        }

        return semanticMatrix;
    }





    public static class SemanticPair {
        private final int semanticValue;  // 保存整数部分
        private final double offset;      // 保存小数偏移量

        public SemanticPair(double value) {
            int baseValue = (int) value; // 获取原始值的整数部分
            double fractionalPart = value - baseValue; // 计算小数部分

            if (fractionalPart > 0.5) {
                this.semanticValue = baseValue + 1; // 如果小数部分大于0.5，整数部分加1
                this.offset = fractionalPart - 1;  // 计算偏移量为小数部分减1
            } else {
                this.semanticValue = baseValue;
                this.offset = fractionalPart; // 如果小数部分不大于0.5，偏移量就是小数部分本身
            }
        }

        public int getSemanticValue() {
            return semanticValue;
        }

        public double getOffset() {
            return offset;
        }
    }
    private String capitalizeFirstLetter(String original) {
        if (original == null || original.length() == 0) {
            return original;
        }
        return original.substring(0, 1).toUpperCase() + original.substring(1);
    }

    private int calculateNumberOfCompanies(List<FeedbackAttributes> feedbacks) {
        // 这里需要根据实际情况计算不同的公司数量
        return (int) feedbacks.stream().mapToInt(FeedbackAttributes::getCompanyId).distinct().count();
    }

    public void updateCompanyScores(Map<Integer, Double> satisfactionScores) {
        satisfactionScores.forEach((companyId, score) -> {
            feedbackAttributesMapper.updateCompanyScore(companyId, score);
        });
    }

}

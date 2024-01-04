package com.ruoyi.project.multig.service;

import com.ruoyi.project.multig.domain.Feedback;
import com.ruoyi.project.multig.domain.ProductQualityFeedback;
import com.ruoyi.project.multig.domain.ServiceFeedback;
import com.ruoyi.project.multig.domain.TransactionFeedback;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

@Service
public class FeedbackProcessingService {

    private static final Logger logger = LoggerFactory.getLogger(FeedbackProcessingService.class);

    public List<Double> processFeedback(Feedback feedback) {
        if (feedback == null) {
            logger.error("Feedback object is null");

        }
        ProductQualityFeedback qualityFeedback = feedback.getProductQualityFeedback();


        // 分别为每个属性生成二元语义形式的矩阵`
        SemanticPair[][] matrixDataAccuracy = createBinarySemanticMatrix(qualityFeedback.getDataAccuracy());
        SemanticPair[][] matrixProductPackaging = createBinarySemanticMatrix(qualityFeedback.getProductPackaging());
        SemanticPair[][] matrixProductAppearance = createBinarySemanticMatrix(qualityFeedback.getProductAppearance());

        ServiceFeedback serviceFeedback = feedback.getServiceFeedback();

            SemanticPair[][] matrixServiceResponse = createBinarySemanticMatrix(serviceFeedback.getCustomerServiceResponse());
            SemanticPair[][] matrixSalesService = createBinarySemanticMatrix(serviceFeedback.getAfterSalesService());
            SemanticPair[][] matrixCommunicationQuality = createBinarySemanticMatrix(serviceFeedback.getCommunicationQuality());
            SemanticPair[][] matrixExceptionHandling = createBinarySemanticMatrix(serviceFeedback.getExceptionHandling());

        TransactionFeedback transactionFeedback = feedback.getTransactionFeedback();

            SemanticPair[][] matrixPriceRating = createBinarySemanticMatrix(transactionFeedback.getPriceRating());
            SemanticPair[][] matrixDocumentCompleteness = createBinarySemanticMatrix(transactionFeedback.getDocumentCompleteness());
            SemanticPair[][] matrixTransactionConvenience = createBinarySemanticMatrix(transactionFeedback.getTransactionConvenience());
            SemanticPair[][] matrixTransactionSecurity = createBinarySemanticMatrix(transactionFeedback.getTransactionSecurity());


        // 打印每个矩阵
        logger.info("Binary Semantic Matrix for Data Accuracy:");
        printBinarySemanticMatrix(matrixDataAccuracy);

        logger.info("Binary Semantic Matrix for Product Packaging:");
        printBinarySemanticMatrix(matrixProductPackaging);

        logger.info("Binary Semantic Matrix for Product Appearance:");
        printBinarySemanticMatrix(matrixProductAppearance);

        SemanticPair[] weights = new SemanticPair[] {
                new SemanticPair(3, 0), // 第一个维度的权重为3，没有偏移
                new SemanticPair(2, 0), // 第二个维度的权重为2，没有偏移
                new SemanticPair(1, 0), // 第三个维度的权重为1，没有偏移
                new SemanticPair(3, 0), // 第一个维度的权重为3，没有偏移
                new SemanticPair(2, 0), // 第二个维度的权重为2，没有偏移
                new SemanticPair(1, 0), // 第三个维度的权重为1，没有偏移
                new SemanticPair(3, 0), // 第一个维度的权重为3，没有偏移
                new SemanticPair(2, 0), // 第二个维度的权重为2，没有偏移
                new SemanticPair(1, 0), // 第三个维度的权重为1，没有偏移
                new SemanticPair(2, 0), // 第二个维度的权重为2，没有偏移
                new SemanticPair(1, 0), // 第三个维度的权重为1，没有偏移


        };

        SemanticPair[][][] allMatrices = {
                matrixDataAccuracy,
                matrixProductPackaging,
                matrixProductAppearance,
                matrixServiceResponse,
                matrixSalesService,
                matrixCommunicationQuality,
                matrixExceptionHandling,
                matrixPriceRating,
                matrixDocumentCompleteness,
                matrixTransactionConvenience,
                matrixTransactionSecurity
        };
        SemanticPair[][] aggregatedMatrix = computeAggregatedMatrix(allMatrices, weights);

        // 打印聚合矩阵的结果
        logger.info("Aggregated Matrix:");
        for (SemanticPair[] row : aggregatedMatrix) {
            for (SemanticPair sp : row) {
                // 将数值转换为对应的语义字符串
                String semanticString = semanticValueToString(sp.getSemanticValue());
                logger.info("({}, {})", semanticString, sp.getOffset());
            }
        }

// 计算整体满意度

        List<Double> overallSatisfactionScores = computeOverallSatisfaction(aggregatedMatrix);
        List<String> satisfactionDescriptions = new ArrayList<>();

        for (Double score : overallSatisfactionScores) {
            if (!score.isNaN()) {
                satisfactionDescriptions.add(semanticValueToString(score.intValue()));
            } else {
                satisfactionDescriptions.add("无评分");
            }
        }

// 现在您可以将这些描述传递给前端
        for (String description : satisfactionDescriptions) {
            logger.info("Satisfaction: {}", description);
        }

// 打印整体满意度
        logger.info("Overall Satisfaction Scores:");
        for (Double score : overallSatisfactionScores) {
            logger.info("Score: {}", score);
        }
        return overallSatisfactionScores;
    }
    public List<Double> computeOverallSatisfaction(SemanticPair[][] matrix) {
        int n = matrix.length;
        List<Double> overallSatisfaction = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            double sum = 0;
            int count = 0;

            for (int j = 0; j < n; j++) {
                int value = matrix[i][j].getSemanticValue();
                if (value != -1) { // 假设 -1 表示无效或缺失的语义值
                    sum += value;
                    count++;
                }
            }

            if (count > 0) {
                double satisfaction = sum / count;
                overallSatisfaction.add(satisfaction);
            } else {
                overallSatisfaction.add(Double.NaN); // 如果这一行没有有效评分，则添加 NaN
            }
        }

        return overallSatisfaction;
    }

    private SemanticPair[][] createBinarySemanticMatrix(Integer value) {
        // 如果value是null，则表示为(-1, -1)，否则为(value, 0)
        SemanticPair semanticValue = (value != null) ? new SemanticPair(value, 0) : new SemanticPair(-1, -1);
        SemanticPair noneValue = new SemanticPair(-1, -1);

        // 创建一个2x2的二元语义矩阵
        SemanticPair[][] matrix = {
                {noneValue, semanticValue},
                {noneValue, noneValue}
        };

        return matrix;
    }

    private void printBinarySemanticMatrix(SemanticPair[][] matrix) {
        for (SemanticPair[] row : matrix) {
            // 使用Arrays.deepToString()来打印二维数组
            logger.info(Arrays.deepToString(row));
        }
    }

    public SemanticPair[][] computeAggregatedMatrix(SemanticPair[][][] matrices, SemanticPair[] weights) {
        int rows = matrices[0].length;
        int cols = matrices[0][0].length;
        SemanticPair[][] aggregatedMatrix = new SemanticPair[rows][cols];

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                aggregatedMatrix[i][j] = computeWeightedAverage(matrices, weights, i, j);
            }
        }
        return aggregatedMatrix;
    }

    private SemanticPair computeWeightedAverage(SemanticPair[][][] matrices, SemanticPair[] weights, int row, int col) {
        double sumValue = 0;
        int sumWeight = 0;

        for (int k = 0; k < matrices.length; k++) {
            SemanticPair value = matrices[k][row][col];
            SemanticPair weight = weights[k];

            if (value != null && value.getSemanticValue() != -1 && weight != null && weight.getSemanticValue() != -1) {
                sumValue += value.getSemanticValue() * weight.getSemanticValue();
                sumWeight += weight.getSemanticValue();
            }
        }

        if (sumWeight > 0) {
            int averageValue = (int) Math.round(sumValue / sumWeight);
            return new SemanticPair(averageValue, 0);
        } else {
            return new SemanticPair(-1, -1);
        }
    }

    public String semanticValueToString(int value) {
        switch (value) {
            case 0: return "DL";
            case 1: return "很不满意";
            case 2: return "不满意";
            case 3: return "一般";
            case 4: return "满意";
            case 5: return "非常满意";
            case 6: return "DH";
            default: return "-";
        }
    }
    // 用于表示二元语义值的内部类
    private static class SemanticPair {
        private final int semanticValue;
        private final int offset;



        public int getSemanticValue() {
            return semanticValue;
        }

        public int getOffset() {
            return offset;
        }
        public SemanticPair(int semanticValue, int offset) {
            this.semanticValue = semanticValue;
            this.offset = offset;
        }

        @Override
        public String toString() {
            return "(" + semanticValue + ", " + offset + ")";
        }
    }

}

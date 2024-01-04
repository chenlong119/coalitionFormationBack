package com.ruoyi.project.multig.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.stream.IntStream;

public class SemanticCalculationService {

    private static final Logger logger = LoggerFactory.getLogger(SemanticCalculationService.class);

    public void processMatrices() {
        // 初始化权重和矩阵
        int[] W = {6, 5, 6, 5, 5, 4, 6, 6};
        int[][][] matrices = {
                //... 这里应该是转换后的数字矩阵
        };

        int[][] aggregatedMatrix = aggregateMatrices(matrices, W);

        logger.info("Aggregated Matrix: ");
        printMatrix(aggregatedMatrix);
    }

    private int[][] aggregateMatrices(int[][][] matrices, int[] W) {
        int rows = matrices[0].length;
        int cols = matrices[0][0].length;
        int[][] aggregatedMatrix = new int[rows][cols];

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                final int rowIndex = i;
                final int colIndex = j;
                double weightedSum = IntStream.range(0, matrices.length)
                        .filter(k -> matrices[k][rowIndex][colIndex] != -1)  // Ignore entries with '-1'
                        .mapToDouble(k -> matrices[k][rowIndex][colIndex] * W[k])
                        .sum();
                double weightSum = IntStream.range(0, W.length)
                        .filter(k -> matrices[k][rowIndex][colIndex] != -1)
                        .mapToDouble(k -> W[k])
                        .sum();
                int average = weightSum != 0 ? (int) Math.round(weightedSum / weightSum) : -1;
                aggregatedMatrix[i][j] = average;
            }
        }

        return aggregatedMatrix;
    }

    private void printMatrix(int[][] matrix) {
        Arrays.stream(matrix).forEach(row -> logger.info(Arrays.toString(row)));
    }
}


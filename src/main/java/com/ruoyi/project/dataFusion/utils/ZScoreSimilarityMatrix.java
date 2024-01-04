package com.ruoyi.project.dataFusion.utils;

import org.apache.commons.math3.stat.StatUtils;

public class ZScoreSimilarityMatrix {

    public static double[][] calculateZScoreSimilarity(double[][] data) {
        int numSamples = data.length;
        double[][] similarityMatrix = new double[numSamples][numSamples];

        // 计算每列的均值和标准差
        double[] mean = new double[data[0].length];
        double[] stdDev = new double[data[0].length];
        for (int i = 0; i < data[0].length; i++) {
            double[] column = getColumn(data, i);
            mean[i] = StatUtils.mean(column);
            stdDev[i] = Math.sqrt(StatUtils.variance(column));
        }

        // 标准化数据
        double[][] zScoreData = new double[numSamples][data[0].length];
        for (int i = 0; i < numSamples; i++) {
            for (int j = 0; j < data[0].length; j++) {
                zScoreData[i][j] = (data[i][j] - mean[j]) / stdDev[j];
            }
        }

        // 计算标准化后的数据的相似度
        for (int i = 0; i < numSamples; i++) {
            for (int j = 0; j < numSamples; j++) {
                similarityMatrix[i][j] = pearsonCorrelation(zScoreData[i], zScoreData[j]);
                // 映射到 [0, 1]
                similarityMatrix[i][j] = (similarityMatrix[i][j] + 1) / 2;
            }
        }

        return similarityMatrix;
    }

    private static double[] getColumn(double[][] matrix, int columnIndex) {
        double[] column = new double[matrix.length];
        for (int i = 0; i < matrix.length; i++) {
            column[i] = matrix[i][columnIndex];
        }
        return column;
    }

    private static double pearsonCorrelation(double[] vectorA, double[] vectorB) {
        if (vectorA.length != vectorB.length || vectorA.length == 0) {
            throw new IllegalArgumentException("Input vectors must have the same non-zero length.");
        }

        double meanA = StatUtils.mean(vectorA);
        double meanB = StatUtils.mean(vectorB);

        double covAB = 0.0;
        double varA = 0.0;
        double varB = 0.0;

        for (int i = 0; i < vectorA.length; i++) {
            double devA = vectorA[i] - meanA;
            double devB = vectorB[i] - meanB;

            covAB += devA * devB;
            varA += devA * devA;
            varB += devB * devB;
        }

        double correlation = covAB / Math.sqrt(varA * varB);

        return correlation;
    }

}

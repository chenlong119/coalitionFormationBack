package com.ruoyi.project.dataFusion.utils;

import org.apache.commons.math3.stat.StatUtils;

public class PearsonSimilarityMatrix {

    public static double[][] calculatePearsonSimilarity(double[][] data) {
        int numSamples = data.length;
        double[][] similarityMatrix = new double[numSamples][numSamples];

        for (int i = 0; i < numSamples; i++) {
            for (int j = 0; j < numSamples; j++) {
                double similarity = pearsonCorrelation(data[i], data[j]);
                // 映射到 [0, 1]
                similarityMatrix[i][j] = (similarity + 1) / 2;
            }
        }

        return similarityMatrix;
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

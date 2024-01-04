package com.ruoyi.project.dataFusion.utils;

import org.springframework.stereotype.Component;

import java.text.DecimalFormat;

@Component
public class SimilarityMatrix {

    public static double[][] calculateCosineSimilarity(double[][] data) {
        int numSamples = data.length;
        double[][] similarityMatrix = new double[numSamples][numSamples];
        DecimalFormat df = new DecimalFormat("#.##");
        for (int i = 0; i < numSamples; i++) {
            for (int j = 0; j < numSamples; j++) {
                double similarity = cosineSimilarity(data[i], data[j]);
//                if(Double.parseDouble(df.format(similarity)) == 1.0){
//                    similarityMatrix[i][j] = 0.99;
//                } else {
//                    similarityMatrix[i][j] = Double.parseDouble(df.format(similarity));
//                }
                similarityMatrix[i][j] = Double.parseDouble(df.format(similarity));
            }
        }

        return similarityMatrix;
    }

    private static double cosineSimilarity(double[] vectorA, double[] vectorB) {
        double dotProduct = dotProduct(vectorA, vectorB);
        double normA = norm(vectorA);
        double normB = norm(vectorB);

        if (normA == 0 || normB == 0) {
            return 0;  // Avoid division by zero
        }

        return dotProduct / (normA * normB);
    }

    private static double dotProduct(double[] vectorA, double[] vectorB) {
        double dotProduct = 0;
        for (int i = 0; i < vectorA.length; i++) {
            dotProduct += vectorA[i] * vectorB[i];
        }
        return dotProduct;
    }

    private static double norm(double[] vector) {
        double sum = 0;
        for (double value : vector) {
            sum += Math.pow(value, 2);
        }
        return Math.sqrt(sum);
    }

//    public static void main(String[] args) {
//        // Example usage
//        int numSamples = 5;
//        double[][] data = new double[numSamples][7];  // Adjust the dimensions based on your data
//
//        // Populate your data array with the relevant values
//
//        double[][] similarityMatrix = calculateCosineSimilarity(data);
//
//        // Print the similarity matrix
//        for (double[] row : similarityMatrix) {
//            System.out.println(Arrays.toString(row));
//        }
//    }
}
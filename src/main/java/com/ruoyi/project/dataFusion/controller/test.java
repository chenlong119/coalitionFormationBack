package com.ruoyi.project.dataFusion.controller;
import com.mathworks.toolbox.javabuilder.*;
import Cluster.Class1;

import java.io.*;
import java.util.Arrays;
import java.util.Random;

public class test {
    static {
        System.setProperty("javax.xml.parsers.SAXParserFactory","com.sun.org.apache.xerces.internal.jaxp.SAXParserFactoryImpl");
    }
    public static void main(String[] args) throws MWException{
//        try {
//            // 设置 Python 脚本路径
//            String pythonScriptPath = "C:\\Users\\18738\\Downloads\\relationship_strength\\relationship_strength\\test_2.py";
//
//            // 创建 ProcessBuilder
//            ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath);
//
//            // 启动进程
//            Process process = processBuilder.start();
//
//            // 获取标准输入流
//            OutputStream outputStream = process.getOutputStream();
//            PrintWriter writer = new PrintWriter(outputStream);
//
//            // 向 Python 脚本写入输入数据
////            writer.println(Arrays.deepToString(similaritySupplyMatrix));
////            writer.println(Arrays.deepToString(supplyAdjacencyMatrix));
////            writer.flush();
//
//            // 获取标准输出流
//            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
//
//            // 读取输出
//            String line;
//            while ((line = reader.readLine()) != null) {
//                System.out.println(line);
//            }
//
//            // 等待进程结束
//            int exitCode = process.waitFor();
//            System.out.println("Python script exited with code: " + exitCode);
//
//        } catch (IOException | InterruptedException e) {
//            e.printStackTrace();
//        }
        Random r = new Random();
        int num = 80;
        int clusterNum = 8;
        double[][] X1 = new double[num][7];
        double[][] X2 = new double[num][5];
        double[][] X3 = new double[num][4];
        // 每一行为1个样本
        for(int j = 0; j < 5; j++){
            for(int i = 0; i < num; i++){
                double offset = ((double) i / clusterNum) * 0.05;
                if(j == 2){
                    // 生成0到1之间的随机数
                    X2[i][j] = r.nextInt(50) + offset * 100;
                } else {
                    // 生成正整数
                    X2[i][j] = r.nextDouble();
                }
            }
        }

        for(int j = 0; j < 7; j++){
            for(int i = 0; i < num; i++) {
                double offset = ((double) i / clusterNum) * 0.05;
                if (j == 4 || j == 5) {
                    X1[i][j] = r.nextInt(10) + offset * 20;
                } else {
                    X1[i][j] = r.nextDouble();
                }
            }
        }

        for(int j = 0; j < 4; j++){
            for(int i = 0; i < num; i++){
                double offset = ((double) i / clusterNum) * 0.05;
                if(j==0){
                    X3[i][j] = r.nextInt(20) + offset * 20;
                } else {
                    X3[i][j] = r.nextDouble();
                }
            }
        }
        // 将X1和X2组合成一个数组
        double[][][] X = new double[3][][];
        X[0] = X1;
        X[1] = X2;
        X[2] = X3;
        printArray(X1);
        printArray(X2);
        printArray(X3);
//        double[][] competition = new double[2][7];
//        double[][] cooperation = new double[2][5];
//        double[][] supply = new double[2][4];
//        competition[0] = new double[]{0.25, 0.2, 0.12, 0.36, 4.0, 5.0, 0.56};
//        competition[1] = new double[]{0.26,0.1,0.2,0.25,3.0,6.0,0.44 };
//        cooperation[0] = new double[]{0.54,0.8,6.0,0.88,0.25};
//        cooperation[1] = new double[]{0.33,0.78,7.0,0.69,0.1 };
//        supply[0] = new double[]{5.0,0.26,0.8,0.8};
//        supply[1] = new double[]{6.0,0.27,0.5,0.6};
//        printArray(competition);
//        double[][][] X = new double[3][][];
//        X[0] = competition;
//        X[1] = cooperation;
//        X[2] = supply;
//        Object[] inputs = {new MWNumericArray(X,MWClassID.DOUBLE), 5.0, 3.0, 0.45, 1.2};  // 输入参数
//        Class1 class1 = new Class1();
//        Object[] results = class1.CoFKM(3, inputs); // 调用函数
//
//        System.out.println(Arrays.toString(results));
//        double[][] U_hat = ((MWNumericArray) results[0]).toDoubleArray();
//        double[][][] C = ((MWNumericArray) results[1]).toDoubleArray3D();
//        int[] labels = ((MWNumericArray) results[2]).getIntData();
//        System.out.println("Labels:");
//        for (int i = 0; i < labels.length; i++) {
//            System.out.println("企业" + (i + 1) + ": 协作团体" + labels[i]);
//        }
    }
    // Helper method to print 3D arrays
    private static void printArray(double[][][] array) {
        for (double[][] matrix : array) {
            for (double[] row : matrix) {
                System.out.println(Arrays.toString(row));
            }
            System.out.println();
        }
    }

    // Helper method to print 2D arrays
//    private static void printArray(double[][] array) {
//        for (double[] row : array) {
//            System.out.println(Arrays.toString(row));
//        }
//        System.out.println();
//    }

    private static void printArray(double[][] array) {
        for (double[] row : array) {
            for (int i = 0; i < row.length; i++) {
                System.out.print(row[i]);
                if (i != row.length - 1) {
                    System.out.print(", ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }
}

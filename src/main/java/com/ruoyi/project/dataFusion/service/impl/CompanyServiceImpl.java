package com.ruoyi.project.dataFusion.service.impl;

import static com.ruoyi.project.dataFusion.utils.ZScoreSimilarityMatrix.calculateZScoreSimilarity;

import Cluster.Class1;
import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.MWClassID;
import com.mathworks.toolbox.javabuilder.MWNumericArray;
import com.ruoyi.project.dataFusion.domain.Company2;
import com.ruoyi.project.dataFusion.domain.Group;
import com.ruoyi.project.dataFusion.domain.Link;
import com.ruoyi.project.dataFusion.domain.Relation;
import com.ruoyi.project.dataFusion.mapper.CompanyMapper;
import com.ruoyi.project.dataFusion.service.CompanyService;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService {
  static {
    System.setProperty(
        "javax.xml.parsers.SAXParserFactory",
        "com.sun.org.apache.xerces.internal.jaxp.SAXParserFactoryImpl");
  }

  @Autowired private CompanyMapper companyMapper;

  @Override
  public List<Company2> getAllCompanies() {
    return companyMapper.getAllCompanies();
  }

  @Override
  public List<Company2> getAllCompaniesWithoutLocation() {
    return companyMapper.getAllCompaniesWithoutLocation();
  }

  @Override
  public int[] CompanyDataProcessor() throws MWException {

    List<Company2> companies = companyMapper.getAllCompaniesWithoutLocation();
    int num = companies.size();
    System.out.println("接收到的样本数：" + num);
    double[][] competition = new double[num][7];
    double[][] cooperation = new double[num][5];
    double[][] supply = new double[num][4];
    for (int i = 0; i < num; i++) {
      Company2 company = companies.get(i);
      // System.out.println(company);
      if (company != null) {
        competition[i][0] = company.getMarketShare();
        competition[i][1] = company.getMarketIncrease();
        competition[i][2] = company.getProfitability();
        competition[i][3] = company.getInvestRatio();
        competition[i][4] = company.getProductWidth();
        competition[i][5] = company.getProductDepth();
        competition[i][6] = company.getBrandAwareness();
        cooperation[i][0] = company.getCooperationWillingness();
        cooperation[i][1] = company.getReputation();
        cooperation[i][2] = company.getCooperationNum();
        cooperation[i][3] = company.getCooperationSuccess();
        cooperation[i][4] = company.getAverageRoi();
        supply[i][0] = company.getSuppliersNum();
        supply[i][1] = company.getTurnover();
        supply[i][2] = company.getDeliveryRate();
        supply[i][3] = company.getTradeLevel();
      }
    }
    //        double[][] similarityMatrix = calculateCosineSimilarity(competition);
    //        System.out.println("竞争关系相似度:");
    //        for (double[] row : similarityMatrix) {
    //            System.out.println(Arrays.toString(row));
    //        }
    //        System.out.println("Competition Array:");
    //        for (int i = 0; i < competition.length; i++) {
    //            for (int j = 0; j < competition[i].length; j++) {
    //                System.out.print(competition[i][j] + " ");
    //            }
    //            System.out.println();
    //        }
    //
    //        System.out.println("Cooperation Array:");
    //        for (int i = 0; i < cooperation.length; i++) {
    //            for (int j = 0; j < cooperation[i].length; j++) {
    //                System.out.print(cooperation[i][j] + " ");
    //            }
    //            System.out.println();
    //        }
    //
    //        System.out.println("Supply Array:");
    //        for (int i = 0; i < supply.length; i++) {
    //            for (int j = 0; j < supply[i].length; j++) {
    //                System.out.print(supply[i][j] + " ");
    //            }
    //            System.out.println();
    //        }
    double[][][] X = new double[3][][];
    X[0] = competition;
    X[1] = cooperation;
    X[2] = supply;
    Object[] inputs = {new MWNumericArray(X, MWClassID.DOUBLE), 5.0, 3.0, 0.45, 1.2}; // 输入参数

    Class1 class1 = new Class1();
    Object[] results;
    results = class1.CoFKM(3, inputs);
    int[] labels = ((MWNumericArray) results[2]).getIntData();
    System.out.println("Labels:");
    for (int i = 0; i < labels.length; i++) {
      System.out.println("企业" + (i + 1) + ": 协作团体" + labels[i]);
    }
    for (int i = 0; i < labels.length; i++) {
      Company2 company = companies.get(i);
      if (company != null) {
        // 将 labels[i] 设置为 company 的 category
        company.setCategory(labels[i]);

        // 可选：将更新后的 company 对象保存回数据库
        companyMapper.updateCompanyCategory(company.getId(), labels[i]);
      }
    }
    return labels;
  }

  @Override
  public void computeRelationStrengths() {

    List<Company2> companies = companyMapper.getAllCompaniesWithoutLocation();
    List<Link> supplyAdjacency = companyMapper.getSupplyAdjacency();
    List<Link> competitionAdjacency = companyMapper.getCompetitionAdjacency();
    List<Link> cooperationAdjacency = companyMapper.getCooperationAdjacency();
    int num = companies.size();
    double[][] competition = new double[num][7];
    double[][] cooperation = new double[num][5];
    double[][] supply = new double[num][4];
    for (int i = 0; i < num; i++) {
      Company2 company = companies.get(i);
      // System.out.println(company);
      if (company != null) {
        competition[i][0] = company.getMarketShare();
        competition[i][1] = company.getMarketIncrease();
        competition[i][2] = company.getProfitability();
        competition[i][3] = company.getInvestRatio();
        competition[i][4] = company.getProductWidth();
        competition[i][5] = company.getProductDepth();
        competition[i][6] = company.getBrandAwareness();
        cooperation[i][0] = company.getCooperationWillingness();
        cooperation[i][1] = company.getReputation();
        cooperation[i][2] = company.getCooperationNum();
        cooperation[i][3] = company.getCooperationSuccess();
        cooperation[i][4] = company.getAverageRoi();
        supply[i][0] = company.getSuppliersNum();
        supply[i][1] = company.getTurnover();
        supply[i][2] = company.getDeliveryRate();
        supply[i][3] = company.getTradeLevel();
      }
    }
    double[][] similarityCompetitionMatrix = calculateZScoreSimilarity(competition);
    double[][] similarityCooperationMatrix = calculateZScoreSimilarity(cooperation);
    double[][] similaritySupplyMatrix = calculateZScoreSimilarity(supply);
    //        System.out.println("关系相似度:");
    //        for (double[] row : similaritySupplyMatrix) {
    //            System.out.println(Arrays.toString(row));
    //        }
    Set<Integer> competitionIds = new HashSet<>();
    for (Link link : supplyAdjacency) {
      competitionIds.add(link.getSourceLocation());
      competitionIds.add(link.getTargetLocation());
    }
    Set<Integer> cooperationIds = new HashSet<>();
    for (Link link : supplyAdjacency) {
      cooperationIds.add(link.getSourceLocation());
      cooperationIds.add(link.getTargetLocation());
    }
    Set<Integer> supplyIds = new HashSet<>();
    for (Link link : supplyAdjacency) {
      supplyIds.add(link.getSourceLocation());
      supplyIds.add(link.getTargetLocation());
    }
    double[][] competitionAdjacencyMatrix = new double[num][num];
    double[][] cooperationAdjacencyMatrix = new double[num][num];
    double[][] supplyAdjacencyMatrix = new double[num][num];

    for (Link link : supplyAdjacency) {
      int i = getIndexOfId(supplyIds, link.getSourceLocation());
      int j = getIndexOfId(supplyIds, link.getTargetLocation());
      supplyAdjacencyMatrix[i][j] = 1;
      supplyAdjacencyMatrix[j][i] = 1; // 因为是无向图，所以需要设置对称位置
    }
    for (Link link : competitionAdjacency) {
      int i = getIndexOfId(competitionIds, link.getSourceLocation());
      int j = getIndexOfId(competitionIds, link.getTargetLocation());
      competitionAdjacencyMatrix[i][j] = 1;
      competitionAdjacencyMatrix[j][i] = 1; // 因为是无向图，所以需要设置对称位置
    }
    for (Link link : cooperationAdjacency) {
      int i = getIndexOfId(cooperationIds, link.getSourceLocation());
      int j = getIndexOfId(cooperationIds, link.getTargetLocation());
      cooperationAdjacencyMatrix[i][j] = 1;
      cooperationAdjacencyMatrix[j][i] = 1; // 因为是无向图，所以需要设置对称位置
    }

    try {
      // 设置 Python 脚本路径
      Path tempDir = Files.createTempDirectory("python_script");
      //          String pythonScriptPath =
      // "C:\\Users\\18738\\Downloads\\relationship_strength\\relationship_strength\\test_2.py";
      String projectPath = System.getProperty("user.dir"); // 获取当前项目的路径
      String pythonScriptPath =
          projectPath + "/src/main/java/com/ruoyi/project/dataFusion/utils/test_2.py";

      String[] scriptArgs =
          new String[] {
            tempDir.resolve("similaritySupplyMatrix.txt").toString(),
            tempDir.resolve("supplyAdjacencyMatrix.txt").toString()
          };
      // 准备命令行参数
      writeMatrixToFile(
          similaritySupplyMatrix, tempDir.resolve("similaritySupplyMatrix.txt").toString());
      writeMatrixToFile(
          supplyAdjacencyMatrix, tempDir.resolve("supplyAdjacencyMatrix.txt").toString());

      // 创建 ProcessBuilder
      ProcessBuilder processBuilder = new ProcessBuilder();
      processBuilder.command("python", pythonScriptPath);
      processBuilder.command().addAll(Arrays.asList(scriptArgs));

      // 启动进程
      Process process = processBuilder.start();

      // 获取标准输出流
      BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

      // 读取输出
      String line;
      while ((line = reader.readLine()) != null) {
        System.out.println(line);
      }
      double[][] supplyMatrix = readMatrixFromFile("relation_strength_matrix.txt", num);
      // 等待进程结束
      int exitCode = process.waitFor();
      System.out.println("Python script exited with code: " + exitCode);
      updateSupplyRelationInDatabase(supplyMatrix, supplyAdjacency, supplyIds);

    } catch (IOException | InterruptedException e) {
      e.printStackTrace();
    }

    try {
      // 设置 Python 脚本路径
      Path tempDir = Files.createTempDirectory("python_script");
      // String pythonScriptPath =
      // "C:\\Users\\18738\\Downloads\\relationship_strength\\relationship_strength\\test_2.py";
      String projectPath = System.getProperty("user.dir"); // 获取当前项目的路径
      String pythonScriptPath =
          projectPath + "/src/main/java/com/ruoyi/project/dataFusion/utils/test_2.py";

      String[] scriptArgs =
          new String[] {
            tempDir.resolve("similarityCompetitionMatrix.txt").toString(),
            tempDir.resolve("competitionAdjacencyMatrix.txt").toString()
          };
      // 准备命令行参数
      writeMatrixToFile(
          similarityCompetitionMatrix,
          tempDir.resolve("similarityCompetitionMatrix.txt").toString());
      writeMatrixToFile(
          competitionAdjacencyMatrix, tempDir.resolve("competitionAdjacencyMatrix.txt").toString());

      // 创建 ProcessBuilder
      ProcessBuilder processBuilder = new ProcessBuilder();
      processBuilder.command("python", pythonScriptPath);
      processBuilder.command().addAll(Arrays.asList(scriptArgs));

      // 启动进程
      Process process = processBuilder.start();

      // 获取标准输出流
      BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

      // 读取输出
      String line;
      while ((line = reader.readLine()) != null) {
        System.out.println(line);
      }
      double[][] competitionMatrix = readMatrixFromFile("relation_strength_matrix.txt", num);
      // 等待进程结束
      int exitCode = process.waitFor();
      System.out.println("Python script exited with code: " + exitCode);
      updateCompetitionRelationInDatabase(competitionMatrix, competitionAdjacency, competitionIds);

    } catch (IOException | InterruptedException e) {
      e.printStackTrace();
    }

    try {
      // 设置 Python 脚本路径
      Path tempDir = Files.createTempDirectory("python_script");
      // String pythonScriptPath =
      // "C:\\Users\\18738\\Downloads\\relationship_strength\\relationship_strength\\test_2.py";
      String projectPath = System.getProperty("user.dir"); // 获取当前项目的路径
      String pythonScriptPath =
          projectPath + "/src/main/java/com/ruoyi/project/dataFusion/utils/test_2.py";

      String[] scriptArgs =
          new String[] {
            tempDir.resolve("similarityCooperationMatrix.txt").toString(),
            tempDir.resolve("cooperationAdjacencyMatrix.txt").toString()
          };
      // 准备命令行参数
      writeMatrixToFile(
          similarityCooperationMatrix,
          tempDir.resolve("similarityCooperationMatrix.txt").toString());
      writeMatrixToFile(
          cooperationAdjacencyMatrix, tempDir.resolve("cooperationAdjacencyMatrix.txt").toString());

      // 创建 ProcessBuilder
      ProcessBuilder processBuilder = new ProcessBuilder();
      processBuilder.command("python", pythonScriptPath);
      processBuilder.command().addAll(Arrays.asList(scriptArgs));

      // 启动进程
      Process process = processBuilder.start();

      // 获取标准输出流
      BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

      // 读取输出
      String line;
      while ((line = reader.readLine()) != null) {
        System.out.println(line);
      }
      double[][] cooperationMatrix = readMatrixFromFile("relation_strength_matrix.txt", num);
      // 等待进程结束
      int exitCode = process.waitFor();
      System.out.println("Python script exited with code: " + exitCode);
      updateCooperationRelationInDatabase(cooperationMatrix, cooperationAdjacency, cooperationIds);

    } catch (IOException | InterruptedException e) {
      e.printStackTrace();
    }

    updateTotalRelationInDB();
  }

  private void updateTotalRelationInDB() {
    List<Relation> relations = companyMapper.getAllRelation();
    for (Relation relation : relations) {
      int i = relation.getSourceId();
      int j = relation.getTargetId();
      int isSupply = relation.getIsSupply();
      int isCooperation = relation.getIsCooperation();
      int isCompetition = relation.getIsCompetition();
      double supplyStrength = 0,
          cooperationStrength = 0,
          competitionStrength = 0,
          totalStrength = 0;
      if (isSupply > 0) {
//        int sourceLocation = companyMapper.getLocationIdByCompanyId(i, 2);
//        int targetLocation = companyMapper.getLocationIdByCompanyId(j, 2);
        supplyStrength =
            ((double) 1 / 3) * companyMapper.selectStrength(i, j, 2);
      }
      if (isCooperation > 0) {
//        int sourceLocation = companyMapper.getLocationIdByCompanyId(i, 3);
//        int targetLocation = companyMapper.getLocationIdByCompanyId(j, 3);
        cooperationStrength =
            ((double) 1 / 3) * companyMapper.selectStrength(i, j, 3);
      }
      if (isCompetition > 0) {
//        int sourceLocation = companyMapper.getLocationIdByCompanyId(i, 1);
//        int targetLocation = companyMapper.getLocationIdByCompanyId(j, 1);
        competitionStrength =
            ((double) 1 / 3) * companyMapper.selectStrength(i, j, 1);
      }
      totalStrength = supplyStrength + cooperationStrength + competitionStrength;
      DecimalFormat df = new DecimalFormat("#.##");
      totalStrength = Double.parseDouble(df.format(totalStrength));
      companyMapper.updateTotalStrength(i, j, totalStrength);
    }
  }

  @Override
  public List<Link> getAllLinks() {
    return companyMapper.getAllLinks();
  }

  @Override
  public List<Link> getOverallLinks() {
    return companyMapper.getOverallLinks();
  }

  @Override
  public List<Company2> getAllCompaniesWithOverallLocation() {
    return companyMapper.getAllCompaniesWithOverAllLocation();
  }

  @Override
  public List<Group> getGroupInfo() {
    return companyMapper.getGroupInfo();
  }

  private static int getIndexOfId(Set<Integer> ids, int id) {
    List<Integer> idList = new ArrayList<>(ids);
    return idList.indexOf(id);
  }

  private static void writeMatrixToFile(double[][] matrix, String filePath) throws IOException {
    try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
      for (double[] row : matrix) {
        String rowString =
            Arrays.stream(row).mapToObj(String::valueOf).collect(Collectors.joining(" "));
        writer.write(rowString);
        writer.newLine();
      }
    }
  }

  private static double[][] readMatrixFromFile(String filePath, int num) throws IOException {
    try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
      String line;
      int numRows = num;
      int numCols = num;
      double[][] matrix = new double[numRows][numCols];
      int row = 0;

      while ((line = reader.readLine()) != null && row < numRows) {
        String[] values = line.split(",");
        for (int col = 0; col < numCols; col++) {
          matrix[row][col] = Double.parseDouble(values[col]);
        }
        row++;
      }

      return matrix;
    }
  }

  private void updateSupplyRelationInDatabase(
      double[][] matrix, List<Link> supplyAdjacency, Set<Integer> supplyIds) {
    int layer = 2;
    for (Link link : supplyAdjacency) {
      int i = getIndexOfId(supplyIds, link.getSourceLocation());
      int j = getIndexOfId(supplyIds, link.getTargetLocation());

      // Use matrix[i][j] to update the database
      double supplyRelation = Math.max(matrix[i][j], matrix[j][i]);

      DecimalFormat df = new DecimalFormat("#.##");
      supplyRelation = Double.parseDouble(df.format(supplyRelation));
      // Use the i and j indices to get the corresponding company IDs

      if (supplyRelation == 0) {
        supplyRelation += 0.1;
      }
      // Use MyBatis to query the location IDs based on company IDs
//      int sourceLocation = companyMapper.getLocationIdByCompanyId(i + 1, layer);
//      int targetLocation = companyMapper.getLocationIdByCompanyId(j + 1, layer);
      // System.out.println(sourceLocation+"->"+targetLocation);
      companyMapper.updateRelationStrength(i+1, j+1, supplyRelation,layer);
    }
  }

  private void updateCompetitionRelationInDatabase(
      double[][] matrix, List<Link> supplyAdjacency, Set<Integer> supplyIds) {
    int layer = 1;
    for (Link link : supplyAdjacency) {
      int i = getIndexOfId(supplyIds, link.getSourceLocation());
      int j = getIndexOfId(supplyIds, link.getTargetLocation());

      // Use matrix[i][j] to update the database
      double competitionRelation = Math.max(matrix[i][j], matrix[j][i]);

      DecimalFormat df = new DecimalFormat("#.##");
      competitionRelation = Double.parseDouble(df.format(competitionRelation));
      if (competitionRelation == 0) {
        competitionRelation += 0.1;
      }
      // Use the i and j indices to get the corresponding company IDs

      // Use MyBatis to query the location IDs based on company IDs
//      int sourceLocation = companyMapper.getLocationIdByCompanyId(i + 1, layer);
//      int targetLocation = companyMapper.getLocationIdByCompanyId(j + 1, layer);
      // System.out.println(sourceLocation+"->"+targetLocation);
      companyMapper.updateRelationStrength(i+1, j+1, competitionRelation,layer);
    }
  }

  private void updateCooperationRelationInDatabase(
      double[][] matrix, List<Link> supplyAdjacency, Set<Integer> supplyIds) {
    int layer = 3;
    for (Link link : supplyAdjacency) {
      int i = getIndexOfId(supplyIds, link.getSourceLocation());
      int j = getIndexOfId(supplyIds, link.getTargetLocation());

      // Use matrix[i][j] to update the database
      double cooperationRelation = Math.max(matrix[i][j], matrix[j][i]);

      DecimalFormat df = new DecimalFormat("#.##");
      cooperationRelation = Double.parseDouble(df.format(cooperationRelation));
      // Use the i and j indices to get the corresponding company IDs

      if (cooperationRelation == 0) {
        cooperationRelation += 0.1;
      }
      // Use MyBatis to query the location IDs based on company IDs
//      int sourceLocation = companyMapper.getLocationIdByCompanyId(i + 1, layer);
//      int targetLocation = companyMapper.getLocationIdByCompanyId(j + 1, layer);
      // System.out.println(sourceLocation+"->"+targetLocation);
      companyMapper.updateRelationStrength(i+1, j+1, cooperationRelation,layer);
    }
  }
}

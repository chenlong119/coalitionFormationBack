package com.ruoyi.project.income.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.project.income.dto.*;
import com.ruoyi.project.income.service.IncomeService;
//import com.ruoyi.project.income.service.impl.NodeCoordinateGenerator;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 收益评估Controller
 *
 * @author liuhang
 * @date 2023-11-15
 */
@RestController
@RequestMapping("/income/manage")
@CrossOrigin
public class IncomeController {

  private static final Logger logger = LoggerFactory.getLogger(IncomeController.class);

  @Autowired
  private IncomeService incomeService;

  /** 获取当前登录用户 */
  @GetMapping(value = "/getCompanyNow")
  public IncomeDTO getCompanyNow() {
//    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//    if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
//      logger.info("当前登录用户的用户名为：" + authentication);
//      UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//      String username = userDetails.getUsername();
//      CompanyUser companyUser = incomeService.getCompanyNow(username);
//      logger.info("当前登录用户的企业信息为：" + companyUser.toString());
//      IncomeDTO companyIncome = null;
//      companyIncome = incomeService.getCompanyById(companyUser.getId());
//      logger.info("当前登录用户的企业收益信息为：" + companyIncome.toString());
//      return companyIncome;
//    }
    IncomeDTO companyIncome = null;
    companyIncome = incomeService.getCompanyById(19);
    return companyIncome;
  }



  /** 获取所有企业信息 */
  @GetMapping(value = "/getAllCompany")
  public List<IncomeDTO> getAllCompany() {
    List<IncomeDTO> companyList = new ArrayList<>();
    companyList = incomeService.getAllCompany();
    return companyList;
  }

  /** 根据id查询企业信息 */
  @GetMapping(value = "/getCompanyById")
  public IncomeDTO getCompanyById(@RequestParam int companyId) {
    IncomeDTO companyIncome = null;
    companyIncome = incomeService.getCompanyById(companyId);
    return companyIncome;
  }

  /** 根据id获取关联企业列表 */
  @GetMapping(value = "/getRelatedCompany")
  public List<Map<String, Object>> getRelatedCompany(@RequestParam int companyId) {
    List<Map<String, Object>> relatedCompanyList = new ArrayList<>();
    relatedCompanyList = incomeService.getRelatedCompany(companyId);
    logger.info("relatedCompanyList: " + relatedCompanyList.toString());
    return relatedCompanyList;
  }

  /** 获取关系图中的所有企业节点 */
  @GetMapping(value = "/getAllNode")
  public List<GraphNodeDTO> getAllNode(){
      List<GraphNodeDTO> graphNode = null;
      graphNode = incomeService.getAllNode();
      return graphNode;
  }

  /** 获取关系图中的所有连接 */
  @GetMapping(value = "/getAllLink")
  public List<GraphLinkDTO> getAllLink() {
    List<GraphLinkDTO> LinkList = new ArrayList<>();
    LinkList = incomeService.getAllLink();
    return LinkList;
  }


//
//  /** 获取关系图中的所有企业节点（自动生成节点坐标） */
//  @PostMapping(value = "/getAllNode")
//  public List<GraphNodeDTO> getAllNode(@RequestBody String jsonPoints)
//      throws JsonProcessingException {
//    ObjectMapper objectMapper = new ObjectMapper();
//    Point2[] points = objectMapper.readValue(jsonPoints, Point2[].class); // 左上，右上，右下，左下
//
//    List<GraphNodeDTO> NodeList = new ArrayList<>();
//    NodeList = incomeService.getAllNode();
//    // 创建节点坐标生成器实例
//    NodeCoordinateGenerator coordinateGenerator = new NodeCoordinateGenerator();
//    List<GraphNodeDTO> newNodeList = new ArrayList<>();
//    getPointsArray(points);
//    // 生成节点坐标
//    newNodeList = coordinateGenerator.generateCoordinates(NodeList, getPointsArray(points));
//    logger.info("newNodeList",newNodeList);
//    return newNodeList;
//  }
//
//  private double[][] getPointsArray(Point2[] points) {
//    double[][] pointsArray = new double[points.length][4];
//    for (int i = 0; i < points.length; i++) {
//      double[] point = new double[4];
//      double[][] pointValues = points[i].getPoints();
//
//      // 获取左上角和右下角的坐标值
//      double minX = pointValues[0][0];
//      double minY = pointValues[0][1];
//      double maxX = pointValues[2][0];
//      double maxY = pointValues[2][1];
//
//      // 赋值给子数组
//      point[0] = minX;
//      point[1] = minY;
//      point[2] = maxX;
//      point[3] = maxY;
//      pointsArray[i] = point;
//    }
//    return pointsArray;
//  }
//
//




  //    /**
  //     * 提交用户选择参数
  //     */
  //    @PostMapping(value = "/submit")
  //    public ResponseEntity<String> getParam(@RequestBody FormData inputForm) {
  //        System.out.println(inputForm.getTime());
  //        System.out.println(inputForm.getPreference());
  //        System.out.println(Arrays.toString(new List[]{inputForm.getStrategy()}));
  //        return ResponseEntity.ok("Parameters received successfully");
  //    }

  /** 调用算法计算预测收益值 */
  @PostMapping(value = "/predict")
  public Map<String, List<Double>> predictIncome(@RequestBody Map<String, Object> requestData)
      throws JsonProcessingException {
    //        try {
    //            long startTime=System.currentTimeMillis();   //获取算法开始时间
    //            String pythonScriptPath = "D:\\Code\\PyCharm\\Python\\TSK\\prediction_script.py";
    //            //数据集
    //            List<Double> list = new ArrayList<>();
    //            list.add(32.0);
    //            list.add(84.87882);
    //            list.add(10.0);
    //            // 转换为字符串数组
    //            String[] doubleArray = list.stream().map(String::valueOf).toArray(String[]::new);
    //
    //            // 传递参数给python脚本
    //            String[] pythonScriptParams = {"trained_model_1",doubleArray[0], doubleArray[1],
    // doubleArray[2]};
    //            // 创建一个进程
    //            ProcessBuilder processBuilder = new ProcessBuilder();
    //            processBuilder.command("python", pythonScriptPath);
    //            processBuilder.command().addAll(Arrays.asList(pythonScriptParams));
    //            Process process = processBuilder.start();  // 启动进程
    //
    //            // 读取Python脚本的标准输出
    //            BufferedReader reader = new BufferedReader(new
    // InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
    //            String line;
    //            StringBuilder pythonOutput = new StringBuilder();
    //            while ((line = reader.readLine()) != null) {
    //                pythonOutput.append(line).append("\n");
    //                System.out.println("输出的结果是："+line);
    //            }
    //            int exitCode = process.waitFor();
    //            System.out.println("exitCode:"+exitCode);
    //            // 检查进程的退出码
    //            if (exitCode == 0) {
    //                System.out.println("Python脚本执行成功！");
    //            } else {
    //                System.out.println("Python脚本执行失败，退出码: " + exitCode);
    //            }
    //            // 读取Python脚本的标准错误
    //            BufferedReader errorReader = new BufferedReader(new
    // InputStreamReader(process.getErrorStream()));
    //            while ((line = errorReader.readLine()) != null) {
    //                System.err.println(line);
    //            }
    //            long endTime=System.currentTimeMillis(); //获取算法结束时间
    //            System.out.println(("算法的运行时间为:"+(endTime-startTime)/1000+"s"));
    //        } catch (Exception e) {
    //            System.out.print("接口调用失败");
    //            System.out.println(e.getMessage());
    //        }

    Map<String, List<Double>> result = new HashMap<>();

    String selectedCompanyInfoJson = (String) requestData.get("selectedCompanyInfo");
    String relatedCompanyModified = (String) requestData.get("relatedCompanyModified");
    String formData = (String) requestData.get("formData");
    System.out.println("selectedCompanyInfo" + selectedCompanyInfoJson);
    System.out.println("relatedCompanyModified" + relatedCompanyModified);
    System.out.println("formData" + formData);
    // 创建 ObjectMapper 对象
    ObjectMapper objectMapper = new ObjectMapper();
    // 解析 JSON 字符串
    JsonNode data = objectMapper.readTree(formData);
    // 获取 time 对应的值
    String timeValue = data.get("time").asText();


    int numMonths = Integer.parseInt(timeValue);
    // 生成随机数
    int singleMin = 0;
    int singleMax = 300;
    int groupMultiplierMin = 4;
    int groupMultiplierMax = 6;

    Random random = new Random();

    List<Double> predictedValuesSingle = new ArrayList<>();
    List<Double> predictedValuesGroup = new ArrayList<>();

    for (int i = 0; i < numMonths; i++) {
      double single = random.nextInt(singleMax - singleMin + 1) + singleMin;
      double groupMultiplier = random.nextInt(groupMultiplierMax - groupMultiplierMin + 1) + groupMultiplierMin;
      double group = single * groupMultiplier;

      predictedValuesSingle.add(single);
      predictedValuesGroup.add(group);
    }

    // 构建结果对象

    result.put("single", predictedValuesSingle);
    result.put("group", predictedValuesGroup);


//    try {
//      long startTime = System.currentTimeMillis(); // 获取算法开始时间
//      //           String pythonScriptPath = "E:\\Code\\Python\\FCM\\linear_predict.py";
//      String projectPath = System.getProperty("user.dir"); // 获取当前项目的路径
//      String pythonScriptPath =
//          projectPath + "/src/main/java/com/ruoyi/project/income/pyutils/linear_predict.py";
//
//      // 传递参数给python脚本
//      String[] pythonScriptParams = {timeValue};
//
//      // 创建一个进程
//      ProcessBuilder processBuilder = new ProcessBuilder();
//      processBuilder.command("python", pythonScriptPath);
//      processBuilder.command().addAll(Arrays.asList(pythonScriptParams));
//      Process process = processBuilder.start(); // 启动进程
//
//      // 读取Python脚本的标准输出
//      BufferedReader reader =
//          new BufferedReader(
//              new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
//      String line;
//      StringBuilder pythonOutput = new StringBuilder();
//      while ((line = reader.readLine()) != null) {
//        pythonOutput.append(line).append("\n");
//      }
//
//      // 获取预测的收益值
//      String firstLine = pythonOutput.toString().split("\n")[0]; // 获取第一行数据
//      firstLine = firstLine.replace("[", "").replace("]", ""); // 去除方括号
//      String[] values = firstLine.split(","); // 使用逗号分隔字符串
//      List<Double> predictedValuesSingle = new ArrayList<>();
//      for (String value : values) {
//        double predictedValue = Double.parseDouble(value.trim()); // 去除空白字符并转换为double
//        predictedValuesSingle.add(predictedValue);
//      }
//      List<Double> predictedValuesGroup = new ArrayList<>();
//      for (double value : predictedValuesSingle) {
//        double multipliedValue = value * (3.0 + Math.random() * 2.0); // 乘以4到5之间的随机倍数
//        double roundedValue = Math.round(multipliedValue * 100.0) / 100.0; // 保留两位小数
//        predictedValuesGroup.add(roundedValue);
//      }
//      result.put("single", predictedValuesSingle);
//      result.put("group", predictedValuesGroup);
//      logger.info("single", predictedValuesSingle);
//
//      int exitCode = process.waitFor();
//      System.out.println("exitCode:" + exitCode);
//      // 检查进程的退出码
//      if (exitCode == 0) {
//        System.out.println("Python脚本执行成功！");
//      } else {
//        System.out.println("Python脚本执行失败，退出码: " + exitCode);
//      }
//      // 读取Python脚本的标准错误
//      BufferedReader errorReader =
//          new BufferedReader(new InputStreamReader(process.getErrorStream()));
//      while ((line = errorReader.readLine()) != null) {
//        System.err.println(line);
//      }
//      long endTime = System.currentTimeMillis(); // 获取算法结束时间
//      System.out.println(("算法的运行时间为:" + (endTime - startTime) / 1000 + "s"));
//    } catch (Exception e) {
//      System.out.print("接口调用失败");
//      System.out.println(e.getMessage());
//    }

    return result;
  }
}

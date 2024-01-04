package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.algorithm.GA;
import com.ruoyi.project.multimode.domain.*;
import com.ruoyi.project.multimode.mapper.*;
import com.ruoyi.project.multimode.mapper.TasklistMapper;
import com.ruoyi.project.multimode.service.WorkshopSchedulingService;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class WorkshopSchedulingServiceImpl implements WorkshopSchedulingService {

  @Autowired private TasklistMapper tasklistMapper;
  //    @Autowired
  //    private TaskMapper taskMapper;
  @Autowired private SubtasklistMapper subtasklistMapper;
  @Autowired private BusinessTimetableMapper businessTimetableMapper;

  @Autowired
  @Qualifier("businessMapper2")
  private BusinessMapper businessMapper;

  private Map<GA.Pair, Double> modifiedErrorMT;
  private List<Object[]> dataList;
  private Map<Integer, Set<Integer>> taskToCompaniesMap;
  private Map<Integer, List<Integer>> jobToMachinesMap;
  private boolean isGaRun = false;

  @Override
  public String runAlgorithm() {
    if (!isGaRun) {
      // 获取任务列表
      List<Tasklist> tasks = tasklistMapper.findAll();
      // 获取子任务列表
      List<Subtasklist> subtasks = subtasklistMapper.findAll();
      // 获取企业时间表
      List<BusinessTimetable> timetables = businessTimetableMapper.findAll();
      // 获取企业列表
      List<Business2> businesses = businessMapper.findAll();
      int jobNum = tasks.size();
      int machineNum = businesses.size();
      int maxLengthTmachine = 0;
      int maxLengthTmachine1 = 0;
      int maxLengthTmachinetime = 0;
      int maxLengthTmachinecost = 0;

      // Tmachine, Tmachine1, Tmachinetime, Tmachinecost 等初始化
      Map<String, List<Integer>> Tmachine = new HashMap<>();
      Map<String, List<Integer>> Tmachine1 = new HashMap<>();
      Map<String, List<Double>> Tmachinetime = new HashMap<>();
      Map<String, List<Double>> Tmachinecost = new HashMap<>();
      Map<String, List<Integer>> tdx = new HashMap<>();
      Map<String, List<Integer>> tdx_cost = new HashMap<>();
      List<Integer> work = new ArrayList<>();
      Map<String, List<Integer>> tom = new HashMap<>();
      Map<String, List<Integer>> tom_cost = new HashMap<>();
      Map<String, Integer> machines = new HashMap<>();
      Map<Integer, Integer> subtaskCounts = new TreeMap<>(); // 使用 TreeMap 以保持键的顺序
      Map<String, String> businessToGroupMap = new HashMap<>();
      Map<String, String> businessToLinkMap = new HashMap<>();
      taskToCompaniesMap = new HashMap<>();
      jobToMachinesMap = new HashMap<>();

      for (Business2 business : businesses) {
        businessToGroupMap.put(business.getBusinessId(), business.getBusinessGroupId());
        businessToLinkMap.put(business.getBusinessId(), business.getBusinessLinkId());
      }

      // 填充数据结构
      for (Tasklist task : tasks) {
        List<Integer> TmachineList = new ArrayList<>();
        List<Integer> Tmachine1List = new ArrayList<>();
        List<Double> TmachinetimeList = new ArrayList<>();
        List<Double> TmachinecostList = new ArrayList<>();
        List<Integer> tomList = new ArrayList<>();
        List<Integer> tomCostList = new ArrayList<>();
        List<Integer> tdxList = new ArrayList<>();
        List<Integer> tdxCostList = new ArrayList<>();
        int cumulativeTdx = 0;
        int cumulativeTdxCost = 0;
        int subtaskCount = 0;
        for (Subtasklist subtask : subtasks) {
          if (subtask.getTaskId().equals(task.getTaskId())) {
            // int taskId = Integer.parseInt(task.getTaskId()) - 1; // 任务 ID 从 1 开始，所以减去 1
            subtaskCount++;
            int tdxCount = 0;
            int tdxCostCount = 0;

            for (BusinessTimetable timetable : timetables) {
              if (timetable.getTaskId().equals(task.getTaskId())
                  && timetable.getSubtaskId().equals(subtask.getSubtaskId())) {
                int businessId = Integer.parseInt(timetable.getBusinessId());
                double time = Double.parseDouble(timetable.getTime());
                double cost = Double.parseDouble(timetable.getCost());
                if (time > 0) {
                  TmachineList.add(businessId);
                  TmachinetimeList.add(time);
                  tdxCount++;
                }
                if (cost > 0) {
                  Tmachine1List.add(businessId);
                  TmachinecostList.add(cost);
                  tdxCostCount++;
                }
              }
            }
            tdxList.add(tdxCount);
            tdxCostList.add(tdxCostCount);
            // tdx.put(subtask.getSubtaskId(), tdxCount);
            // tdx_cost.put(subtask.getSubtaskId(), tdxCostCount);
            // 累加 tdx 和 tdx_cost
            cumulativeTdx += tdxCount;
            cumulativeTdxCost += tdxCostCount;
            tomList.add(cumulativeTdx);
            tomCostList.add(cumulativeTdxCost);
          }
        }
        tdx.put(task.getTaskId(), tdxList);
        tdx_cost.put(task.getTaskId(), tdxCostList);
        Tmachine.put(task.getTaskId(), TmachineList);
        Tmachine1.put(task.getTaskId(), Tmachine1List);
        Tmachinetime.put(task.getTaskId(), TmachinetimeList);
        Tmachinecost.put(task.getTaskId(), TmachinecostList);
        tom.put(task.getTaskId(), tomList);
        tom_cost.put(task.getTaskId(), tomCostList);
        machines.put(task.getTaskId(), subtaskCount);
        // 将每个任务的子任务数量添加到映射中
        int taskId = Integer.parseInt(task.getTaskId());
        subtaskCounts.put(taskId, subtaskCount);
        // 然后遍历 Tmachine 和 Tmachine1，填充 0 直到它们的长度等于最大长度
      }
      for (List<Integer> list : Tmachine.values()) {
        maxLengthTmachine = Math.max(maxLengthTmachine, list.size());
      }
      for (List<Integer> list : Tmachine1.values()) {
        maxLengthTmachine1 = Math.max(maxLengthTmachine1, list.size());
      }
      for (List<Integer> list : Tmachine.values()) {
        while (list.size() < maxLengthTmachine) {
          list.add(0);
        }
      }
      for (List<Integer> list : Tmachine1.values()) {
        while (list.size() < maxLengthTmachine1) {
          list.add(0);
        }
      }
      for (List<Double> list : Tmachinetime.values()) {
        maxLengthTmachinetime = Math.max(maxLengthTmachinetime, list.size());
      }
      for (List<Double> list : Tmachinecost.values()) {
        maxLengthTmachinecost = Math.max(maxLengthTmachinecost, list.size());
      }
      for (List<Double> list : Tmachinetime.values()) {
        while (list.size() < maxLengthTmachinetime) {
          list.add(0.0);
        }
      }
      for (List<Double> list : Tmachinecost.values()) {
        while (list.size() < maxLengthTmachinecost) {
          list.add(0.0);
        }
      }
      // 现在按顺序填充 work 列表
      for (Map.Entry<Integer, Integer> entry : subtaskCounts.entrySet()) {
        int taskId = entry.getKey() - 1; // 减去 1 是因为任务 ID 从 1 开始
        int count = entry.getValue();
        for (int i = 0; i < count; i++) {
          work.add(taskId);
        }
      }

      List<Object> parmData =
          Arrays.asList(
              Tmachine,
              Tmachine1,
              Tmachinetime,
              Tmachinecost,
              tdx,
              tdx_cost,
              work,
              tom,
              tom_cost,
              machines,
              businessToGroupMap,
              businessToLinkMap);
      /*for (Object data : parmData) {
          if (data instanceof Map) {
              // 如果数据是 Map 类型
              Map<?, ?> mapData = (Map<?, ?>) data;
              System.out.print(mapData.getClass().getSimpleName() + "：");
              for (Map.Entry<?, ?> entry : mapData.entrySet()) {
                  System.out.print("[" + entry.getKey() + " -> " + entry.getValue() + "], ");
              }
          } else if (data instanceof List) {
              // 如果数据是 List 类型
              List<?> listData = (List<?>) data;
              System.out.print(listData.getClass().getSimpleName() + "：");
              for (Object item : listData) {
                  System.out.print(item + ", ");
              }
          } else {
              // 对于其他类型
              System.out.print("Other Data: " + data);
          }
          System.out.println(); // 换行
      }*/

      // 初始化 GA 类的参数
      int generation = 18;
      int popsize = 20;
      double p1 = 0.8; // 交叉概率
      double p2 = 0.2; // 突变概率
      // int machineNum = businessMapper.countBusinessById();
      List<Integer> factoryInfo = Arrays.asList(1, 1, 1, 2, 2, 2); // 工厂信息
      List<Integer> linkInfo = Arrays.asList(1, 2, 3, 1, 2, 3); // 链接信息
      System.out.println("任务数：" + jobNum);
      System.out.println("企业数：" + machineNum);
      // 创建 GA 类的实例
      if (work != null && !work.isEmpty()) {
        System.out.println("work.size(): " + work.size()); // 打印 work 的大小，用于调试

        // 调用 gaInitial 方法
        GA ga = new GA(generation, popsize, p1, p2, parmData, machineNum);
        Object[] initialResult = ga.gaInitial();
        int[] WorkJob2 = (int[]) initialResult[0];
        int[] WorkM2 = (int[]) initialResult[1];
        System.out.println("WorkJob2 " + Arrays.toString(WorkJob2));
        System.out.println("WorkM2 " + Arrays.toString(WorkM2));
        for (int i = 0; i < WorkJob2.length; i++) {
          int task = WorkJob2[i];
          int company = WorkM2[i];
          taskToCompaniesMap.computeIfAbsent(task, k -> new HashSet<>()).add(company);
        }
        System.out.println("任务初次分配完成");
        /*for (Map.Entry<Integer, Set<Integer>> entry : taskToCompaniesMap.entrySet()) {
            int task = entry.getKey()+1;
            Set<Integer> companies = entry.getValue();
            System.out.println("任务 " + task + " 由企业 " + companies + " 完成");
        }*/
        for (Map.Entry<Integer, Set<Integer>> entry : taskToCompaniesMap.entrySet()) {
          int task = entry.getKey() + 1;
          Set<Integer> originalCompanies = entry.getValue();
          Set<Integer> modifiedCompanies = new HashSet<>();
          for (Integer companyId : originalCompanies) {
            if (companyId == 0) {
              modifiedCompanies.add(companyId + 1);
            } else {
              modifiedCompanies.add(companyId);
            }
          }
          Set<String> businessIds = new HashSet<>();
          Set<String> groupIds = new HashSet<>();
          Set<String> linkIds = new HashSet<>();
          for (Integer modifiedCompanyId : modifiedCompanies) {
            Business2 business = businessMapper.getBusinessById(modifiedCompanyId.toString());
            businessIds.add(business.getBusinessId());
            groupIds.add(business.getBusinessGroupId());
            linkIds.add(business.getBusinessLinkId());
          }

          System.out.print("任务 " + task + " 由企业 " + modifiedCompanies + " 完成");
          boolean crossBusiness = businessIds.size() > 1;
          boolean crossGroup = groupIds.size() > 1;
          boolean crossLink = linkIds.size() > 1;

          if (crossBusiness && crossGroup && crossLink) {
            System.out.println(" - 跨企业跨链跨群");
          } else if (crossBusiness && crossLink) {
            System.out.println(" - 跨企业跨链");
          } else if (crossBusiness && crossGroup) {
            System.out.println(" - 跨企业跨群");
          } else if (crossGroup && crossLink) {
            System.out.println(" - 跨链跨群");
          } else if (crossBusiness) {
            System.out.println(" - 跨企业");
          } else if (crossGroup) {
            System.out.println(" - 跨群");
          } else if (crossLink) {
            System.out.println(" - 跨链");
          } else {
            System.out.println(" - 无跨界");
          }
        }

        for (Object array : initialResult) {
          if (array instanceof int[]) {
            int[] intArray = (int[]) array;
            System.out.println(Arrays.toString(intArray));
          } else if (array instanceof double[]) {
            double[] doubleArray = (double[]) array;
            System.out.println(Arrays.toString(doubleArray));
          } else {
            System.out.println(array);
          }
        }
        /*int[] WorkJob2 = (int[]) initialResult[0];
        int[] WorkM2 = (int[]) initialResult[1];
        System.out.println("WorkJob2 "+Arrays.toString(WorkJob2) );
        System.out.println("WorkM2 "+Arrays.toString(WorkM2) );*/
        // GA ga = new GA(generation, popsize, p1, p2, parmData, machineNum, factoryInfo, linkInfo);
        Map<Double, Object> newOperation = new HashMap<>();
        List<Object> operation1 = new ArrayList<>();
        operation1.add(6); // 第一个元素
        operation1.add(Arrays.asList(3, 6, 1, 3, 2, 6, 2, 6, 2, 1, 1, 4)); // 第二个元素
        operation1.add(Arrays.asList(4, 2, 2, 4, 6, 6, 6, 5, 6, 1, 3, 2)); // 第三个元素
        operation1.add(Arrays.asList(4, 2, 2, 4, 6, 6, 6, 5, 6, 1, 3, 2)); // 第四个元素
        operation1.add(Arrays.asList(2, 1, 3, 1, 3, 2)); // 第五个元素
        operation1.add(Arrays.asList(2, 3, 6, 7, 10, 12)); // 第六个元素
        newOperation.put(7.0, operation1);
        // 提供一个初始化时间或默认值
        String initialTime = "08:00:00";
        // 创建或获取 newOperation 列表
        // ga.gaTotal(newOperation, initialTime);
        Object[] results = ga.gaTotal(newOperation, initialTime);
        modifiedErrorMT = (Map<GA.Pair, Double>) results[0];
        dataList = (List<Object[]>) results[1];
        // 打印 errorMT 和 dataList
        System.out.println("故障机器及其故障剩余时间：");
        for (Map.Entry<GA.Pair, Double> entry : modifiedErrorMT.entrySet()) {
          System.out.println(entry.getKey() + " 剩余时间: " + entry.getValue());
        }

        System.out.println("数据列表：机器：开始时间：结束时间：工件编号：工厂号：");
        for (Object[] array : dataList) {
          System.out.println(Arrays.toString(array));
        }

        // 遍历 errorMT 以找到所有故障任务的机器编号
        for (Map.Entry<GA.Pair, Double> entry : modifiedErrorMT.entrySet()) {
          GA.Pair pair = entry.getKey();
          int jobToFind = pair.job;

          // 收集完成特定任务的所有企业（机器）编号
          List<Integer> machinesForJob =
              jobToMachinesMap.computeIfAbsent(jobToFind, k -> new ArrayList<>());
          for (Object[] array : dataList) {
            int jobNumberInArray = (Integer) array[3]; // 最后一列是工件编号
            if (jobNumberInArray == jobToFind) {
              int machineNumber = (Integer) array[0]; // 第一列是机器编号
              machinesForJob.add(machineNumber);
              if (machinesForJob.isEmpty()) {
                machinesForJob.addAll(Arrays.asList(2, 5));
              }
            }
          }
          // 输出完成故障任务的企业编号
          System.out.println("完成故障任务 Job: " + jobToFind + " 的企业为: " + machinesForJob);
        }
        // 匹配任务分配结果
        System.out.println("taskToCompaniesMap: " + taskToCompaniesMap);
        System.out.println("jobToMachinesMap: " + jobToMachinesMap);
        for (Map.Entry<Integer, Set<Integer>> entry : taskToCompaniesMap.entrySet()) {
          int task = entry.getKey() + 1;
          Set<Integer> originalCompanies = entry.getValue();

          List<Integer> machinesForJob = jobToMachinesMap.get(task);
          if (machinesForJob != null) {
            System.out.println(
                "任务 "
                    + (task)
                    + " 在故障前由企业 "
                    + originalCompanies
                    + " 完成，在故障后由企业 "
                    + machinesForJob
                    + " 完成");
          }
        }
        // 循环遍历任务分配结果
        // 遍历 jobToMachinesMap 来获取故障任务
        for (Map.Entry<Integer, List<Integer>> errorEntry : jobToMachinesMap.entrySet()) {
          int task = errorEntry.getKey(); // 故障任务编号
          List<Integer> machinesForJob = errorEntry.getValue(); // 故障后的企业列表

          Set<Integer> originalCompanies = taskToCompaniesMap.get(task - 1);
          if (originalCompanies == null) {
            System.out.println("任务 " + task + " 在故障前没有企业数据");
            continue;
          }

          // 收集故障前企业的信息
          Set<String> originalBusinessIds = new HashSet<>();
          Set<String> originalGroupIds = new HashSet<>();
          Set<String> originalLinkIds = new HashSet<>();
          for (Integer companyId : originalCompanies) {
            Business2 business = businessMapper.getBusinessById(companyId.toString());
            if (business != null) {
              originalBusinessIds.add(business.getBusinessId());
              originalGroupIds.add(business.getBusinessGroupId());
              originalLinkIds.add(business.getBusinessLinkId());
            }
          }

          // 收集故障后企业的信息
          Set<String> afterBusinessIds = new HashSet<>();
          Set<String> afterGroupIds = new HashSet<>();
          Set<String> afterLinkIds = new HashSet<>();
          for (Integer companyId : machinesForJob) {
            Business2 business = businessMapper.getBusinessById(companyId.toString());
            if (business != null) {
              afterBusinessIds.add(business.getBusinessId());
              afterGroupIds.add(business.getBusinessGroupId());
              afterLinkIds.add(business.getBusinessLinkId());
            }
          }

          // 比较故障前后企业的信息
          boolean crossBusiness = !originalBusinessIds.equals(afterBusinessIds);
          boolean crossGroup = !originalGroupIds.equals(afterGroupIds);
          boolean crossLink = !originalLinkIds.equals(afterLinkIds);

          // 输出结果
          System.out.print(
              "任务 "
                  + task
                  + " 在故障前由企业 "
                  + originalCompanies
                  + " 完成，在故障后由企业 "
                  + machinesForJob
                  + " 完成");
          if (crossBusiness && crossGroup && crossLink) {
            System.out.println(" - 跨企业跨链跨群");
          } else if (crossBusiness && crossLink) {
            System.out.println(" - 跨企业跨链");
          } else if (crossBusiness && crossGroup) {
            System.out.println(" - 跨企业跨群");
          } else if (crossGroup && crossLink) {
            System.out.println(" - 跨链跨群");
          } else if (crossBusiness) {
            System.out.println(" - 跨企业");
          } else if (crossGroup) {
            System.out.println(" - 跨群");
          } else if (crossLink) {
            System.out.println(" - 跨链");
          } else {
            System.out.println(" - 无跨界");
          }
        }
      }
      isGaRun = true;
    }
    return "Algorithm completed";
  }

  @Override
  public List<String> getErrorMachinesInfo() {
    List<String> resultList = new ArrayList<>();
    // 打印 modifiedErrorMT 的大小和内容
    // System.out.println("modifiedErrorMT size: " + modifiedErrorMT.size());
    modifiedErrorMT.forEach((key, value) -> System.out.println(key + " -> " + value));
    for (Map.Entry<GA.Pair, Double> entry : modifiedErrorMT.entrySet()) {
      GA.Pair pair = entry.getKey();
      // 只附加 Job 后的数字
      resultList.add(String.valueOf(pair.job));
    }
    System.out.println("Result: " + resultList);
    return resultList;
  }

  @Override
  public List<String> getErrorMachines() {
    List<String> resultList = new ArrayList<>();
    // 打印 modifiedErrorMT 的大小和内容
    System.out.println("modifiedErrorMT size: " + modifiedErrorMT.size());
    modifiedErrorMT.forEach((key, value) -> System.out.println(key + " -> " + value));
    for (Map.Entry<GA.Pair, Double> entry : modifiedErrorMT.entrySet()) {
      GA.Pair pair = entry.getKey();
      System.out.println("machine" + pair.machine);
      resultList.add(String.valueOf(pair.machine));
    }
    if (resultList.isEmpty()) {
      resultList.add("");
    }
    System.out.println("Result: " + resultList);
    return resultList;
  }

  @Override
  public String getDataListInfo() {
    StringBuilder result = new StringBuilder("数据列表：机器：开始时间：结束时间：工件编号：工厂号：\n");
    for (Object[] array : dataList) {
      result.append(Arrays.toString(array)).append("\n");
    }
    return result.toString();
  }

  @Override
  public List<Integer> getMachinesForJob(int jobId) {
    if (modifiedErrorMT == null
        || modifiedErrorMT.isEmpty()
        || dataList == null
        || dataList.isEmpty()) {
      return Collections.emptyList();
    }

    List<Integer> machinesForJob = new ArrayList<>();
    for (Object[] array : dataList) {
      int jobNumberInArray = (Integer) array[3]; // 工件编号
      if (jobNumberInArray == jobId) {
        int machineNumber = (Integer) array[0]; // 机器编号
        machinesForJob.add(machineNumber);
      }
    }

    // 如果没有找到任何机器，则返回默认机器编号
    if (machinesForJob.isEmpty()) {
      machinesForJob.addAll(Arrays.asList(2, 5)); // 这里的默认值可以根据需要调整
      System.out.println("Default machines returned for jobId " + jobId);
    } else {
      System.out.println("Machines for jobId " + jobId + ": " + machinesForJob);
    }

    return machinesForJob;
  }

  @Override
  public Business2 getBusinessName(String businessName) {
    return businessMapper.getBusinessName(businessName);
  }

  @Override
  public Map<Integer, String> getBusinessNamesByIds(List<Integer> businessIds) {
    Map<Integer, String> businessNames = new HashMap<>();
    for (Integer id : businessIds) {
      // 将整数类型的ID转换为字符串
      String businessIdStr = String.valueOf(id);
      Business2 business = businessMapper.getBusinessById(businessIdStr);
      if (business != null) {
        businessNames.put(id, business.getBusinessName());
      }
    }
    return businessNames;
  }

  @Override
  public Map<Integer, String> getTasksCrossInfo() {
    Map<Integer, String> tasksCrossInfoMap = new HashMap<>();
    for (Map.Entry<Integer, Set<Integer>> entry : taskToCompaniesMap.entrySet()) {
      int task = entry.getKey() + 1;
      Set<Integer> originalCompanies = entry.getValue();

      List<Integer> machinesForJob = jobToMachinesMap.get(task);
      if (machinesForJob != null) {
        System.out.println(
            "任务 "
                + (task)
                + " 在故障前由企业 "
                + originalCompanies
                + " 完成，在故障后由企业 "
                + machinesForJob
                + " 完成");
      }
    }
    String crossInfo = null;
    // 循环遍历任务分配结果
    // 遍历 jobToMachinesMap 来获取故障任务
    for (Map.Entry<Integer, List<Integer>> errorEntry : jobToMachinesMap.entrySet()) {
      int task = errorEntry.getKey(); // 故障任务编号
      List<Integer> machinesForJob = errorEntry.getValue(); // 故障后的企业列表

      Set<Integer> originalCompanies = taskToCompaniesMap.get(task - 1);
      if (originalCompanies == null) {
        System.out.println("任务 " + task + " 在故障前没有企业数据");
        continue;
      }

      // 收集故障前企业的信息
      Set<String> originalBusinessIds = new HashSet<>();
      Set<String> originalGroupIds = new HashSet<>();
      Set<String> originalLinkIds = new HashSet<>();
      for (Integer companyId : originalCompanies) {
        Business2 business = businessMapper.getBusinessById(companyId.toString());
        if (business != null) {
          originalBusinessIds.add(business.getBusinessId());
          originalGroupIds.add(business.getBusinessGroupId());
          originalLinkIds.add(business.getBusinessLinkId());
        }
      }

      // 收集故障后企业的信息
      Set<String> afterBusinessIds = new HashSet<>();
      Set<String> afterGroupIds = new HashSet<>();
      Set<String> afterLinkIds = new HashSet<>();
      for (Integer companyId : machinesForJob) {
        Business2 business = businessMapper.getBusinessById(companyId.toString());
        if (business != null) {
          afterBusinessIds.add(business.getBusinessId());
          afterGroupIds.add(business.getBusinessGroupId());
          afterLinkIds.add(business.getBusinessLinkId());
        }
      }

      // 比较故障前后企业的信息
      boolean crossBusiness = !originalBusinessIds.equals(afterBusinessIds);
      boolean crossGroup = !originalGroupIds.equals(afterGroupIds);
      boolean crossLink = !originalLinkIds.equals(afterLinkIds);
      tasksCrossInfoMap.put(task, crossInfo);

      if (crossBusiness && crossGroup && crossLink) {
        crossInfo = "跨企业跨链跨群";
      } else if (crossBusiness && crossLink) {
        crossInfo = "跨企业跨链";
      } else if (crossBusiness && crossGroup) {
        crossInfo = "跨企业跨群";
      } else if (crossGroup && crossLink) {
        crossInfo = "跨链跨群";
      } else if (crossBusiness) {
        crossInfo = "跨企业";
      } else if (crossGroup) {
        crossInfo = "跨群";
      } else if (crossLink) {
        crossInfo = "跨链";
      } else {
        crossInfo = "无跨界";
      }
      tasksCrossInfoMap.put(task, crossInfo);
      System.out.println("Task Cross Info for task " + task + ": " + crossInfo);
    }
    System.out.println("tasksCrossInfoMap" + tasksCrossInfoMap);
    return tasksCrossInfoMap;
  }

  @Override
  public String getBusinessNameById(String businessId) {
    return businessMapper.getBusinessNameById(businessId);
  }
}

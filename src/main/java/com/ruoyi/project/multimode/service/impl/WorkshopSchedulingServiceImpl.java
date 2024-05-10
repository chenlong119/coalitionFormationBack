package com.ruoyi.project.multimode.service.impl;

import com.ruoyi.project.multimode.algorithm.GA;
import com.ruoyi.project.multimode.domain.*;
import com.ruoyi.project.multimode.mapper.CompanyAllMapper;
import com.ruoyi.project.multimode.mapper.TaskAllMapper;
import com.ruoyi.project.multimode.domain.TaskAll2;
import com.ruoyi.project.multimode.service.TaskBreakdownService;
import com.ruoyi.project.multimode.service.WorkshopSchedulingService;
import java.util.*;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkshopSchedulingServiceImpl implements WorkshopSchedulingService {
  @Autowired private TaskBreakdownService taskBreakdownService; // Ensure this service is correctly instantiated.
  @Autowired
  private TaskAllMapper taskAllMapper;
  @Autowired
  private CompanyAllMapper companyAllMapper;
  private Map<GA.Pair, Double> modifiedErrorMT;
  private List<Object[]> dataList;
  private Map<Integer, Set<Integer>> taskToCompaniesMap;
  private Map<Integer, List<Integer>> jobToMachinesMap;
  //页面启动问题
  private boolean isGaRun = false;
  //显示状态为1的任务
  @Override
  public List<TaskAll2> selectActiveTasks() {
    return taskAllMapper.selectActiveTasks();
  }
  @Override
  public List<CompanyAll2> selectAllCompanies() {
    return companyAllMapper.selectAllCompanies();
  }
  private List<PartOneCollection> savedCollections = null;
  @Override
  public List<PartOneCollection> runAlgorithm() {
    if (savedCollections != null) {
      return savedCollections; // 如果结果已经存在，直接返回保存的结果
    }

    List<PartOneCollection> collections = new ArrayList<>();
    if (!isGaRun) {
      List<SubtaskResult> subtaskResults = taskBreakdownService.calculateSubtaskResults(); // Ensure this call succeeds.
      int maxLengthTmachine = 0;
      int maxLengthTmachine1 = 0;
      int maxLengthTmachinetime = 0;
      int maxLengthTmachinecost = 0;



      // Tmachine, Tmachine1, Tmachinetime, Tmachinecost 等初始化
      Map<Integer, List<Integer>> Tmachine = new HashMap<>();
      Map<Integer, List<Integer>> Tmachine1 = new HashMap<>();
      Map<Integer, List<Double>> Tmachinetime = new HashMap<>();
      Map<Integer, List<Double>> Tmachinecost = new HashMap<>();
      Map<Integer, List<Integer>> tdx = new HashMap<>();
      Map<Integer, List<Integer>> tdx_cost = new HashMap<>();
      List<Integer> work = new ArrayList<>();
      Map<Integer, List<Integer>> tom = new HashMap<>();
      Map<Integer, List<Integer>> tom_cost = new HashMap<>();
      Map<Integer, Integer> machines = new HashMap<>();
      Map<Integer, Integer> subtaskCounts = new TreeMap<>(); // 使用 TreeMap 以保持键的顺序
      Map<Integer, String> businessToGroupMap = new HashMap<>();
      Map<Integer, String> businessToLinkMap = new HashMap<>();
      Map<Integer, Integer> cumulativeTom = new HashMap<>();
      Map<Integer, Integer> cumulativeTomCost = new HashMap<>();

      taskToCompaniesMap = new HashMap<>();
      jobToMachinesMap = new HashMap<>();

      //处理任务数和企业数
      Set<Integer> uniqueTaskIds = new HashSet<>();
      Set<Integer> uniqueCompanyIds = new HashSet<>();
      // 任务id映射

      for (SubtaskResult result : subtaskResults) {
        uniqueTaskIds.add(result.getTaskId());
        uniqueCompanyIds.add(result.getCompanyId());
      }

      Map<Integer, Integer> taskIdToIndex = new HashMap<>();
      int index = 0;
      for (Integer taskId : new TreeSet<>(uniqueTaskIds)) { // 使用 TreeSet 确保 taskId 是排序的
        taskIdToIndex.put(taskId, index++);
      }

      int jobNum = uniqueTaskIds.size();
      int machineNum = uniqueCompanyIds.size();

      //映射产业链和企业群id
      for (SubtaskResult result : subtaskResults) {
        Integer taskId = result.getTaskId();
        Integer continuousIndex = taskIdToIndex.get(taskId);
        businessToGroupMap.putIfAbsent(result.getCompanyId(), result.getGroupId().toString());
        businessToLinkMap.putIfAbsent(result.getCompanyId(), result.getLayerId().toString());
        subtaskCounts.put(continuousIndex,4);
        machines.put(continuousIndex, 4);

        // 填充Tmachine, Tmachinetime, Tmachinecost
        Tmachine.computeIfAbsent(continuousIndex, k -> new ArrayList<>()).add(result.getCompanyId());
        Tmachinetime.computeIfAbsent(continuousIndex, k -> new ArrayList<>()).add(result.getTime());
        Tmachinecost.computeIfAbsent(continuousIndex, k -> new ArrayList<>()).add(result.getCost());

        // 管理tdx和tdx_cost的计数，直接使用taskId作为键
        tdx.computeIfAbsent(continuousIndex, k -> new ArrayList<>()).add(1); // 简化处理，实际逻辑可能不同
        tdx_cost.computeIfAbsent(continuousIndex, k -> new ArrayList<>()).add(1);

        // 累加计数，直接使用taskId作为键
        int newCumulativeTom = cumulativeTom.getOrDefault(continuousIndex, 0) + 1;
        tom.computeIfAbsent(continuousIndex, k -> new ArrayList<>()).add(newCumulativeTom);
        cumulativeTom.put(continuousIndex, newCumulativeTom);

        int newCumulativeTomCost = cumulativeTomCost.getOrDefault(continuousIndex, 0) + 1;
        tom_cost.computeIfAbsent(continuousIndex, k -> new ArrayList<>()).add(newCumulativeTomCost);
        cumulativeTomCost.put(continuousIndex, newCumulativeTomCost);
      }
      // 填充数据结构
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
      for (Integer taskId : uniqueTaskIds) {
        if (taskIdToIndex.containsKey(taskId)) { // 检查 taskId 是否存在于映射中
          int taskIndex = taskIdToIndex.get(taskId); // 安全地获取索引
          int count = subtaskCounts.get(taskIndex);
          for (int i = 0; i < count; i++) {
            work.add(taskIndex);
          }
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
      // 初始化 GA 类的参数
      int generation = 18;
      int popsize = 20;
      double p1 = 0.8; // 交叉概率D
      double p2 = 0.2; // 突变概率
      //System.out.println("任务数：" + jobNum);
      //System.out.println("企业数：" + machineNum);
      // 创建 GA 类的实例
      if (popsize == 20) {
        //System.out.println("work.size(): " + work.size()); // 打印 work 的大小，用于调试

        // 调用 gaInitial 方法
        GA ga = new GA(generation, popsize, p1, p2, parmData, machineNum);
        Object[] initialResult = ga.gaInitial();
        int[] WorkJob2 = (int[]) initialResult[0];
        int[] WorkM2 = (int[]) initialResult[1];
        for (int i = 0; i < WorkJob2.length; i++) {
          int task = WorkJob2[i];
          int company = WorkM2[i];
          taskToCompaniesMap.computeIfAbsent(task, k -> new HashSet<>()).add(company);
        }

        for (Map.Entry<Integer, Set<Integer>> entry : taskToCompaniesMap.entrySet()) {
          int taskId = entry.getKey();
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
            // 直接从映射中获取链ID和群组ID
            String chainId = businessToLinkMap.get(modifiedCompanyId);
            String groupId = businessToGroupMap.get(modifiedCompanyId);

            businessIds.add(String.valueOf(modifiedCompanyId)); // 如果需要，转换为String
            if (chainId != null) linkIds.add(chainId);
            if (groupId != null) groupIds.add(groupId);
          }
          boolean crossBusiness = businessIds.size() > 1;
          boolean crossGroup = groupIds.size() > 1;
          boolean crossLink = linkIds.size() > 1;

        }

        for (Object array : initialResult) {
          if (array instanceof int[]) {
            int[] intArray = (int[]) array;
            //System.out.println(Arrays.toString(intArray));
          } else if (array instanceof double[]) {
            double[] doubleArray = (double[]) array;
            //System.out.println(Arrays.toString(doubleArray));
          } else {
            //System.out.println(array);
          }
        }
        Map<Double, Object> newOperation = new HashMap<>();
        Map<Integer, String> tasksCrossInfoMap = new HashMap<>();
        Map<Integer, Integer> tasksCrossModeMap = new HashMap<>();
        List<Object> operation1 = new ArrayList<>();
        operation1.add(1); // 第一个元素
        operation1.add(Arrays.asList(3, 6, 1, 3, 2, 6, 2, 6, 2, 1, 1, 4)); // 第二个元素
        operation1.add(Arrays.asList(4, 2, 2, 4, 6, 6, 6, 5, 6, 1, 3, 2)); // 第三个元素
        operation1.add(Arrays.asList(4, 2, 2, 4, 6, 6, 6, 5, 6, 1, 3, 2)); // 第四个元素
        operation1.add(Arrays.asList(2, 1, 3, 1, 3, 2)); // 第五个元素
        operation1.add(Arrays.asList(2, 3, 6, 7, 10, 12)); // 第六个元素
        newOperation.put(1.0, operation1);
        List<TaskAll2> tasks = selectActiveTasks();
        List<CompanyAll2> companies = selectAllCompanies();
        // 提供一个初始化时间或默认值
        String initialTime = "08:00:00";
        // 创建或获取 newOperation 列表List<TaskAll> tasks = selectActiveTasks();
        //    List<CompanyAll> companies = selectAllCompanies();
        // ga.gaTotal(newOperation, initialTime);
        Object[] results = ga.gaTotal(newOperation, initialTime,tasks, companies);


        //modifiedErrorMT = (Map<GA.Pair, Double>) results1[0];
        //dataList = (List<Object[]>) results1[1];
        Set<Integer> task = new HashSet<>();
        Set<Integer> originalCompany = new HashSet<>();
        Set<Integer> corCompany = new HashSet<>();
        Integer taskId = (Integer) results[0];
        Integer originalCompanyId = (Integer) results[1];
        Integer corCompanyId = (Integer) results[2];
        originalCompany.add(originalCompanyId);
        corCompany.add(corCompanyId);
        Set<String> originalBusinessIds = new HashSet<>();
        Set<String> originalGroupIds = new HashSet<>();
        Set<String> originalLinkIds = new HashSet<>();
        for (Integer companyId : originalCompany) {
          String chainId = businessToLinkMap.get(companyId);
          String groupId = businessToGroupMap.get(companyId);

          // 假设在SubtaskResult中，companyId即businessId
          originalBusinessIds.add(String.valueOf(companyId)); // 如果需要将公司ID作为业务ID添加
          if (chainId != null) {
            originalLinkIds.add(chainId); // 添加链ID
          }
          if (groupId != null) {
            originalGroupIds.add(groupId); // 添加群组ID
          }
        }

        // 收集故障后企业的信息
        Set<String> afterBusinessIds = new HashSet<>();
        Set<String> afterGroupIds = new HashSet<>();
        Set<String> afterLinkIds = new HashSet<>();
        for (Integer companyId : corCompany) {
          String chainId = businessToLinkMap.get(companyId);
          String groupId = businessToGroupMap.get(companyId);
          afterBusinessIds.add(String.valueOf(companyId)); // 如果需要将公司ID作为业务ID添加
          if (chainId != null) {
            afterLinkIds.add(chainId); // 添加链ID
          }
          if (groupId != null) {
            afterGroupIds.add(groupId); // 添加群组ID
          }
        }

        // 比较故障前后企业的信息
        boolean crossBusiness = !originalBusinessIds.equals(afterBusinessIds);
        boolean crossGroup = !originalGroupIds.equals(afterGroupIds);
        boolean crossLink = !originalLinkIds.equals(afterLinkIds);
        String crossInfo = null;
        Integer mode = 0;

        // 输出结果
        System.out.print(
                "任务 "
                        + taskId
                        + " 在故障前由企业 "
                        + originalCompany
                        + " 完成，在故障后由企业 "
                        + corCompany
                        + " 完成");
        tasksCrossInfoMap.put(taskId, crossInfo);

        if (crossBusiness && crossGroup && crossLink) {
          crossInfo = "跨企业跨链跨群";
          mode = 1;
        } else if (crossBusiness && crossLink) {
          crossInfo = "跨企业跨链";
          mode = 4;
        } else if (crossBusiness && crossGroup) {
          crossInfo = "跨企业跨群";
          mode = 5;
        } else if (crossGroup && crossLink) {
          crossInfo = "跨链跨群";
          mode = 6;
        } else if (crossBusiness) {
          crossInfo = "跨企业";
          mode = 2;
        } else if (crossGroup) {
          crossInfo = "跨群";
          mode = 0;
        } else if (crossLink) {
          crossInfo = "跨链";
          mode = 3;
        } else {
          crossInfo = "跨企业跨链跨群";
          mode = 1;
        }
        tasksCrossInfoMap.put(taskId, crossInfo);
        tasksCrossModeMap.put(taskId, mode);
        PartOneCollection collection = collectAndPrepareData(taskId, new ArrayList<>(originalCompany), new ArrayList<>(corCompany), crossInfo, mode);
        collections.add(collection);

      }
      isGaRun = true;
      savedCollections = collections;
    }
    return collections;
  }

  public PartOneCollection collectAndPrepareData(Integer task, List<Integer> originalCompanies, List<Integer> machinesForJob, String crossInfo, Integer mode) {

    PartOneCollection collection = new PartOneCollection();
    collection.setTaskId(task);
    String taskName = taskAllMapper.findTaskNameById(task);
    collection.setTaskName(taskName);

    // 故障前企业ID和名称
    collection.setOriginalCompanyId(originalCompanies);
    List<String> originalCompanyNames = originalCompanies.stream()
            .map(companyId -> companyAllMapper.findCompanyNameById(companyId))
            .collect(Collectors.toList());
    collection.setOriginalCompanyNames(originalCompanyNames);

    // 故障后企业ID和名称
    collection.setMachineCompanyId(machinesForJob);
    List<String> machineCompanyNames = machinesForJob.stream()
            .map(companyId -> companyAllMapper.findCompanyNameById(companyId))
            .collect(Collectors.toList());
    collection.setMachineCompanyNames(machineCompanyNames);

    // 直接使用传入的crossInfo和mode
    collection.setCrossInfo(crossInfo);
    collection.setMode(mode);
    return collection;
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
    //System.out.println("Result: " + resultList);
    return resultList;
  }

  @Override
  public List<String> getErrorMachines() {
    List<String> resultList = new ArrayList<>();
    // 打印 modifiedErrorMT 的大小和内容
    //System.out.println("modifiedErrorMT size: " + modifiedErrorMT.size());
    modifiedErrorMT.forEach((key, value) -> System.out.println(key + " -> " + value));
    for (Map.Entry<GA.Pair, Double> entry : modifiedErrorMT.entrySet()) {
      GA.Pair pair = entry.getKey();
      //System.out.println("machine" + pair.machine);
      resultList.add(String.valueOf(pair.machine));
    }
    if (resultList.isEmpty()) {
      resultList.add("");
    }
    //System.out.println("Result: " + resultList);
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
      //System.out.println("Default machines returned for jobId " + jobId);
    } else {
      //System.out.println("Machines for jobId " + jobId + ": " + machinesForJob);
    }

    return machinesForJob;
  }
  private Map<Integer, String> companyIdToName;

  // 在类的某个初始化方法中调用
  public void initializeWithSubtaskResults(List<SubtaskResult> subtaskResults) {
    this.companyIdToName = buildCompanyIdToNameMap(subtaskResults);
  }
  private Map<Integer, String> buildCompanyIdToNameMap(List<SubtaskResult> subtaskResults) {
    Map<Integer, String> companyIdToName = new HashMap<>();
    for (SubtaskResult result : subtaskResults) {
      // 假设每个SubtaskResult中的companyId和businessName字段已正确填充
      companyIdToName.put(result.getCompanyId(), result.getCompanyName());
    }
    return companyIdToName;
  }


  public Map<Integer, String> getBusinessNamesByIds(List<Integer> businessIds) {
    Map<Integer, String> businessNames = new HashMap<>();
    for (Integer id : businessIds) {
      String name = companyIdToName.get(id);
      if (name != null) {
        businessNames.put(id, name);
      }
    }
    return businessNames;
  }

  @Override
  public Map<Integer, String> getTasksCrossInfo() {
    List<SubtaskResult> subtaskResults = taskBreakdownService.calculateSubtaskResults(); // Ensure this call succeeds.
    Map<Integer, String> tasksCrossInfoMap = new HashMap<>();
    Map<Integer, String> companyIdToChainId = new HashMap<>();
    Map<Integer, String> companyIdToGroupId = new HashMap<>();

    for (SubtaskResult result : subtaskResults) {
      // 填充企业ID到链ID和群组ID的映射
      companyIdToChainId.put(result.getCompanyId(), result.getLayerId().toString());
      companyIdToGroupId.put(result.getCompanyId(), result.getGroupId().toString());
    }
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
        //System.out.println("任务 " + task + " 在故障前没有企业数据");
        continue;
      }

      // 收集故障前企业的信息
      Set<String> originalBusinessIds = new HashSet<>();
      Set<String> originalGroupIds = new HashSet<>();
      Set<String> originalLinkIds = new HashSet<>();
      for (Integer companyId : originalCompanies) {
        String businessId = String.valueOf(companyId); // 假设企业ID即为businessId
        String groupId = companyIdToGroupId.get(companyId);
        String chainId = companyIdToChainId.get(companyId);

        originalBusinessIds.add(businessId);
        if (groupId != null) originalGroupIds.add(groupId);
        if (chainId != null) originalLinkIds.add(chainId);
      }

      // 收集故障后企业的信息
      Set<String> afterBusinessIds = new HashSet<>();
      Set<String> afterGroupIds = new HashSet<>();
      Set<String> afterLinkIds = new HashSet<>();
      for (Integer companyId : machinesForJob) {
        String businessId = companyId.toString();
        String groupId = companyIdToGroupId.get(companyId);
        String chainId = companyIdToChainId.get(companyId);

        afterBusinessIds.add(businessId);
        if (groupId != null) afterGroupIds.add(groupId);
        if (chainId != null) afterLinkIds.add(chainId);
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
        crossInfo = "跨企业跨链跨群";
      }
      tasksCrossInfoMap.put(task, crossInfo);
      //System.out.println("Task Cross Info for task " + task + ": " + crossInfo);
    }
    //System.out.println("tasksCrossInfoMap" + tasksCrossInfoMap);
    return tasksCrossInfoMap;
  }
  public String getBusinessNameById(String businessId) {
    // 将业务ID字符串转换为整数，因为我们的映射使用整数作为键
    Integer id = Integer.valueOf(businessId);
    // 直接从映射中获取业务名称
    return companyIdToName.get(id);
  }
}

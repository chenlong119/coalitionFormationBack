package com.ruoyi.project.multimode.algorithm;

import com.ruoyi.project.multimode.domain.CompanyAll2;
import com.ruoyi.project.multimode.domain.TaskAll2;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class GA {

    private int generation;
    private int popsize;
    private double p1;
    private double p2;
    private Map<Integer, List<Integer>> Tmachine;
    private Map<Integer, List<Integer>> Tmachine1;
    private Map<Integer, List<Double>> Tmachinetime;
    private Map<Integer, List<Double>> Tmachinecost;
    private Map<Integer, List<Integer>> tdx;
    private Map<Integer, List<Integer>> tdx_cost;
    private List<Integer> work;
    private Map<Integer, List<Integer>> tom;
    private Map<Integer, List<Integer>> tom_cost;
    private Map<Integer, Integer> machines;
    private Map<String, String> businessToGroupMap = new HashMap<>();
    private Map<String, String> businessToLinkMap = new HashMap<>();
    private int machineNum;
    private int jobNum;
    private int operationNum;
    private List<Integer> jobList;
    private int GS_num;
    private int LS_num;
    private int RS_num;
    private double weightTime;
    private double weightCost;
    private int[][] WorkJob2;
    private int[][] WorkM2;
    private double[][] WorkT2;
    private double[][] WorkC2;
    private List<List<Double>> result; // 用于存储每次迭代的结果
    private Map<Double, Integer[]> newCar;
    private List<String> machineKeys; // 存储 machines 映射的键
    private List<String> operationKeys; // 存储操作对应的字符串键
    // 构造函数
    public GA(int generation, int popsize, double p1, double p2, List<Object> parmData,
              int machineNum) {
        this.generation = generation;
        this.popsize = popsize;
        this.p1 = p1;
        this.p2 = p2;
        this.Tmachine = (Map<Integer, List<Integer>>) parmData.get(0);
        this.Tmachine1 = (Map<Integer, List<Integer>>) parmData.get(1);
        this.Tmachinetime = (Map<Integer, List<Double>>) parmData.get(2);
        this.Tmachinecost = (Map<Integer, List<Double>>) parmData.get(3);
        this.tdx = (Map<Integer, List<Integer>>) parmData.get(4);
        this.tdx_cost = (Map<Integer, List<Integer>>) parmData.get(5);
        this.work = (List<Integer>) parmData.get(6);
        this.tom = (Map<Integer, List<Integer>>) parmData.get(7);
        this.tom_cost = (Map<Integer, List<Integer>>) parmData.get(8);
        this.machines = (Map<Integer, Integer>) parmData.get(9);
        this.businessToGroupMap=(Map<String, String >) parmData.get(10);
        this.businessToLinkMap=(Map<String, String >) parmData.get(11);
        this.machineKeys = machines.keySet().stream()
                .map(String::valueOf)
                .collect(Collectors.toList());
        this.machineNum = machineNum;
        this.jobNum = machines.size();
        this.operationNum = machines.values().stream().mapToInt(Integer::intValue).sum();
        this.jobList = new ArrayList<>();
        for (int i = 0; i < this.jobNum; i++) {
            this.jobList.add(i);
        }
        //this.GS_num = (int)(0.2 * this.popsize);
        //this.LS_num = (int)(0.5 * this.popsize);
        this.RS_num = popsize;
        this.weightTime = 0.6;
        this.weightCost = 0.4;
        // 初始化其他字段
    }
    // 创建一个初始化为零的二维整数数组
    private int[][] createZeroMatrix(int rows, int cols) {
        int[][] matrix = new int[rows][cols];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                matrix[i][j] = 0;
            }
        }
        return matrix;
    }
    public int[][] globalInitial() {
        int[][] MS = new int[GS_num][work.size()];
        int[][] OS = new int[GS_num][work.size()];
        List<Integer> OS_list = new ArrayList<>(work); // 创建 work 的副本
        List<Integer> GJ_list = new ArrayList<>(machines.keySet()); // 创建机器列表副本

        for (int i = 0; i < GS_num; i++) {
            Collections.shuffle(OS_list); // 随机打乱工序列表
            for (int j = 0; j < OS_list.size(); j++) {
                OS[i][j] = OS_list.get(j);
            }

            Collections.shuffle(GJ_list); // 随机打乱工件列表
            List<Integer> listLoad = new ArrayList<>(Collections.nCopies(machineNum, 0)); // 初始化机器负荷为 0

            for (Integer g : GJ_list) {
                int subtaskCount = machines.get(g); // 获取任务的子任务数
                for (int j = 0; j < subtaskCount; j++) {
                    int highs = tom.get(g).get(j);
                    int lows = (j == 0) ? 0 : tom.get(g).get(j) - tdx.get(g).get(j);

                    List<Integer> machineFeasible = new ArrayList<>();
                    List<Double> corrTime = new ArrayList<>();
                    for (int k = lows; k < highs; k++) {
                        List<Integer> machineList = Tmachine.get(g);
                        if (k >= 0 && k < machineList.size()) {
                            machineFeasible.add(machineList.get(k) - 1);

                        Object timeObj = Tmachinetime.get(g).get(k);
                        Double timeValue;
                        if (timeObj instanceof Double) {
                            timeValue = (Double) timeObj;
                        } else if (timeObj instanceof Integer) {
                            timeValue = ((Integer) timeObj).doubleValue();
                        } else {
                            // 其他情况，可以根据需要进行处理
                            throw new IllegalArgumentException("不支持的类型: " + timeObj.getClass().getName());
                        }
                        corrTime.add(timeValue);
                    }
                    int minIndex = getMinIndex(machineFeasible, corrTime, listLoad);

                    //System.out.println("minLoadIndex "+minLoadIndex );
                    if (minIndex >= 0 && minIndex < machineFeasible.size()) {

                        int selectedMachine = machineFeasible.get(minIndex);
                        listLoad.set(selectedMachine, listLoad.get(selectedMachine) + corrTime.get(minIndex).intValue());
                        int index = sum(machines, g) + j;
                        if (i >= 0 && i < GS_num && index >= 0 && index < work.size()) {
                            MS[i][index] = selectedMachine;
                        }
                        }
                }}
            }
        }
        // 合并 MS 和 OS
        int[][] CHS1 = new int[GS_num][work.size() * 2];
        for (int i = 0; i < GS_num; i++) {
            for (int j = 0; j < work.size(); j++) {
                CHS1[i][j] = MS[i][j];
                CHS1[i][j + work.size()] = OS[i][j];
            }
        }
        return CHS1;
    }
    // 实现 sum 方法
    private int sum(Map<Integer, Integer> machines, Integer upToKey) {
        int sum = 0;
        for (Map.Entry<Integer, Integer> entry : machines.entrySet()) {
            if (entry.getKey().equals(upToKey)) {
                break;
            }
            sum += entry.getValue();
        }
        return sum;
    }
    public int[][] localInitial() {
        int[][] MS = createZeroMatrix(LS_num, work.size());
        int[][] OS = createZeroMatrix(LS_num, work.size());
        List<Integer> OS_list = new ArrayList<>(work); // 创建work的副本
        for (int i = 0; i < LS_num; i++) {
            Collections.shuffle(OS_list); // 随机打乱工序列表
            for (int j = 0; j < OS_list.size(); j++) {
                OS[i][j] = OS_list.get(j);
            }
            List<Integer> listLoad = new ArrayList<>(Collections.nCopies(machineNum, 0)); // 初始化机器负荷为0
            for (Integer g : machines.keySet()) {
                int subtaskCount = machines.get(g); // 获取任务的子任务数
                for (int j = 0; j < subtaskCount; j++) {
                    int highs = tom.get(g).get(j);
                    int lows = (j == 0) ? 0 : tom.get(g).get(j) - tdx.get(g).get(j);
                    List<Integer> machineFeasible = new ArrayList<>();
                    List<Double> corrTime = new ArrayList<>();
                    for (int k = lows; k < highs; k++) {
                        machineFeasible.add(Tmachine.get(g).get(k) - 1);
                        // 将 corrTime 添加的值强制转换为 Double
                        Object timeObj = Tmachinetime.get(g).get(k);
                        Double timeValue;
                        if (timeObj instanceof Double) {
                            timeValue = (Double) timeObj;
                        } else if (timeObj instanceof Integer) {
                            timeValue = ((Integer) timeObj).doubleValue();
                        } else {
                            // 其他情况，可以根据需要进行处理
                            throw new IllegalArgumentException("不支持的类型: " + timeObj.getClass().getName());
                        }
                        corrTime.add(timeValue);
                    }
                    int minLoadIndex = 0;
                    double minLoadValue = Double.MAX_VALUE;
                    for (int k = 0; k < machineFeasible.size(); k++) {
                        int machineIndex = machineFeasible.get(k);
                        if (machineIndex >= 0 && machineIndex < listLoad.size()) {
                            double loadValue = listLoad.get(machineIndex).doubleValue() + corrTime.get(k);
                            if (loadValue < minLoadValue) {
                                minLoadValue = loadValue;
                                minLoadIndex = k;
                            }
                        }
                    }
                    int selectedMachine = machineFeasible.get(minLoadIndex);
                    listLoad.set(selectedMachine, listLoad.get(selectedMachine) + corrTime.get(minLoadIndex).intValue());
                    MS[i][sum(machines, g) + j] = selectedMachine; // 注意：sum(machines, g) 需要实现这个方法
                }
            }
        }
        int[][] CHS1 = new int[LS_num][work.size() * 2];
        for (int i = 0; i < LS_num; i++) {
            for (int j = 0; j < work.size(); j++) {
                CHS1[i][j] = MS[i][j];
                CHS1[i][j + work.size()] = OS[i][j];
            }
        }

        return CHS1;
    }
    public int[][] randomInitial() {
        int[][] MS = createZeroMatrix(RS_num, work.size());
        int[][] OS = createZeroMatrix(RS_num, work.size());
        List<Integer> OS_list = new ArrayList<>(work); // 创建work的副本
        for (int i = 0; i < RS_num; i++) {
            Collections.shuffle(OS_list); // 随机打乱工序列表
            for (int j = 0; j < OS_list.size(); j++) {
                OS[i][j] = OS_list.get(j);
            }
            Random rand = new Random();
            List<Integer> GJ_list = new ArrayList<>(machines.keySet()); // 使用machines的键集副本
            for (Integer g : GJ_list) {
                int subtaskCount = 4; // 获取任务的子任务数
                List<Integer> tdxList = tdx.get(g); // 获取与 g 对应的 tdx 列表
                for (int j = 0; j < subtaskCount; j++) {
                    int index = sum(machines, g) + j;
                    if (0 <= index && index < MS[i].length) {
                        if (j < tdxList.size()) {
                            int maxMachineIndex = tdx.get(g).get(j); // 获取机器的最大索引
                            if (maxMachineIndex > 0) {
                                MS[i][index] = rand.nextInt(maxMachineIndex) + 1;
                            }
                        } else {
                            System.out.println("Warning: Index out of range for MS.");
                        }
                    }
                }
            }
        }
        int[][] CHS1 = new int[RS_num][work.size() * 2];
        for (int i = 0; i < RS_num; i++) {
            for (int j = 0; j < work.size(); j++) {
                CHS1[i][j] = MS[i][j];
                CHS1[i][j + work.size()] = OS[i][j];
            }
        }

        return CHS1;
    }
    public DecodeResult decode(int[] chrom) {
        int l = chrom.length;
        int[] MS = Arrays.copyOfRange(chrom, 0, l / 2);
        int[] OS = Arrays.copyOfRange(chrom, l / 2, l);
        int[] count = new int[jobNum];
        Arrays.fill(count, -1); //始化 count 数组
        List<Integer> mList = new ArrayList<>();
        List<Double> tListTime = new ArrayList<>();
        List<Double> mListCost = new ArrayList<>();
        for (int i : OS) {
            //String key = Integer.toString(i + 1); // 获取字符串键
            if (i < jobNum) {
                count[i]++;
                //Integer upToKey = Integer.toString(i+1); // 将 i 转换为字符串，以匹配 machines 中的键格式
                int index = sum(machines, i) + count[i];
            /*System.out.println("sum(machines, upToKey)"+sum(machines, upToKey));
            for (String key : machines.keySet()) {
                System.out.println("Key in machines: " + key);
            }*/

                if (index < MS.length) {
                    Integer key = i + 1;
                    if (Tmachine.containsKey(key) && tom.containsKey(key) && tdx.containsKey(key)) {
                        List<Integer> machineList = Tmachine.get(key);
                        List<Double> machineTimeList = Tmachinetime.get(key);
                        List<Double> machineCostList = Tmachinecost.get(key);
                        // 计算机器编号
                        int low = Math.max(tom.get(key).get(count[i]) - tdx.get(key).get(count[i]), 0);
                        int machineIndex = low + MS[index];
                        // 从列表中获取机器信息
                        if (machineIndex < machineList.size()) {
                            mList.add(machineList.get(machineIndex)); // 添加机器编号
                        } else {
                            // 如果索引超出 MS 数组长度，则在相应位置赋值为 0
                            mList.add(0);
                        }
                        // 检查索引是否在 machineTimeList 的范围内
                        if (machineIndex < machineTimeList.size()) {
                            Number machineTimeNumber = machineTimeList.get(machineIndex);
                            double machineTime;
                            // 检查 machineTimeNumber 的实际类型，并进行适当的转换
                            if (machineTimeNumber instanceof Double) {
                                machineTime = machineTimeNumber.doubleValue();
                            } else if (machineTimeNumber instanceof Integer) {
                                machineTime = machineTimeNumber.intValue();
                            } else {
                                machineTime = 0.0; // 或者其他适当的默认值
                            }
                            tListTime.add(machineTime);
                        } else {
                            tListTime.add(0.0); // 如果索引超出范围，则添加默认值
                        }
                        // 检查索引是否在 machineCostList 的范围内
                        if (machineIndex < machineCostList.size()) {
                            Number machineCostumber = machineCostList.get(machineIndex);
                            double machineCost;
                            //检查 machineTimeNumber 的实际类型，并进行适当的转换
                            if (machineCostumber instanceof Double) {
                                machineCost = machineCostumber.doubleValue();
                            } else if (machineCostumber instanceof Integer) {
                                machineCost = machineCostumber.intValue();
                            } else {
                                machineCost = 0.0; // 或者其他适当的默认值
                            }
                            mListCost.add(machineCost);
                        } else {
                            mListCost.add(0.0); // 如果索引超出范围，则添加默认值
                        }
                    } else {
                        // 如果索引超出范围，则在相应位置赋值为 0
                        mList.add(0);
                        tListTime.add(0.0);
                        mListCost.add(0.0);
                    }
                } else {
                    mList.add(0);
                    tListTime.add(0.0);
                    mListCost.add(0.0);
                }
            }
            }
        /*// 打印 tListTime 集合中每个元素的类型
        for (Object obj : tListTime) {
            System.out.println(obj.getClass().getName());
        }

// 打印 mListCost 集合中每个元素的类型
        for (Object obj : mListCost) {
            System.out.println(obj.getClass().getName());
        }*/
            // 将结果转换为数组
            int[] mArray = mList.stream().mapToInt(Integer::intValue).toArray();
            double[] tTimeArray = tListTime.stream()
                    .mapToDouble(number -> number.doubleValue())
                    .toArray();

            double[] mCostArray = mListCost.stream()
                    .mapToDouble(number -> number.doubleValue())
                    .toArray();
            return new DecodeResult(OS, mArray, tTimeArray, mCostArray);

    }
    // 定义一个内部类来保存解码结果
    public class DecodeResult {
        public int[] OS;
        public int[] MList;
        public double[] TListTime;
        public double[] MListCost;
        public DecodeResult(int[] OS, int[] MList, double[] TListTime, double[] MListCost) {
            this.OS = OS;
            this.MList = MList;
            this.TListTime = TListTime;
            this.MListCost = MListCost;
        }
        public int[] getOS() {
            return OS;
        }

        public int[] getMList() {
            return MList;
        }

        public double[] getTListTime() {
            return TListTime;
        }

        public double[] getMListCost() {
            return MListCost;
        }
    }

    public int[][] crossoverMachine(int[][] CHS1, int[][] CHS2) {
        Random rand = new Random();
        int r = rand.nextInt(operationNum - 1) + 1; // 在区间[1, operationNum-1]内产生一个整数r
        // 生成一个包含所有工序的随机序列
        int[] T_r = new int[operationNum];
        for (int i = 0; i < operationNum; i++) {
            T_r[i] = i;
        }
        shuffleArray(T_r); // 随机打乱工序的顺序
        // 执行交叉操作
        for (int i = 0; i < r; i++) {
            int index = T_r[i];
            // 交换两个染色体在该工序上的机器选择
            int temp = CHS1[0][index];
            CHS1[0][index] = CHS2[0][index];
            CHS2[0][index] = temp;
        }
        return new int[][] { CHS1[0], CHS2[0] };
    }
    // 随机打乱数组的辅助方法
    private void shuffleArray(int[] array) {
        Random rand = new Random();
        for (int i = array.length - 1; i > 0; i--) {
            int index = rand.nextInt(i + 1);
            // 简单的交换
            int a = array[index];
            array[index] = array[i];
            array[i] = a;
        }
    }
    public int[][] crossoverOperation(int[] CHS1, int[] CHS2) {
        Random rand = new Random();
        List<Integer> jobListCopy = new ArrayList<>(jobList); // jobList是某个成员变量
        Collections.shuffle(jobListCopy);
        int r = rand.nextInt(jobListCopy.size() - 1) + 1;
        List<Integer> set1 = jobListCopy.subList(0, r);
        List<Integer> set2 = jobListCopy.subList(r, jobListCopy.size());
        int[] newCHS1 = new int[operationNum];
        int[] newCHS2 = new int[operationNum];
        List<Integer> fixedPositionsCHS1 = new ArrayList<>();
        List<Integer> fixedPositionsCHS2 = new ArrayList<>();
        List<Integer> fixedValuesCHS1 = new ArrayList<>();
        List<Integer> fixedValuesCHS2 = new ArrayList<>();
        for (int i = 0; i < CHS1.length; i++) {
            if (set2.contains(CHS1[i])) {
                fixedPositionsCHS1.add(i);
                fixedValuesCHS1.add(CHS1[i]);
            }
            if (set1.contains(CHS2[i])) {
                fixedPositionsCHS2.add(i);
                fixedValuesCHS2.add(CHS2[i]);
            }
        }
        int count1 = 0, count2 = 0;
        for (int i = 0; i < operationNum; i++) {
            if (fixedPositionsCHS1.contains(i)) {
                if (count1 < fixedValuesCHS1.size()) {
                    newCHS1[i] = fixedValuesCHS1.get(count1++);
                }
            } else if (count2 < fixedValuesCHS2.size()) {
                newCHS1[i] = fixedValuesCHS2.get(count2++);
            }

            if (fixedPositionsCHS2.contains(i)) {
                if (count2 < fixedValuesCHS2.size()) { // 应使用 count2
                    newCHS2[i] = fixedValuesCHS2.get(count2++);
                }
            } else if (count1 < fixedValuesCHS1.size()) { // 应使用 count1
                newCHS2[i] = fixedValuesCHS1.get(count1++);
            }
        }
        return new int[][] { newCHS1, newCHS2 };
    }
    public MutationResult mutationMachine(int[] job, int[] machine, double[] machineTime, double[] machineCost) {
        Random rand = new Random();
        List<Integer> Tr = new ArrayList<>();
        for (int i = 0; i < operationNum; i++) {
            Tr.add(i);
        }

        int r = rand.nextInt(operationNum - 1) + 1;
        Collections.shuffle(Tr);
        List<Integer> T_r = Tr.subList(0, r);

        int[] count = new int[jobNum];
        Arrays.fill(count, -1); // 初始化 count 数组

        // 对选中的工序位置进行机器的变异
        for (int i : T_r) {
            int Job = job[i]; // 获取工序对应的工件编号
            count[Job] += 1; // 更新该工件的工序数
            // 确保 jobKey 存在于映射中
            String jobKey = String.valueOf(Job + 1);
            if (!tom.containsKey(jobKey) || !tdx.containsKey(jobKey) ||
                    !Tmachinetime.containsKey(jobKey) || !Tmachinecost.containsKey(jobKey) || !Tmachine.containsKey(jobKey)) {
                continue; // 如果键不存在，则跳过当前循环
            }
            List<Integer> tomList = tom.get(jobKey);
            List<Integer> tdxList = tdx.get(jobKey);
            // 确保 count[job[index]] 在 tomList 和 tdxList 的范围内
            int highIndex = Math.min(count[Job], tomList.size() - 1);
            int lowIndex = Math.min(count[Job], tdxList.size() - 1);
            int highs = tomList.get(highIndex);
            int lows = Math.max(highs - tdxList.get(lowIndex), 0); // 确保 lows 不小于 0
            List<Integer> machineList = Tmachine.get(jobKey);
            // 确保 highs 不超过 machineList 的大小
            highs = Math.min(highs, machineList.size());
            lows = Math.min(lows, highs); // 确保 lows 不超过 highs
            if (lows >= highs) {
                continue;
            }
            List<Integer> nMachine = Tmachine.get(jobKey).subList(lows, highs);
            List<Double> nTime = Tmachinetime.get(jobKey).subList(lows, highs);
            List<Double> nCost = Tmachinecost.get(jobKey).subList(lows, highs);
            double minValue = Double.MAX_VALUE;
            int minIndex = 0;
            for (int k = 0; k < nTime.size(); k++) {
                Double time = ensureDouble(nTime.get(k));
                Double cost = ensureDouble(nCost.get(k));
                double weightedObjective = weightTime * time + weightCost * cost;
                if (weightedObjective < minValue) {
                    minValue = weightedObjective;
                    minIndex = k;
                }
            }

            if (!nMachine.isEmpty()) {
                machine[i] = nMachine.get(minIndex);
            } else {
                // 处理空列表的情况，例如赋予默认值或者跳过
                machine[i] = 0; // 或者 continue;
            }
            if (minIndex >= 0 && !nTime.isEmpty() && minIndex < nTime.size()) {
                machineTime[i] = ensureDouble(nTime.get(minIndex));
                    machine[i] = nMachine.get(minIndex);
                }
                else {
                    machine[i] = 0; // 默认机器编号
                }

                if (minIndex >= 0 && !nCost.isEmpty() && minIndex < nCost.size()) {
                    machineCost[i] = ensureDouble(nCost.get(minIndex));
                } else {
                    machineCost[i] = 0.0; // 默认成本
                }
        }
        return new MutationResult(machine, machineTime, machineCost);
    }
    public class MutationResult {
        public int[] Machine;
        public double[] MachineTime;
        public double[] MachineCost;
        public MutationResult(int[] Machine, double[] MachineTime, double[] MachineCost) {
            this.Machine = Machine;
            this.MachineTime = MachineTime;
            this.MachineCost = MachineCost;
        }
    }
    public int[] mutationOperation(int[] job, int[] machine, double[] machineTime, double[] machineCost) {
        Random rand = new Random();
        int r = 4; // 工序变异的数量
        Set<Integer> selectedJobs = new HashSet<>();
        while (selectedJobs.size() < r) {
            int index = rand.nextInt(operationNum);
            selectedJobs.add(job[index]);
        }
        List<Integer> jobList = new ArrayList<>(selectedJobs);
        double minValue = Double.MAX_VALUE;
        int[] bestJob = job.clone();
        // 对每种工序位置组合进行处理
        for (int i = 1; i < factorial(jobList.size()); i++) {
            int[] newJob = job.clone();
            Collections.shuffle(jobList); // 随机打乱工件列表
            for (int j = 0; j < jobList.size(); j++) {
                newJob[selectedJobs.toArray(new Integer[0])[j]] = jobList.get(j);
            }
            CalculationResult result = calculate(newJob, machine, machineTime, machineCost);
            double finishTime = result.finalFinish; // 从 CalculationResult 中获取完成时间
            if (finishTime < minValue) {
                minValue = finishTime;
                bestJob = newJob.clone();
            }
        }
        return bestJob;
    }
    private int factorial(int n) {
        int result = 1;
        for (int i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }
    public CalculationResult calculate(int[] job, int[] machine, double[] machineTime, double[] machineCost) {
        double[] jobTime = new double[jobNum]; // 上一个工序的结束时间
        double[] tmm = new double[machineNum]; // 每台机器可用的最早时间
        List<Double> listS = new ArrayList<>();
        List<Double> listW = new ArrayList<>();
        double totalCost = 0.0;
        //System.out.println("Initial machine array length: " + machine.length);
        for (int i = 0; i < job.length; i++) {
            if (machine[i] > 0 && machine[i] <= machineNum) {
                //System.out.println(machine[i]);
                int svg = job[i]; // 当前工序所属的工件
                //System.out.println(i);
                int sig = machine[i] - 1; // 机器编号调整
                double startTime = Math.max(jobTime[svg], tmm[sig]);
                double endTime = startTime + machineTime[i];
                // 更新时间信息
                tmm[sig] = endTime;
                jobTime[svg] = endTime;
                // 更新列表和总成本
                listS.add(startTime);
                listW.add(machineTime[i]);
                totalCost += machineCost[i];
            }
        }
        double cFinish = max(tmm); // 最晚完工时间
        double finalFinish = weightTime * cFinish + weightCost * totalCost;
        return new CalculationResult(finalFinish, listS, listW);
    }
    private double max(double[] array) {
        double maxVal = 0.0;
        for (double val : array) {
            if (val > maxVal) {
                maxVal = val;
            }
        }
        return maxVal;
    }
    // 内部类，用于保存计算结果
    public class CalculationResult {
        public double finalFinish;
        public List<Double> startTimes;
        public List<Double> workTimes;

        public CalculationResult(double finalFinish, List<Double> startTimes, List<Double> workTimes) {
            this.finalFinish = finalFinish;
            this.startTimes = startTimes;
            this.workTimes = workTimes;
        }
    }
    public CalculationResult calculateWithErrors(int[] job, int[] machine, double[] machineTime, double[] machineCost,
                                                 Map<Pair, Double> errorMT) {
        /*System.out.println("Job array: " + Arrays.toString(job));
        System.out.println("Machine array: " + Arrays.toString(machine));
        System.out.println("Machine time array: " + Arrays.toString(machineTime));
        System.out.println("Machine cost array: " + Arrays.toString(machineCost));
        System.out.println("ErrorMT map: " + errorMT);*/
        double[] jobTime = new double[jobNum]; // 上一个工序的结束时间
        double[] tmm = new double[machineNum]; // 每台机器可用的最早时间
        // 应用 error_M_T 中的错误信息
        for (Map.Entry<Pair, Double> entry : errorMT.entrySet()) {
            Pair pair = entry.getKey();
            double time = entry.getValue();
            tmm[pair.machine ] = time;
            jobTime[pair.job] = time;
        }
        List<Double> listS = new ArrayList<>();
        List<Double> listW = new ArrayList<>();
        double totalCost = 0.0;
        for (int i = 0; i < job.length; i++) {
            int svg = job[i]; // 当前工序所属的工件
            if (machine[i]==0){
                int sig =machine[i];
                double startTime = Math.max(jobTime[svg], tmm[sig]);
                double endTime = startTime + machineTime[i];
                // 更新时间信息
                tmm[sig] = endTime;
                jobTime[svg] = endTime;
                // 更新列表和总成本
                listS.add(startTime);
                listW.add(machineTime[i]);
                totalCost += machineCost[i];
            }else {
                int sig = machine[i] - 1; // 机器编号调整
                double startTime = Math.max(jobTime[svg], tmm[sig]);
                double endTime = startTime + machineTime[i];
                // 更新时间信息
                tmm[sig] = endTime;
                jobTime[svg] = endTime;
                // 更新列表和总成本
                listS.add(startTime);
                listW.add(machineTime[i]);
                totalCost += machineCost[i];
            }
        }
        double cFinish = max(tmm); // 最晚完工时间
        double finalFinish = weightTime * cFinish + weightCost * totalCost;
        return new CalculationResult(finalFinish, listS, listW);
    }
    // 用于表示机器和工序对的内部类
    public static class Pair {
        public int machine;
        public int job;
        public Pair(int machine, int job) {
            this.machine = machine;
            this.job = job;
        }
        public int getMachine() {
            return machine;
        }

        public int getJob() {
            return job;
        }
        @Override
        public String toString() {
            return "Machine: " + machine + ", Job: " + job;
        }
    }
    // 用于表示序号和时间的内部类
    public static class FindIndexPair {
        public int index;
        public double remainingTime;

        public FindIndexPair(int index, double remainingTime) {
            this.index = index;
            this.remainingTime = remainingTime;
        }
    }
    // 用于返回 findIndex 方法结果的类
    public static class FindIndexResult {
        public List<FindIndexPair> car;
        public List<Integer> record;
        public FindIndexResult(List<FindIndexPair> car, List<Integer> record) {
            this.car = car;
            this.record = record;
        }
    }
    // findIndex 方法
    public FindIndexResult findIndex(List<Double> listS, List<Double> listW, double time) {
        List<FindIndexPair> car = new ArrayList<>();
        List<Integer> record = new ArrayList<>();
        for (int i = 0; i < listS.size(); i++) {
            if (listS.get(i) < time) {
                record.add(i);
                if (listS.get(i) + listW.get(i) > time) {
                    car.add(new FindIndexPair(i, listS.get(i) + listW.get(i) - time));
                }
            }
        }
        if (car.isEmpty()) {
            int maxRecord = record.isEmpty() ? -1 : record.stream().max(Integer::compare).orElse(-1);
            return new FindIndexResult(Arrays.asList(new FindIndexPair(maxRecord, 0.0)), record);
        } else {
            return new FindIndexResult(car, record);
        }
    }
    public Object[] gaInitial() {
        List<Double> answer = new ArrayList<>(); // 存储每个个体的完成时间
        int[][] CHS = new int[popsize][2 * work.size()];
        int begin = 1;
        int overallBestIndex = 1;
        int result = 1;
        // 初始化 CHS 和其他数组
        int[][] workJob1 = new int[popsize][work.size()];
        int[][] workJob = new int[popsize][work.size()];
        int[][] workM1 = new int[popsize][work.size()];
        int[][] workM = new int[popsize][work.size()];
        double[][] workT1 = new double[popsize][work.size()];
        double[][] workT = new double[popsize][work.size()];
        double[][] workC1 = new double[popsize][work.size()];
        double[][] workC = new double[popsize][work.size()];
        int[][] WorkJob2 = new int[popsize][work.size()];
        int[][] WorkM2 = new int[popsize][work.size()];
        double[][] WorkT2 = new double[popsize][work.size()];
        double[][] WorkC2 = new double[popsize][work.size()];

        int[][] randomInit = randomInitial(); // randomInitial 返回 int[][]
        for (int i = 0; i < RS_num; i++) {
            CHS[i] = randomInit[i];
        }
        // 打乱 CHS 数组
        shuffleCHS(CHS);
        if (begin!=1) {
            // 解码和计算适应度
            for (int i = 0; i < popsize; i++) {
                int[] chrom = CHS[i];
                //System.out.println("chrom"+chrom);
                DecodeResult decodeResult = decode(chrom);
                workJob[i] = decodeResult.getOS();
                workM[i] = decodeResult.getMList();
                workT[i] = decodeResult.getTListTime();
                workC[i] = decodeResult.getMListCost();

                CalculationResult calculationResult = calculate(workJob[i], workM[i], workT[i], workC[i]);
                double fitness = calculationResult.finalFinish; // 直接使用 finalFinish 作为适应度值
                answer.add(fitness);
                //System.out.println("Fitness: " + fitness);
            }
            //List<List<Double>> result = new ArrayList<>(); // 记录每一代的编号和最佳适应度值
            List<Double> allMinFitnesses = new ArrayList<>();
            List<Integer> allBestIndices = new ArrayList<>();
            // 主循环
            for (int gen = 0; gen < generation; gen++) {
                List<Double> answer1 = new ArrayList<>();

                int[][] workJobb = deepCopy(workJob);
                int[][] workMM = deepCopy(workM);
                double[][] workTT = deepCopy(workT);
                double[][] workCC = deepCopy(workC);

                int[][] workJob3 = deepCopy(workJob1);
                int[][] workM3 = deepCopy(workM1);
                double[][] workT3 = deepCopy(workT1);
                double[][] workC3 = deepCopy(workC1);
                for (int i = 0; i < popsize; i += 2) {
                    // 亲代1
                    int[] W1 = workJobb[i];
                    int[] M1 = workMM[i];
                    double[] T1 = workTT[i];
                    double[] C1 = workCC[i];
                    // 亲代2
                    int[] W2 = workJobb[i + 1];
                    int[] M2 = workMM[i + 1];
                    double[] T2 = workTT[i + 1];
                    double[] C2 = workCC[i + 1];
                    // 交叉操作
                    if (new Random().nextDouble() < p1) {
                        int[][] newM = crossoverMachine(new int[][]{M1}, new int[][]{M2});
                        M1 = newM[0];
                        M2 = newM[1];

                        int[][] newW = crossoverOperation(W1, W2);
                        W1 = newW[0];
                        W2 = newW[1];
                    }
                    // 变异操作
                    if (new Random().nextDouble() < p2) {
                        MutationResult mutationResult1 = mutationMachine(W1, M1, T1, C1);
                        M1 = mutationResult1.Machine;
                        T1 = mutationResult1.MachineTime;
                        C1 = mutationResult1.MachineCost;

                        MutationResult mutationResult2 = mutationMachine(W2, M2, T2, C2);
                        M2 = mutationResult2.Machine;
                        T2 = mutationResult2.MachineTime;
                        C2 = mutationResult2.MachineCost;

                        W1 = mutationOperation(W1, M1, T1, C1);
                        W2 = mutationOperation(W2, M2, T2, C2);
                    }

                    // 计算适应度并更新数组
                    CalculationResult result1 = calculate(W1, M1, T1, C1);
                    double fitness1 = result1.finalFinish;
                    answer1.add(fitness1);
                    workJob3[i] = W1;
                    workM3[i] = M1;
                    workT3[i] = T1;
                    workC3[i] = C1;

                    CalculationResult result2 = calculate(W2, M2, T2, C2);
                    double fitness2 = result2.finalFinish;
                    answer1.add(fitness2);
                    workJob3[i + 1] = W2;
                    workM3[i + 1] = M2;
                    workT3[i + 1] = T2;
                    workC3[i + 1] = C2;

                    // 将亲代和子代合并
                    WorkJob2 = combineArrays(workJob, workJob3);
                    WorkM2 = combineArrays(workM, workM3);
                    WorkT2 = combineArrays(workT, workT3);
                    WorkC2 = combineArrays(workC, workC3);

                    List<Double> combinedAnswer = new ArrayList<>(answer);
                    combinedAnswer.addAll(answer1);
                    List<Integer> bestIndices = getBestIndices(combinedAnswer, popsize);
                    workJob = selectBestFromArray(WorkJob2, bestIndices);
                    workM = selectBestFromArray(WorkM2, bestIndices);
                    workT = selectBestFromArray(WorkT2, bestIndices);
                    workC = selectBestFromArray(WorkC2, bestIndices);

                    // 更新answer列表
                    answer = bestIndices.stream().map(combinedAnswer::get).collect(Collectors.toList());

                    // 找到最小完工时间的个体
                    double minFitness = Collections.min(combinedAnswer);
                    int bestIndex = combinedAnswer.indexOf(minFitness);
                    allMinFitnesses.add(minFitness);
                    allBestIndices.add(bestIndex);
                    // 记录每一代的编号和最佳适应度值
                    //result.add(Arrays.asList((double) (gen + 1), minFitness));
                    // 返回最优解
                }
            }
            // 在所有迭代完成后，找到整个过程中的最佳适应度值及其索引
            double overallMinFitness = Collections.min(allMinFitnesses);
            //int overallBestIndex = allBestIndices.get(allMinFitnesses.indexOf(overallMinFitness));
        }

            return new Object[] {
                    WorkJob2[overallBestIndex],
                    WorkM2[overallBestIndex],
                    WorkT2[overallBestIndex],
                    WorkC2[overallBestIndex],
            };


    }
    private void printArray(int[][] array) {
        for (int[] row : array) {
            System.out.println(Arrays.toString(row));
        }
    }
    private int[][] combineArrays(int[][] array1, int[][] array2) {
        int totalLength = array1.length + array2.length;
        int[][] combined = new int[totalLength][];

        for (int i = 0; i < array1.length; i++) {
            combined[i] = array1[i];
        }
        for (int i = 0; i < array2.length; i++) {
            combined[i + array1.length] = array2[i];
        }
        return combined;
    }
    private double[][] combineArrays(double[][] array1, double[][] array2) {
        int totalLength = array1.length + array2.length;
        double[][] combined = new double[totalLength][];

        for (int i = 0; i < array1.length; i++) {
            combined[i] = array1[i];
        }
        for (int i = 0; i < array2.length; i++) {
            combined[i + array1.length] = array2[i];
        }
        return combined;
    }

    private List<Integer> getBestIndices(List<Double> fitnesses, int numberOfBest) {
        List<Integer> indices = IntStream.range(0, fitnesses.size())
                .boxed()
                .sorted(Comparator.comparing(fitnesses::get))
                .limit(numberOfBest)
                .collect(Collectors.toList());
        // 如果要确保返回的索引不超过 fitnesses 的大小，可以使用 subList
        return indices.subList(0, Math.min(numberOfBest, indices.size()));
    }

    private int[][] selectBestFromArray(int[][] array, List<Integer> indices) {
        int[][] selected = new int[indices.size()][];
        for (int i = 0; i < indices.size(); i++) {
            selected[i] = array[indices.get(i)];
        }
        return selected;
    }
    private double[][] selectBestFromArray(double[][] array, List<Integer> indices) {
        double[][] selected = new double[indices.size()][];
        for (int i = 0; i < indices.size(); i++) {
            selected[i] = array[indices.get(i)];
        }
        return selected;
    }
    private void shuffleCHS(int[][] CHS) {
        Random rand = new Random();
        for (int i = CHS.length - 1; i > 0; i--) {
            int index = rand.nextInt(i + 1);
            int[] temp = CHS[index];
            CHS[index] = CHS[i];
            CHS[i] = temp;
        }
    }
    // 深拷贝二维数组的方法
    private int[][] deepCopy(int[][] original) {
        if (original == null) {
            return null;
        }
        int[][] result = new int[original.length][];
        for (int i = 0; i < original.length; i++) {
            result[i] = Arrays.copyOf(original[i], original[i].length);
        }
        return result;
    }
    private double[][] deepCopy(double[][] original) {
        if (original == null) {
            return null;
        }
        double[][] result = new double[original.length][];
        for (int i = 0; i < original.length; i++) {
            result[i] = Arrays.copyOf(original[i], original[i].length);
        }
        return result;
    }
    public Object[]  gaTotal(Map<Double, Object> newCar, String initialTime, List<TaskAll2> tasks, List<CompanyAll2> companies) {
        Map<Pair, Double> errorMT = new HashMap<>();
        Map<Pair, Double> modifiedErrorMT = new HashMap<>();
        List<Object> dataList = new ArrayList<>();
        List<Double> arriveTime = new ArrayList<>(newCar.keySet());

        // 如果没有新到的车辆
        if (arriveTime.isEmpty()) {
            // 执行没有新车辆的逻辑，可能是直接返回当前的调度结果
            return new Object[] {dataList};
        }
        // 假设 gaInitial 返回一个Object数组，包含job, machine等信息
        Object[] gaResults = gaInitial();
        int[] job = (int[]) gaResults[0];
        int[] machine = (int[]) gaResults[1];
        double[] machineTime = (double[]) gaResults[2];
        double[] machineCost = (double[]) gaResults[3];
        Random random = new Random();
        int begin = 1;
        // 调用 calculate 方法并处理返回的 CalculationResult
        CalculationResult calculateResults = calculate(job, machine, machineTime, machineCost);
        double finalFinish = calculateResults.finalFinish;
        TaskAll2 selectedTask = tasks.get(random.nextInt(tasks.size()));
        Integer taskId = selectedTask.getId();
        //System.out.println("taskId"+ taskId);
        Integer taskType = selectedTask.getTaskType();
        Integer taskChainId = selectedTask.getChainId();
        //System.out.println("taskType"+ taskType);
        //System.out.println("taskChainId"+ taskChainId);
        List<CompanyAll2> matchingCompanies = findMatchingCompanies(companies, taskType, taskChainId);
        List<Double> listS = calculateResults.startTimes;
        List<Double> listW = calculateResults.workTimes;
        CompanyAll2 selectedCompany = matchingCompanies.get(random.nextInt(matchingCompanies.size()));
        Integer companyId = selectedCompany.getId();
        //System.out.println("companyId"+ companyId);
        System.out.println(arriveTime);
        System.out.println(arriveTime.size());
        CompanyAll2 selectedCompany1 = matchingCompanies.get(random.nextInt(matchingCompanies.size()));
        Integer companyId1 = selectedCompany1.getId();
        //System.out.println("companyId1"+ companyId1);
        if (begin!=1) {
            for (int k = 0; k < arriveTime.size(); k++) {
                double time = k == 0 ? arriveTime.get(k) : arriveTime.get(k) - arriveTime.get(k - 1);
                FindIndexResult indexResult = findIndex(listS, listW, time);
                List<Integer> finish = indexResult.record;
                // 更新 dataList
                for (int i : finish) {
                    double adjustedStartTime = listS.get(i) + (k == 0 ? 0 : arriveTime.get(k - 1));
                    double adjustedEndTime = adjustedStartTime + listW.get(i);
                    dataList.add(new Object[]{
                            machine[i], adjustedStartTime, adjustedEndTime, job[i]
                    });
                }
                // 更新错误信息
                //Map<Pair, Double> errorMT = new HashMap<>();
                for (FindIndexPair pair : indexResult.car) {
                    if (pair.index >= 0 && pair.index < machine.length && pair.index < job.length) {
                        errorMT.put(new Pair(machine[pair.index], job[pair.index]), pair.remainingTime);
                    }
                }
                // 将完成的工序对应的工件放入finish列表
                List<Integer> finishedJobs = finish.stream().map(i -> job[i]).collect(Collectors.toList());
// 统计每个工件的数量
                Map<Integer, Integer> counter1 = countOccurrences(job);
                Map<Integer, Integer> counter2 = countOccurrences(finishedJobs);
// 计算未完成的工件及其剩余工序数
                Map<Integer, Integer> counter = new HashMap<>(counter1);
                counter2.forEach((key, value) -> counter.merge(key, value, (v1, v2) -> v1 - v2));

                // 创建 job_list 来存储未完成的工件
                List<Integer> work = new ArrayList<>();
                List<Integer> jobList = new ArrayList<>(counter.keySet());
                Map<Integer, List<Integer>> TmachineCopy = deepCopyMapOfList(Tmachine);
                Map<Integer, List<Integer>> Tmachine1Copy = deepCopyMapOfList(Tmachine1);
                Map<Integer, List<Double>> TmachinetimeCopy = deepCopyMapOfListDouble(Tmachinetime);
                Map<Integer, List<Double>> TmachinecostCopy = deepCopyMapOfListDouble(Tmachinecost);
                Map<Integer, List<Integer>> tdxCopy = new HashMap<>(tdx);
                Map<Integer, List<Integer>> tdx_costCopy = new HashMap<>(tdx_cost);
                //List<Integer> workCopy = new ArrayList<>(work);
                Map<Integer, List<Integer>> tomCopy = new HashMap<>(tom);
                Map<Integer, List<Integer>> tom_costCopy = new HashMap<>(tom_cost);
                Map<Integer, Integer> machinesCopy = new HashMap<>(machines);
                // 遍历 counter 来更新 work、machines 和 tdx
                for (Map.Entry<Integer, Integer> entry : counter.entrySet()) {
                    Integer key = entry.getKey(); // 工件
                    Integer value = entry.getValue(); // 剩余工序数
                    // 检查 machines 是否包含 key
                    if (!machinesCopy.containsKey(key)) {
                        continue; // 如果不存在，跳过当前迭代
                    }
                    // 计算已经完成的工序数
                    int ind = machinesCopy.get(key) - value;
                    // 将工件按照剩余工序数加入到工作列表中
                    for (int i = 0; i < value; i++) {
                        work.add(entry.getKey());
                    }
                    // 更新 machines，表示工件剩余的工序数
                    machinesCopy.put(key, value);
                    // 更新 tdx
                    if (tdxCopy.containsKey(key)) {
                        List<Integer> tdxList = tdxCopy.get(key);
                        if (!tdxList.isEmpty()) {
                            int remainingOperations = tdxList.get(0) - value;
                            tdxList.set(0, remainingOperations);
                        }
                    }
                    if (ind != 0 && tomCopy.containsKey(key)) {
                        List<Integer> tomList = tomCopy.get(key);
                        if (!tomList.isEmpty()) {
                            Integer tomValue = tomList.get(0);
                            if (TmachineCopy.containsKey(key) && TmachineCopy.get(key).size() > tomValue) {
                                TmachineCopy.put(key, new ArrayList<>(TmachineCopy.get(key).subList(tomValue, TmachineCopy.get(key).size())));
                            }
                            if (TmachinetimeCopy.containsKey(key) && TmachinetimeCopy.get(key).size() > tomValue) {
                                TmachinetimeCopy.put(key, new ArrayList<>(TmachinetimeCopy.get(key).subList(tomValue, TmachinetimeCopy.get(key).size())));
                            }
                            if (TmachinecostCopy.containsKey(key) && TmachinecostCopy.get(key).size() > tomValue) {
                                TmachinecostCopy.put(key, new ArrayList<>(TmachinecostCopy.get(key).subList(tomValue, TmachinecostCopy.get(key).size())));
                            }
                        }
                    }
                }
                // 深拷贝 newCar 中的数组
                List<Object> car = deepCopyList((List<Object>) newCar.get(arriveTime.get(k)));
                Integer jobKey = Integer.valueOf(jobNum);

                jobList.add(jobNum);
                int numCar = (Integer) car.get(0);
                for (int i = 0; i < numCar; i++) {
                    work.add(jobNum);
                }
                jobNum++;

                TmachineCopy.put(jobKey, (List<Integer>) car.get(1));
                TmachinetimeCopy.put(jobKey, (List<Double>) car.get(2));
                machinesCopy.put(jobKey, numCar);
                TmachinecostCopy.put(jobKey, (List<Double>) car.get(3));
                tdxCopy.put(jobKey, (List<Integer>) car.get(4));
                tomCopy.put(jobKey, (List<Integer>) car.get(5));

                // 更新深拷贝的数据结构
                work = new ArrayList<>(work);
                machines = new HashMap<>(machinesCopy);
                Tmachine = deepCopyMapOfList(TmachineCopy);
                Tmachinetime = deepCopyMapOfList(TmachinetimeCopy);
                Tmachinecost = deepCopyMapOfList(TmachinecostCopy);
                tdx = deepCopyMapOfList(tdxCopy);
                tom = deepCopyMapOfList(tomCopy);
                // 假设这是类的成员变量
                List<Double> answer = new ArrayList<>(); // 存储每个个体的完成时间
                List<List<Double>> result = new ArrayList<>(); // 记录每一代的编号和最佳适应度值
                // 初始化结果数组
                int[][] workJob1 = new int[popsize][work.size()]; // 初始化空值
                int[][] workJob = new int[popsize][work.size()]; // 亲代工序单
                int[][] workM1 = new int[popsize][work.size()]; // 初始化空值
                int[][] workJob2 = new int[popsize][work.size()]; // 亲代工序单
                int[][] workM2 = new int[popsize][work.size()];
                int[][] workM = new int[popsize][work.size()]; // 亲代机器单
                double[][] workT1 = new double[popsize][work.size()]; // 初始化空值
                double[][] workT = new double[popsize][work.size()]; // 亲代处理时间单
                double[][] workC1 = new double[popsize][work.size()]; // 初始化空值
                double[][] workT2 = new double[popsize][work.size()]; // 亲代处理时间单
                double[][] workC2 = new double[popsize][work.size()];
                double[][] workC = new double[popsize][work.size()]; // 亲代成本
                for (Map.Entry<Pair, Double> entry : errorMT.entrySet()) {
                    Pair pair = entry.getKey();
                    pair.job += 1;  // 直接对 job 值加1
                    modifiedErrorMT.put(pair, entry.getValue());
                }
                int bestOverallIndex = -1; // 定义在循环外部，以便在循环结束后使用
                for (int gen = 0; gen < generation; gen++) {

                    if (gen < 1) { // 第一代的特殊处理
                        for (int i = 0; i < popsize; i++) {
                            // 初始化种群
                            Object[] initialResults = gaInitial();
                            workJob[i] = (int[]) initialResults[0];
                            workM[i] = (int[]) initialResults[1];
                            workT[i] = (double[]) initialResults[2];
                            workC[i] = (double[]) initialResults[3];

                            CalculationResult calcResult = calculateWithErrors(workJob[i], workM[i], workT[i], workC[i], errorMT);
                            double fitness = calcResult.finalFinish; // 使用 finalFinish 作为适应度值
                            answer.add(fitness);
                        }
                        double minFitness = Collections.min(answer);
                        result.add(Arrays.asList((double) (gen + 1), minFitness));
                    }
                    List<Double> answer1 = new ArrayList<>();
                    int[][] workJobb = deepCopy(workJob);
                    int[][] workMM = deepCopy(workM);
                    double[][] workTT = deepCopy(workT);
                    double[][] workCC = deepCopy(workC);
                    int[][] workJob3 = deepCopy(workJob1);
                    int[][] workM3 = deepCopy(workM1);
                    double[][] workT3 = deepCopy(workT1);
                    double[][] workC3 = deepCopy(workC1);
                    //System.out.println("解码完成");
                    // 后续代的处理
                    for (int i = 0; i < popsize; i += 2) {
                        int[] W1 = workJobb[i];
                        int[] M1 = workMM[i];
                        double[] T1 = workTT[i];
                        double[] C1 = workCC[i];

                        int[] W2 = workJobb[i + 1];
                        int[] M2 = workMM[i + 1];
                        double[] T2 = workTT[i + 1];
                        double[] C2 = workCC[i + 1];
                        if (Math.random() < p1) {
                            int[][] crossoverResultsW = crossoverOperation(W1, W2);
                            W1 = crossoverResultsW[0];
                            W2 = crossoverResultsW[1];

                            int[][] M1Array = new int[][]{M1};
                            int[][] M2Array = new int[][]{M2};
                            int[][] crossoverResultsM = crossoverMachine(M1Array, M2Array);
                            M1 = crossoverResultsM[0];
                            M2 = crossoverResultsM[1];
                            //System.out.println("交叉完成");
                        }
                        if (Math.random() < p2) {
                            MutationResult mutationResult1 = mutationMachine(W1, M1, T1, C1);
                            M1 = mutationResult1.Machine;
                            T1 = mutationResult1.MachineTime;
                            C1 = mutationResult1.MachineCost;

                            MutationResult mutationResult2 = mutationMachine(W2, M2, T2, C2);
                            M2 = mutationResult2.Machine;
                            T2 = mutationResult2.MachineTime;
                            C2 = mutationResult2.MachineCost;
                            //System.out.println("变异完成");
                        }
                        CalculationResult calcResult1 = calculateWithErrors(W1, M1, T1, C1, errorMT);
                        answer1.add(calcResult1.finalFinish);
                        workJob3[i] = W1;
                        workM3[i] = M1;
                        workT3[i] = T1;
                        workC3[i] = C1;

                        CalculationResult calcResult2 = calculateWithErrors(W2, M2, T2, C2, errorMT);
                        answer1.add(calcResult2.finalFinish);
                        workJob3[i + 1] = W2;
                        workM3[i + 1] = M2;
                        workT3[i + 1] = T2;
                        workC3[i + 1] = C2;
                    }
                    // 合并亲代和子代
                    workJob2 = combineArrays(workJob, workJob3);
                    workM2 = combineArrays(workM, workM3);
                    workT2 = combineArrays(workT, workT3);
                    workC2 = combineArrays(workC, workC3);
                    // 找到唯一的组合并获取索引，这部分在Java中稍微有点复杂
                    Set<String> uniqueSet = new HashSet<>();
                    List<Integer> uniqueIndices = new ArrayList<>();
                    for (int i = 0; i < workJob2.length; i++) {
                        String key = Arrays.toString(workJob2[i]) + Arrays.toString(workM2[i]);
                        if (!uniqueSet.contains(key)) {
                            uniqueSet.add(key);
                            uniqueIndices.add(i);
                        }
                    }
                    // 使用找到的唯一索引更新数组
                    workJob2 = selectBestFromArray(workJob2, uniqueIndices);
                    workM2 = selectBestFromArray(workM2, uniqueIndices);
                    workT2 = selectBestFromArray(workT2, uniqueIndices);
                    workC2 = selectBestFromArray(workC2, uniqueIndices);
                    // 合并 answer 和 answer1
                    List<Double> answer2 = new ArrayList<>(answer);
                    answer2.addAll(answer1);
                    answer2 = uniqueIndices.stream().map(answer2::get).collect(Collectors.toList());
                    List<Integer> bestIndices = getBestIndices(answer2, popsize);
                    workJob = selectBestFromArray(workJob2, bestIndices);
                    workM = selectBestFromArray(workM2, bestIndices);
                    workT = selectBestFromArray(workT2, bestIndices);
                    workC = selectBestFromArray(workC2, bestIndices);
                    // 更新 answer 列表
                    answer = bestIndices.stream().map(answer2::get).collect(Collectors.toList());
                    // 找到最小完工时间的个体
                    int bestIndex = answer2.indexOf(Collections.min(answer2));
                    if (bestOverallIndex == -1 || answer2.get(bestIndex) < answer2.get(bestOverallIndex)) {
                        bestOverallIndex = bestIndex;
                    }
                    result.add(new ArrayList<>(Arrays.asList((double) (gen + 1), answer2.get(bestIndex))));
                }
                if (bestOverallIndex != -1) {
                    int[] job11 = workJob2[bestOverallIndex];
                    int[] machine11 = workM2[bestOverallIndex];
                    double[] machineTime11 = workT2[bestOverallIndex];
                    double[] machineCost11 = workC2[bestOverallIndex];

                    CalculationResult calcResult = calculateWithErrors(job11, machine11, machineTime11, machineCost11, errorMT);
                    double makeSpan = calcResult.finalFinish;
                    List<Double> listS11 = calcResult.startTimes;
                    List<Double> listW11 = calcResult.workTimes;
                }
            }
            //double endRange = makeSpan + arriveTime.get(arriveTime.size() - 1);
            if (job.length > 0 && listS.size() >= job.length && listW.size() >= job.length) {
                for (int i = 0; i < job.length; i++) {
                    double adjustedStartTime = listS.get(i) + arriveTime.get(arriveTime.size() - 1);
                    double adjustedEndTime = adjustedStartTime + listW.get(i);
                    dataList.add(new Object[]{
                            machine[i], adjustedStartTime, adjustedEndTime, job[i]
                    });
                }
            }
        }

        return new Object[]{taskId, companyId, companyId1};
        }
    private <T> Map<Integer, List<T>> deepCopyMapOfList(Map<Integer, List<T>> original) {
        Map<Integer, List<T>> copy = new HashMap<>();
        for (Map.Entry<Integer, List<T>> entry : original.entrySet()) {
            copy.put(entry.getKey(), new ArrayList<>(entry.getValue()));
        }
        return copy;
    }

    private Map<Integer, List<Double>> deepCopyMapOfListDouble(Map<Integer, List<Double>> original) {
        Map<Integer, List<Double>> copy = new HashMap<>();
        for (Map.Entry<Integer, List<Double>> entry : original.entrySet()) {
            copy.put(entry.getKey(), new ArrayList<>(entry.getValue()));
        }
        return copy;
    }

    public static <T> List<T> deepCopyList(List<T> original) {
        List<T> copy = new ArrayList<>();
        for (T item : original) {
            if (item instanceof List) {
                // 如果元素是列表，则递归地进行深拷贝
                copy.add((T) deepCopyList((List<?>) item));
            } else {
                // 对于基本类型和不可变对象，直接添加
                copy.add(item);
            }
        }
        return copy;
    }

    public static <K, V> Map<K, V> deepCopyMap(Map<K, V> original) {
        Map<K, V> copy = new HashMap<>();
        for (Map.Entry<K, V> entry : original.entrySet()) {
            // 假设映射中的键和值都是基本数据类型或已经实现了深拷贝
            copy.put(entry.getKey(), entry.getValue());
        }
        return copy;
    }
    // 用于统计数组中每个元素出现的次数的辅助方法
    private Map<Integer, Integer> countOccurrences(int[] array) {
        Map<Integer, Integer> occurrences = new HashMap<>();
        for (int value : array) {
            occurrences.merge(value, 1, Integer::sum);
        }
        return occurrences;
    }

    // 用于统计列表中每个元素出现的次数的辅助方法
    private Map<Integer, Integer> countOccurrences(List<Integer> list) {
        Map<Integer, Integer> occurrences = new HashMap<>();
        for (int value : list) {
            occurrences.merge(value, 1, Integer::sum);
        }
        return occurrences;
    }
    private int getMinIndex(List<Integer> machineFeasible, List<Double> corrTime, List<Integer> listLoad) {
        int minIndex = -1;
        double minValue = Double.MAX_VALUE;

        for (int i = 0; i < machineFeasible.size(); i++) {
            int loadIndex = machineFeasible.get(i);

            // 确保 loadIndex 在 listLoad 的范围内，同时 i 在 corrTime 的范围内
            if (loadIndex >= 0 && loadIndex < listLoad.size() && i >= 0 && i < corrTime.size()) {
                double tempValue = listLoad.get(loadIndex).doubleValue() + corrTime.get(i);
                if (tempValue < minValue) {
                    minValue = tempValue;
                    minIndex = i;
                }
            }

        }
        return minIndex;
    }
    private Double ensureDouble(Object obj) {
        if (obj instanceof Double) {
            return (Double) obj;
        } else if (obj instanceof Integer) {
            return ((Integer) obj).doubleValue();
        } else {
            return 0.0; // 或者抛出一个异常
        }
    }
    private  List <CompanyAll2> findMatchingCompanies(List <CompanyAll2> companies, Integer taskType, Integer taskChainId){
        return companies.stream()
                .filter(company -> company.getCompanyType().equals(taskType) && company.getLayerId().equals(taskChainId))
                .collect(Collectors.toList());

    }

}


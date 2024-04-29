package com.ruoyi.project.multimode.service.impl;
import com.ruoyi.project.multimode.domain.CompanyAll2;
import com.ruoyi.project.multimode.domain.SubtaskResult;
import com.ruoyi.project.multimode.domain.TaskAll2;
import com.ruoyi.project.multimode.mapper.CompanyAllMapper;
import com.ruoyi.project.multimode.mapper.TaskAllMapper;
import com.ruoyi.project.multimode.service.TaskBreakdownService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class TaskBreakdownServiceImpl implements TaskBreakdownService {
    @Resource(name="taskAllMapper2")
    private TaskAllMapper taskallMapper;

    @Resource(name="companyAllMapper2")
    private CompanyAllMapper companyallMapper;

    @Override
    public List<SubtaskResult> calculateSubtaskResults() {
        List<SubtaskResult> results = new ArrayList<>();
        List<TaskAll2> tasks = taskallMapper.selectActiveTasks();
        int begin = 1;
        List<CompanyAll2> companies = companyallMapper.selectAllCompanies();

        // 对每个任务进行处理
        for (TaskAll2 taskall : tasks) {
            int[] vals = splitValueRandomly(taskall.getVal());
            int[] durations = splitValueRandomly(taskall.getDuration());

            if(begin!= 1) {
                for (int i = 0; i < 4; i++) { // Assume there are always 4 subtasks
                    for (CompanyAll2 companyall : companies) {
                        SubtaskResult result = new SubtaskResult();
                        result.setCompanyId(companyall.getId());
                        result.setLayerId(companyall.getLayerId());
                        result.setGroupId(companyall.getGroupId());
                        result.setTaskId(taskall.getId());
                        result.setSubtaskId(i + 1); // Subtask ID from 1 to 4
                        result.setCost(vals[i] / (double) companyall.getProcessRate());
                        result.setTime(durations[i] / (double) companyall.getProcessRate());
                        results.add(result);
                    }
                }
            }
        }
        return results;
    }


    private int[] splitValueRandomly(int value) {
        int[] parts = new int[4];
        Random random = new Random();
        int remaining = value - 4; // Ensure each part has at least 1
        for (int i = 0; i < 3; i++) { // Split into parts, leaving at least 1 for the last part
            int part = remaining == 0 ? 0 : random.nextInt(remaining + 1);
            parts[i] = part + 1; // Ensure at least 1
            remaining -= part;
        }
        parts[3] = remaining + 1; // Last part
        return parts;
    }

}

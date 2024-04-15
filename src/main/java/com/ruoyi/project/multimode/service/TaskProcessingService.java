package com.ruoyi.project.multimode.service;

import java.util.List;

public interface TaskProcessingService {

    void processTaskAllocationResult(Integer taskId, List<Integer> machinesForJob, Integer mode);
}

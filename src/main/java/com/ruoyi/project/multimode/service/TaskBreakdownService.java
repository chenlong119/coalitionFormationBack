package com.ruoyi.project.multimode.service;
import com.ruoyi.project.multimode.domain.SubtaskResult;

import java.util.List;
public interface TaskBreakdownService {
    List<SubtaskResult> calculateSubtaskResults();
}

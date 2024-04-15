package com.ruoyi.project.income.service.impl;

import com.ruoyi.project.income.dto.GraphNodeDTO;

import java.util.*;

public class NodeCoordinateGenerator {
    private Map<Integer, List<GraphNodeDTO>> companyNodeMap;
    private Map<Integer, Map<Integer, List<GraphNodeDTO>>> companyLayerNodeMap;
    private Map<Integer, double[]> layerPoints;

    private List<GraphNodeDTO> newNodeList = new ArrayList<>();

    public List<GraphNodeDTO> generateCoordinates(List<GraphNodeDTO> nodeList, double[][] points) {
        // 1. 获取平行四边形的坐标列表
        layerPoints = new HashMap<>();
        for (int i = 0; i < points.length; i++) {
            layerPoints.put(i, points[i]);
        }
        // 2. 获取节点列表并按企业ID进行分组
        companyNodeMap = new HashMap<>();
        for (GraphNodeDTO node : nodeList) {
            int companyId = node.getCompanyId();
            List<GraphNodeDTO> companyNodes = companyNodeMap.getOrDefault(companyId, new ArrayList<>());
            companyNodes.add(node);
            companyNodeMap.put(companyId, companyNodes);
        }
        // 3. 将节点按照企业ID和层数进行分组
        companyLayerNodeMap = new HashMap<>();
        for (Map.Entry<Integer, List<GraphNodeDTO>> entry : companyNodeMap.entrySet()) {
            int companyId = entry.getKey();
            List<GraphNodeDTO> companyNodes = entry.getValue();
            Map<Integer, List<GraphNodeDTO>> layerNodeMap = new HashMap<>();
            for (GraphNodeDTO node : companyNodes) {
                int layer = node.getLayer();
                List<GraphNodeDTO> layerNodes = layerNodeMap.getOrDefault(layer, new ArrayList<>());
                layerNodes.add(node);
                layerNodeMap.put(layer, layerNodes);
            }
            companyLayerNodeMap.put(companyId, layerNodeMap);
        }
        // 4. 为每个节点生成随机的y坐标和x坐标
        newNodeList = generateRandomCoordinates();
        Collections.sort(newNodeList, Comparator.comparingInt(GraphNodeDTO::getLocationId));

        return newNodeList;
    }

    private List<GraphNodeDTO> generateRandomCoordinates() {
        List<GraphNodeDTO> resultList = new ArrayList<>();

        for (Map.Entry<Integer, Map<Integer, List<GraphNodeDTO>>> entry : companyLayerNodeMap.entrySet()) {
            int companyId = entry.getKey();
            Map<Integer, List<GraphNodeDTO>> layerNodeMap = entry.getValue();
            boolean isFirstCompanyNode = true;
            // 存储每个 companyId 中第一个节点的 x 坐标
            double xCoordinateFirst = -1;
            // 存储每个 companyId 的 y 坐标相对边界的距离
            double yCoordinateDistance = -1;
            for (Map.Entry<Integer, List<GraphNodeDTO>> layerEntry : layerNodeMap.entrySet()) {
                int layer = layerEntry.getKey();
                List<GraphNodeDTO> nodes = layerEntry.getValue();
                double[] points = layerPoints.get(layer - 1);
                double minX = points[0];
                double minY = points[1];
                double maxX = points[2];
                double maxY = points[3]-50;

                for (int i = 0; i < nodes.size(); i++) {
                    GraphNodeDTO node = nodes.get(i);
                    double xCoordinate;
                    double yCoordinate;
                    while (true) {
                        if (isFirstCompanyNode) {
                            // 如果是第一个节点，设置 x 坐标
                            xCoordinateFirst = minX + Math.random() * (maxX - minX);
                            xCoordinate = xCoordinateFirst;
                            // 如果是第一个节点，设置 y 坐标
                            double randomY = minY + Math.random() * (maxY - minY);
                            // 将随机的 y 坐标调整到 maxY 和 minY 的中间位置
                            double middleY = (maxY + minY) / 2.0;
                            yCoordinate = randomY + (middleY - randomY) * 0.3; // 调整因子为 0.3，可以根据需要进行调整
                            // 计算每个节点的相对位置
                            yCoordinateDistance = randomY - minY;
                        }else{
                            xCoordinate = xCoordinateFirst;
                            yCoordinate = minY + yCoordinateDistance;
                        }
                        boolean isWithinRange = checkPointsWithinRange(resultList, xCoordinate, yCoordinate, 50);
                        if (!isWithinRange) {
                            break; // 生成的点符合要求，退出循环
                        }
                    }
                    // 设置节点的 x 坐标和相对位置的 y 坐标
                    node.setLocationX(xCoordinate);
                    node.setLocationY(yCoordinate);
                    resultList.add(node);
                    isFirstCompanyNode = false;
                }
            }
        }
        return resultList;
    }

    // 检查点是否固定间隔距离内有其他点
    private boolean checkPointsWithinRange(List<GraphNodeDTO> nodes, double x, double y, double range) {
        for (GraphNodeDTO node : nodes) {
            // 计算点之间的距离
            double distance = Math.sqrt(Math.pow(node.getLocationX() - x, 2) + Math.pow(node.getLocationY() - y, 2));
            if (distance <= range) {
                return true;
            }
        }
        return false;
    }

}
package com.ruoyi.project.taskallocation.test;

import java.util.ArrayList;
import java.util.List;

public class Point {
    double x;
    double y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    /**
     * 给定一个平行四边形的端点，顺序为左上，右上，右下，左下和四边形中已有的点，
     * 给出新增加点的位置，使得点在四边形中均匀分布
     *
     * @param layer 平行四边形的端点
     * @param pos   已有点的位置
     * @return 新增加点的位置
     */
    private Point getPosition(List<Point> layer, List<Point> pos) {
        // 计算平行四边形的对角线中点
        double centerX = (layer.get(0).x + layer.get(2).x) / 2;
        double centerY = (layer.get(0).y + layer.get(2).y) / 2;

        // 新增加点的位置列表
        List<Point> newPoints = new ArrayList<>();

        // 插入新点到平行四边形的对角线中点与已有点的中点之间
        for (Point existingPoint : pos) {
            double newX = (centerX + existingPoint.x) / 2;
            double newY = (centerY + existingPoint.y) / 2;
            newPoints.add(new Point(newX, newY));
        }

        return newPoints.get(0); // 返回第一个新增加的点，你也可以根据具体需求修改返回值
    }

    public static void main(String[] args) {
        // 示例用法
        List<Point> layer = new ArrayList<>();
        layer.add(new Point(0, 0));
        layer.add(new Point(2, 0));
        layer.add(new Point(2, 2));
        layer.add(new Point(0, 2));

        List<Point> existingPoints = new ArrayList<>();
        existingPoints.add(new Point(1, 1));

        Point newPoint = new Point(0, 0).getPosition(layer, existingPoints);
        System.out.println("New Point: (" + newPoint.x + ", " + newPoint.y + ")");
    }
}

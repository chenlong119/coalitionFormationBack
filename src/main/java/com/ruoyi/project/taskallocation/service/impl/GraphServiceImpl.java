package com.ruoyi.project.taskallocation.service.impl;

import com.ruoyi.framework.redis.RedisCache;
import com.ruoyi.project.taskallocation.domain.*;
import com.ruoyi.project.taskallocation.mapper.BusinessMapper;
import com.ruoyi.project.taskallocation.mapper.GraphMapper;
import com.ruoyi.project.taskallocation.service.GraphService;
import java.util.*;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class GraphServiceImpl implements GraphService {

  @Autowired GraphMapper graphMapper;
  @Autowired BusinessMapper businessMapper;
  @Autowired RedisCache redisCache;

  @Override
  public List<NodeDto> getNodes(LayerDto layerDto) {
    // 根据传入的参数确定每个层的四个点
    Integer lb = layerDto.getLb();
    Integer lt = layerDto.getLt();
    Integer height = layerDto.getHeight();
    Integer width = layerDto.getWidth();
    Integer layers1 = layerDto.getLayers1();
    Integer gap = layerDto.getGap();
    Integer layere1 = layers1 + height;
    Integer rt = lt + width;
    Integer rb = lb + width;

    List<Point> layer1 = new ArrayList<>();
    List<Point> layer2 = new ArrayList<>();
    List<Point> layer3 = new ArrayList<>();
    Integer layers2 = layere1 + gap;
    Integer layere2 = layers2 + height;
    Integer layers3 = layere2 + gap;
    Integer layere3 = layers3 + height;
    formLayer(layer1, lt, layers1, rt, rb, layere1, lb);
    formLayer(layer2, lt, layers2, rt, rb, layere2, lb);
    formLayer(layer3, lt, layers3, rt, rb, layere3, lb);
    List<Point> nodeInLayer1 = new ArrayList<>();
    List<Point> nodeInLayer2 = new ArrayList<>();
    List<Point> nodeInLayer3 = new ArrayList<>();
    List<List<Point>> layers = Arrays.asList(layer1, layer2, layer3);
    List<List<Point>> nodePositions = Arrays.asList(nodeInLayer1, nodeInLayer2, nodeInLayer3);
    List<Business> nodes = graphMapper.getNodes();
    Map<Long, String> stateMap = new HashMap<>();
    stateMap.put(1L, "空闲");
    stateMap.put(2L, "工作");
    List<NodeDto> list =
        nodes.stream()
            .map(
                bus -> {
                  int layer = bus.getLayer().intValue();
                  List<Point> pos = nodePositions.get(layer);
                  Point point = getPosition(layers.get(layer), pos, 50);
                  pos.add(point);
                  BusinessDto businessDto = new BusinessDto();
                  BeanUtils.copyProperties(bus, businessDto);
                  businessDto.setState(stateMap.get(bus.getState()));
                  List<Double> geoPos = new ArrayList<>();
                  geoPos.add(bus.getLongitude());
                  geoPos.add(bus.getLatitude());
                  return new NodeDto(
                      bus.getId().toString(),
                      bus.getName(),
                      bus.getTask(),
                      point.getX(),
                      point.getY(),
                      businessDto,
                      geoPos);
                })
            .collect(Collectors.toList());
    return list;
  }

  @Override
  public List<LinkDto> getLinks() {
    List<Business> nodes = graphMapper.getNodes();
    List<LinkDto> res = new ArrayList<>();
    nodes.stream()
        .forEach(
            bus -> {
              String id = bus.getId().toString();
              String busName = bus.getName();
              String[] neighbors = bus.getNeighbor().split(",");
              List<LinkDto> collect =
                  Arrays.stream(neighbors)
                      .map(
                          nei -> {
                            String neiName = graphMapper.getBusnissNameById(Integer.parseInt(nei));
                            if (neiName.equals(busName)) {
                              return new LinkDto(id, nei, new LineStyle("dashed"));
                            }
                            return new LinkDto(id, nei, null);
                          })
                      .collect(Collectors.toList());
              for (LinkDto link : collect) {
                List<LinkDto> list =
                    res.stream()
                        .filter(
                            l ->
                                l.getSource().equals(link.getTarget())
                                    && l.getTarget().equals(link.getSource()))
                        .collect(Collectors.toList());
                if (list.isEmpty()) {
                  res.add(link);
                }
              }
            });
    return res;
  }

  @Override
  public Boolean isLoading() {
    Boolean hasKey = redisCache.hasKey("chy:loading");
    if (hasKey) {
      redisCache.deleteObject("chy:loading");
      return true;
    }
    return false;
  }

  /**
   * 给定一个平行四边形的端点，顺序为左上，右上，右下，左下和四边形中已有的点， 给出新增加点的位置(在四边形内)，使得新增加点的位置与pos中的点距离>=dis
   *
   * @param layer 平行四边形的端点
   * @param pos 已有点的位置
   * @param dis 距离阈值
   * @return 新增加点的位置
   */
  private Point getPosition(List<Point> layer, List<Point> pos, int dis) {
    double lt = layer.get(0).getX();
    double rb = layer.get(2).getX();
    double y1 = layer.get(0).getY();
    double y2 = layer.get(2).getY();
    Random random = new Random();
    int newx;
    int newy;
    while (true) {
      newx = random.nextInt((int) (rb - 30 - lt)) + (int) lt;
      newy = random.nextInt((int) (y2 - 30 - y1)) + (int) y1;
      Point newPoint = new Point(newx, newy);
      boolean flag = true;
      for (Point existingPoint : pos) {
        // 计算新增加点与已有点的距离
        double distance =
            Math.sqrt(
                Math.pow(newPoint.getX() - existingPoint.getX(), 2)
                    + Math.pow(newPoint.getY() - existingPoint.getY(), 2));
        if (distance < dis) {
          flag = false;
          break;
        }
      }
      if (flag) {
        return newPoint;
      }
    }
  }

  private void formLayer(
      List<Point> layer1,
      Integer lt,
      Integer layers1,
      Integer rt,
      Integer rb,
      Integer layere1,
      Integer lb) {
    layer1.add(new Point(lt, layers1));
    layer1.add(new Point(rt, layers1));
    layer1.add(new Point(rb, layere1));
    layer1.add(new Point(lb, layere1));
  }
}

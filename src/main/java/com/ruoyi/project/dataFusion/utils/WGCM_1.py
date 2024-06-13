# Ni, Chengzhang, et al. "Seeding Strategy Based on Weighted Gravity Centrality in Multiplex Networks." IEEE Transactions on Network Science and Engineering 10.1 (2022): 331-345.
import sys
import traceback

import networkx as nx
import numpy as np

# 设置随机数种子以确保重现性
np.random.seed(42)
point_number = 40
layer_number = 3
try:
    # 读取交互矩阵
    supplyAdjacencyMatrix = sys.argv[1]
    competitionAdjacencyMatrix = sys.argv[2]
    cooperationAdjacencyMatrix = sys.argv[3]


    # 从文件中加载矩阵
    supplyAdjacency = np.loadtxt(supplyAdjacencyMatrix)
    competitionAdjacency = np.loadtxt(competitionAdjacencyMatrix)
    cooperationAdjacency = np.loadtxt(cooperationAdjacencyMatrix)


except Exception as e:
    print(f"An error occurred: {e}")
    traceback.print_exc()
    sys.exit(1)

# 假设我们有一个多层网络的列表，每个元素是一个 networkx 图表示一层
adj_matrices = [
    supplyAdjacency,cooperationAdjacency,competitionAdjacency
]
# print(adj_matrices)

# 从邻接矩阵创建多层网络的图
multi_layer_network = [nx.from_numpy_array(adj_matrix) for adj_matrix in adj_matrices]
# print(multi_layer_network)

# 计算每一层的节点度数并将其累加
total_degrees = np.sum([np.sum(adj_matrix, axis=1) for adj_matrix in adj_matrices], axis=0)


def Gamma_R(d, rr):
    ga = 0
    if d <= rr:
        ga = 1
    else:
        ga = 0
    result = d * ga
    if np.isnan(result):
        raise ValueError("返回值是NaN，发生错误")

    return result


# 初始化 D 矩阵
D = np.zeros((point_number, point_number))
R = 2
# 计算 D 矩阵的每个元素
for i in range(point_number):
    for j in range(point_number):
        if i != j:  # 排除自环的情况
            for l in range(layer_number):
                try:
                    # 获取层l上节点和之间的最短路径长度
                    d_ij_l = nx.shortest_path_length(multi_layer_network[l], source=i, target=j)
                    s_d_ij_l = 1 / d_ij_l
                    D[i, j] += Gamma_R(s_d_ij_l, R)

                    # exit()
                except nx.NetworkXNoPath:  # 如果在层l上节点和之间没有路径
                    D[i, j] += 0
            D[i, j] = 1 / D[i, j]
            if D[i, j] == 0:
                D[i, j] = np.inf

# print(D)

WGCM = np.zeros(point_number)
for i in range(point_number):
    for j in range(point_number):
        if i !=j:
            WGCM[i] += total_degrees[i] * total_degrees[j] / (D[i, j] * D[i, j])

# print(WGCM)
sorted_index = sorted(range(len(WGCM)), key=lambda x: WGCM[x], reverse=True)
np.savetxt('sorted_index.txt', sorted_index, fmt='%d',delimiter=',')


# 我自己写的迭代很快的版本
import ast
import numpy as np
import sys
from sklearn import preprocessing
import traceback

# from tqdm import tqdm

# 生成若干个企业
num_companies = 40
np.random.seed(1234)


try:
    # 读取相似度矩阵和交互矩阵
    similarity_matrix_path = sys.argv[1]
    inter_matrix_path = sys.argv[2]

    # print("path1", similarity_matrix_path)
    # print("path2", inter_matrix_path)
    # 从文件中加载矩阵
    sim_matrix = np.loadtxt(similarity_matrix_path)
    inter_matrix = np.loadtxt(inter_matrix_path)

    print("sim", sim_matrix)
    print("inner", inter_matrix)

except Exception as e:
    print(f"An error occurred: {e}")
    traceback.print_exc()
    sys.exit(1)
# sim_matrix = np.zeros((num_companies, num_companies))
# # 随机生成相似度数据（假设相似度在0到1之间）
# for i in range(num_companies):
#     for j in range(i + 1, num_companies):
#         similarity = np.random.rand()  # 随机生成相似度
#         sim_matrix[i, j] = similarity
#         sim_matrix[j, i] = similarity  # 对称矩阵
#
# # 初始化一个50x50的矩阵来存储交互频率数据
# inter_matrix = np.zeros((num_companies, num_companies))
#
# # 随机生成交互频率数据（假设频率在0到100之间）
# for i in range(num_companies):
#     for j in range(i + 1, num_companies):
#         frequency = np.random.randint(0, 2)  # 随机生成交互频率
#         inter_matrix[i, j] = frequency
#         inter_matrix[j, i] = frequency  # 对称矩阵
#
# inter_matrix = preprocessing.minmax_scale(inter_matrix, axis=0)





# 创建一个与相似度数据和交互频率数据相同大小的全为1的辅助变量矩阵
aux_matrix = np.ones((num_companies, num_companies))

np.fill_diagonal(aux_matrix, 0)

# 初始化预测强度关系矩阵
re_strength_matrix = aux_matrix

# 输入真实的关系强度矩阵
true_relation_strength_matrix = np.zeros((num_companies, num_companies))
for i in range(num_companies):
    for j in range(num_companies):
        strength = np.random.randint(0, 10)  # 随机生成交互频率
        true_relation_strength_matrix[i, j] = strength
np.fill_diagonal(true_relation_strength_matrix, 0)
# print(true_relation_strength_matrix)


lambda1 = 0.3
lambda2 = 0.2
alpha = 0.5
beta = 0.5
w = 0.5
v = 0.5
C = 1


def likelihood():
    fun = - 1 / 2 * v * np.sum(np.square(
        alpha * re_strength_matrix + beta * aux_matrix - inter_matrix)) - lambda1 / 2 * w * w - 1 / 2 * v * np.sum(
        np.square(w * sim_matrix - relation_strength_matrix)) - lambda2 / 2 * (alpha * alpha + beta * beta) + C
    return fun


def first_derivative(similarity_matrix, interaction_matrix, relation_strength_matrix, auxiliary_matrix):
    first_derivative_T = 1 / v * (w * similarity_matrix - relation_strength_matrix) - alpha / v * (
            alpha * relation_strength_matrix + beta * auxiliary_matrix - interaction_matrix)
    first_derivative_alpha = - lambda2 * alpha - np.sum(relation_strength_matrix / v * (
            alpha * relation_strength_matrix + beta * auxiliary_matrix - interaction_matrix))
    first_derivative_beta = - lambda2 * beta - np.sum(
        auxiliary_matrix / v * (alpha * relation_strength_matrix + beta * auxiliary_matrix - interaction_matrix))
    first_derivative_w = -lambda1 * w - 1 / v * np.sum(
        similarity_matrix * (w * similarity_matrix - relation_strength_matrix))
    return first_derivative_T, first_derivative_alpha, first_derivative_beta, first_derivative_w


def second_derivative(similarity_matrix, relation_strength_matrix, auxiliary_matrix):
    second_derivative_T = - (1 + alpha * alpha) / v
    second_derivative_alpha = - lambda2 - 1 / v * np.sum(np.square(relation_strength_matrix))
    second_derivative_beta = - lambda2 - 1 / v * np.sum(np.square(auxiliary_matrix))
    second_derivative_w = - lambda1 - 1 / v * np.sum(np.square(similarity_matrix))
    return second_derivative_T, second_derivative_alpha, second_derivative_beta, second_derivative_w


# 设定迭代次数和停止条件
max_iterations = 100000
tolerance = 1e-6
relation_strength_matrix = re_strength_matrix
for iteration in (range(max_iterations)):

    params = []
    params_new = []

    L_T, L_alpha, L_beta, L_w = first_derivative(sim_matrix, inter_matrix, relation_strength_matrix, aux_matrix)

    L_T2, L_alpha2, L_beta2, L_w2 = second_derivative(sim_matrix, relation_strength_matrix, aux_matrix)

    # 更新参数
    relation_strength_matrix_new = relation_strength_matrix - L_T / L_T2

    alpha_new = alpha - L_alpha / L_alpha2
    beta_new = beta - L_beta / L_beta2
    w_new = w - L_w / L_w2

    params.append(np.sum(relation_strength_matrix))
    params.append(alpha)
    params.append(beta)
    params.append(w)

    params_new.append(np.sum(relation_strength_matrix_new))
    params_new.append(alpha_new)
    params_new.append(beta_new)
    params_new.append(w_new)

    # 检查停止条件
    if np.all(np.abs(np.array(params_new) - np.array(params))) < tolerance:
        break

    relation_strength_matrix = relation_strength_matrix_new
    alpha = alpha_new
    beta = beta_new
    w = w_new

relation_strength_matrix = preprocessing.minmax_scale(relation_strength_matrix, axis=0)
result_matrix = np.multiply(relation_strength_matrix, inter_matrix)
np.fill_diagonal(result_matrix, 0)
# 在 Python 脚本中
# np.savetxt('sim_matrix.txt', sim_matrix, fmt='%0.8f', delimiter=',')
# np.savetxt('inter_matrix.txt', inter_matrix, fmt='%0.8f', delimiter=',')
np.savetxt('relation_strength_matrix.txt', relation_strength_matrix, fmt='%0.8f', delimiter=',')
np.savetxt('result_matrix.txt', result_matrix, fmt='%0.8f', delimiter=',')
# print("Result Matrix:")
# print(result_matrix)


from pylab import *
from sklearn.linear_model import LinearRegression
from statsmodels.tsa.arima.model import ARIMA
import random

# 线性预测
# def predict_future_values(data, future_steps):
#     # 创建特征矩阵和目标向量
#     X = [[i] for i in range(1, len(data) + 1)]
#     y = data
#
#     # 创建线性回归模型并进行拟合
#     model = LinearRegression()
#     model.fit(X, y)
#
#     # 预测未来多个值
#     future_values = []
#     last_value = data[-1]  # 最后一个已知值作为初始值
#
#     for _ in range(future_steps):
#         next_X = [[len(data) + 1]]
#         next_value = model.predict(next_X)[0]
#         future_values.append(next_value)
#
#         X.append(next_X[0])
#         y.append(next_value)
#         model.fit(X, y)
#
#         last_value = next_value
#
#     return future_values

# ARIMA算法进行预测
def predict_future_values(data, future_steps):
    # 拟合ARIMA模型
    model = ARIMA(data, order=(1, 1, 3))
    model_fit = model.fit()

    # 获取未来预测结果
    forecast = model_fit.get_forecast(steps=future_steps)

    # 提取预测值
    predicted_values = forecast.predicted_mean

    return predicted_values

# 主函数
if __name__ == '__main__':
    # 获取参数和数据集
    future_steps = int(sys.argv[1])  # 步长
    # 随机生成时间序列数据
    data = [random.randint(100, 300) for _ in range(20)]
    # 调用函数进行预测
    predicted_values = predict_future_values(data, future_steps)
    # 格式化输出随机生成的时间序列数据
    # print("随机生成的时间序列数据:", [round(val, 2) for val in data])
    # 格式化输出预测值
    print([round(val, 2) for val in predicted_values])


# # 主函数
# if __name__ == '__main__':
#     # 随机生成时间序列数据
#     data = [random.randint(100, 300) for _ in range(20)]
#     # 调用函数进行预测
#     predicted_values = predict_future_values(data, 5)
#     # 格式化输出随机生成的时间序列数据
#     print("随机生成的时间序列数据:", [round(val, 2) for val in data])
#     # 格式化输出预测值
#     print("预测的未来值为:", [round(val, 2) for val in predicted_values])



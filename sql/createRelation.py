import pymysql
import networkx as nx
import random
# 数据库连接配置
conn = pymysql.connect(host='47.97.16.248', user='root', password='root', db='ry-vue',port=3307)
# 获取层级数据
def get_layer_data(layer_id,company_type):
    with conn.cursor() as cursor:
        sql = "SELECT id FROM company_all WHERE layer_id = %s and company_type=%s"
        cursor.execute(sql, (layer_id,company_type))
        companies = cursor.fetchall()
        return [c[0] for c in companies]
# 创建加强的连通图
def create_enhanced_mst(layer_id,company_type, extra_edges=5):
    companies = get_layer_data(layer_id,company_type)
    G = nx.complete_graph(companies)  # 创建完全图
    T = nx.minimum_spanning_tree(G)   # 使用 Kruskal 算法生成最小生成树
    # 从完全图的边中选择额外的边加入到 MST
    extra_candidates = [e for e in G.edges() if e not in T.edges()]
    random.shuffle(extra_candidates)
    for edge in extra_candidates[:extra_edges]:
        T.add_edge(*edge)
    return T
# 插入生成的关系
def insert_relationships(layer_id, tree,company_type):
    with conn.cursor() as cursor:
        for (u, v) in tree.edges():
            # 确保 company1_id < company2_id 来避免双向边
            company1_id, company2_id = sorted([u, v])
            sql = """
            INSERT INTO multiplex_relationship (company1_id, company2_id, layer_id,link_type, weight)
            VALUES (%s, %s, %s,%s,Floor(RAND() * 9) + 1)
            """
            cursor.execute(sql, (company1_id, company2_id, layer_id,company_type))
        conn.commit()
# 示例用法
layer_id = 2
company_type=1
companies=get_layer_data(layer_id,company_type)
extra_edges =len(companies) //2 # 根据需求调整额外边的数量
tree = create_enhanced_mst(layer_id,company_type,extra_edges)
insert_relationships(layer_id, tree,company_type)

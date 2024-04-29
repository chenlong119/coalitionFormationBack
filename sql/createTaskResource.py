import pymysql
import random

def connect_db():
    """连接到 MySQL 数据库"""
    try:
        conn = pymysql.connect(host='47.97.16.248', user='root', password='root', db='ry-vue',port=3307)
        print("Successfully connected to the database")
        return conn
    except pymysql.MySQLError as e:
        print(f"Error while connecting to MySQL: {e}")

        return None

def fetch_tasks_resources(conn):
    """查询每个任务的资源总数，只选择未分配资源的任务"""
    try:
        with conn.cursor() as cursor:
            sql = """
                 SELECT t.id AS task_id, 
                       COUNT(r.id) AS total_resources,
                       MIN(r.id) AS min_resource_id,
                       MAX(r.id) AS max_resource_id
                FROM task_all t
                JOIN resource_all r ON t.task_type = r.resource_type
                LEFT JOIN task_resource tr ON t.id = tr.task_id
                WHERE tr.task_id IS NULL
                GROUP BY t.id
            """
            cursor.execute(sql)
            return cursor.fetchall()
    except pymysql.MySQLError as e:
        print(f"Error fetching data from MySQL: {e}")
        return []

def assign_resources(conn, tasks_resources):
    """为每个任务随机分配资源"""
    try:
        with conn.cursor() as cursor:
            for task in tasks_resources:
                task_id = task[0]
                total_resources = task[1]
                min_id = task[2]
                max_id = task[3]
                resources_to_select = max(1, total_resources // 3)  # 至少分配一个资源

                # 随机选择资源ID，考虑实际的ID范围
                if total_resources > 0 and min_id and max_id:
                    all_resource_ids = list(range(min_id, max_id + 1))
                    selected_resources = random.sample(all_resource_ids, min(len(all_resource_ids), resources_to_select))

                    # 插入到 task_resource 表中
                    for resource_id in selected_resources:
                        sql = f"INSERT INTO task_resource (task_id, resource_id, number) VALUES (%s, %s, Floor(RAND() * 201) + 200)"
                        cursor.execute(sql, (task_id, resource_id))
            conn.commit()
            print("Resources have been successfully assigned to tasks")
    except pymysql.MySQLError as e:
        print(f"Error updating MySQL: {e}")
        conn.rollback()

def main():
    conn = connect_db()
    if conn:
        tasks_resources = fetch_tasks_resources(conn)
        print(tasks_resources)
        if tasks_resources:
            assign_resources(conn, tasks_resources)
        conn.close()

if __name__ == "__main__":
    main()

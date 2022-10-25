from airflow.decorators import dag, task
from datetime import datetime

@dag(
    schedule=None,
    start_date=datetime(2022, 10, 21, hour=8),
    catchup=False,
    tags=['demo'],
)
def template_dag():
    """
    ### Template dag"""
    @task()
    def example_func():
        pass
    @task(multiple_outputs=True)
    def transform(order_data_dict: dict):
        return order_data_dict
    
    t1 = example_func()
    t2 = transform({'3': 3})
    t1 >> t2
template_dag()


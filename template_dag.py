from airflow.decorators import dag, task
@dag(
    schedule=None,
    start_date=pendulum.datetime(2022, 9,21, tz="UTC"),
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
        pass

template_dag()

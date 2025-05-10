from locust import HttpUser, between, task

class WebsiteUser(HttpUser):
    # This will make the simulated user wait between 1 and 3 seconds after each task
    wait_time = between(1, 3)
    
    # Define a task to load the main page (GET request)
    @task
    def items_orders_inner(self):
        self.client.get("/customers-orders-full")
    



# Load Balancer

## Creating Multiple Instances
1. Create two instances of the Fibonacci application under different availability zones, but within the same VPC
    - Fib1 - us-east-1a
    - Fib2 - us-east-1b
2. Verify whether the two instances are working
3. Create a dashboard in CloudWatch to monitor them
    - Widget 1 - NetworkPacketIn of servers Fib1 and Fib2
    - Widget 2 - CPUUtilization of servers Fib1 and Fib2

## Target Groups
1. Go to Target Groups in AWS and Create a Target Group
2. Target type - Instances
3. Protocol - HTTP, Port - 80
4. Protocol version - HTTP1
5. Click Next. 
6. Select the two fibonacci instances - Fib1 and Fib2
7. Click on Include as pending below
8. Create the Target Group
9. Once created, verify that the two instances are registered

## Load Balancer
1. Under Load Balancers, create an Application Load Balancer
2. Give a name and select scheme - Internet facing and IP type - IPv4 
3. Type of load balancer - Application Load Balancer 
4. Network mapping - Choose the VPC of the two fibonacci instances and their corresponding Availability Zones.
5. Choose security group to allow traffic on port 80 (HTTP requests) 
6. Configure listeners and routing - Choose HTTP, port 80 and select the target group you created previously. 
7. Click Create. Wait until it gets provisioned. Note the DNS name.
8. Open <LB-DNS-Name>/fibonacci.php and verify the application

## Generate Load using Locust
1. Use the locust file to create constant high load.
2. Run the locust file using locust -f constant-high-load.py
3. Open localhost:8089
4. Provide the http://<LB-DNS-Name>/fibonacci.php as Host 
5. Click Start swarming
6. Check the new CloudWatch dashboard for changes in the graph metrics when load is being generated on the servers.
7. Observe how the incoming requests on the Load Balancer are being distributed between the two servers.
8. Note - CloudWatch updates the graphs only after 5 minutes. So, be patient.

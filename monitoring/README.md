# Monitoring Lab

## CloudWatch Widgets
1. Launch an EC2 Instance for the Fibonacci Application and make sure it is working by opening the URL in browser. 
2. Open the CloudWatch console
3. Click on Dashboards and Create a Dashboard
4. Add widget → Line → Metrics → EC2 → Per-instance metrics
5. Choose NetworkPacketIn, CPUUtilization for the Fibonacci server
6. Maximize the widget to view the metrics

## CloudWatch Alarms
1. Go to Alarms → All Alarms and Create Alarm
2. Select NetworkPacketIn metric for the Fibonacci Server
3. Select Statistic Average and Period 1 minute
4. Select Threshold type Static and Greater than 20000
5. For Notification, select In Alarm, Create new topic, Provide a group name your email address and Create topic.
6. No Auto Scaling action for now.
7. (Optional) For EC2 Action, select In Alarm and choose the option to Stop this Instance
8. Click Next. Provide an alarm name and Create alarm

## Generate Load using Locust
1. Use the locust file to create constant high load.
2. Run the locust file using locust -f constant-high-load.py
3. Open localhost:8089
4. Provide the http://<server-IP>/fibonacci.php as Target Host
5. Click Start swarming
6. Observe the CloudWatch dashboard for the change in the graph metrics when load is being generated on the server.
7. If the incoming request packets count exceeds the threshold, you will receive an email notification 

8. Note - CloudWatch updates the graphs only after 5 minutes. So, be patient.

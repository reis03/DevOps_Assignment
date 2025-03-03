# Grafana used for monitoring and logging of the nodejs app used in these tasks. 

In this section are presented the images of steps where the web application used in the previous tasks was also used for monitoring and logging through Grafana and Prometheus tools.

Since we have already created the cluster in AKS, then there I initialized the helm charts and repos of Grafana and Prometheus and then with the process of port-forwarding on certain ports I accessed them through the browser with localhost.

However, it should be noted that some additions had to be made to the configurations of both the app.js of the application and its deployment in the cluster by adding the parts of the endpoint "/metrics", as well as prom-client which is the Prometheus library for NodeJS.

After the connection between Prometheus and Grafana, then I created the Dashboard in Grafana and there I set some queries to check CPU utilization and Memory Usage as well as http requests.

![Picture 1](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20130612.png)

![Picture 2](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20130908.png)

![Picture 4](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20131434.png)

![Picture 7](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20144834.png)

![Picture 8](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20144853.png)


![Picture 9](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20145027.png)

![Picture 11](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20202800.png)

![Picture 12](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20202815.png)

![Picture 3](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20131327.png)

![Picture 6](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20144516.png)

![Picture 10](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20145133.png)

![Picture 5](/4_monitoring_logging_Grafana/img/Screenshot%202025-03-02%20144148.png)


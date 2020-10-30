#!/bin/bash
#helm repo add stable https://kubernetes-charts.storage.googleapis.com
#helm repo update
#kubectl create namespace monitor
#helm install prometheus-operator stable/prometheus-operator --namespace monitor --set grafana.service.type=LoadBalancer
#kubectl apply -f ingress.yaml -n monitor
#kubectl get svc -n monitor | grep prometheus-operator-grafana

#!/bin/bash
#helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update
helm install prometheus-operator stable/prometheus-operator --namespace monitor --set grafana.service.type=NodePort --set prometheusOperator.admissionWebhooks.enabled=false --set prometheusOperator.admissionWebhooks.patch.enabled=false --set prometheusOperator.tlsProxy.enabled=false 

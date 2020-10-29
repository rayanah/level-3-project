
up: 
	cd k8s-sandbox && make up install-cicd install-ingress && cd .. && make secret-dockerhup tekton 

pro: 
	#helm repo add stable https://kubernetes-charts.storage.googleapis.com
	helm repo update
	kubectl create namespace monitor
	helm install prometheus-operator stable/prometheus-operator --namespace monitor --set grafana.service.type=LoadBalancer
	kubectl apply -f pro-grag/ingress.yaml -n monitor
	kubectl get svc -n monitor | grep prometheus-operator-grafana

elfs: source elf/elf.sh
 
k8s: front-end-k8s catalogue-k8s cart-k8s orders-k8s payment-k8s shipping-k8s user-k8s 

front-end-k8s:
	cd front-end && kubectl create -f front-end-dep.yaml -n test && cd ..
user-k8s:
	cd user && kubectl create -f user-dep-ser.yaml -f userdb-dep-ser.yaml -n test
catalogue-k8s:
	cd catalogue && kubectl create -f catalogue-dep-ser.yaml -f cataloguedb-dep-ser.yaml -n test
cart-k8s:
	cd cart && kubectl create -f cart-dep-ser.yaml -f cartdb-dep-ser.yaml -n test
orders-k8s:
	cd orders && kubectl create -f orders-dep-ser.yaml -f ordersdb-dep-ser.yaml -n test
payment-k8s:
	cd payment && kubectl create -f payment-dep-ser.yaml -n test
shipping-k8s:
	cd shipping && kubectl create -f shipping-dep-ser.yaml -n test
queue-master-k8s:
	cd queue-master && kubectl create -f queue-master-dep-ser.yaml -f rabbit-master-dep-ser.yaml -n test


tekton: front-end-tkn user-db-tkn catalogue-db-tkn  user-tkn catalogue-tkn cart-tkn orders-tkn payment-tkn shipping-tkn queue-master-tkn

front-end-tkn:
	kubectl create -f sa.yaml -f role-binding.yaml -f front-end/try1/pipelineResource.yaml -f front-end/try1/task.yaml \
         -f front-end/try1/deployTask.yaml -f front-end/try1/pipeline.yaml -f front-end/try1/pipelineRun.yaml -n test

user-db-tkn:
	kubectl create -f user/db-try1/pipelineResource.yaml -f user/db-try1/task.yaml -f user/db-try1/deployTask.yaml \
        -f user/db-try1/pipeline.yaml -f user/db-try1/pipelineRun.yaml -n test
user-tkn:
	kubectl create -f user/try1/pipelineResource.yaml -f user/try1/task.yaml -f user/try1/deployTask.yaml\
         -f user/try1/pipeline.yaml -f user/try1/pipelineRun.yaml -n test
catalogue-db-tkn:
	kubectl create -f catalogue/db-try1/pipelineResource.yaml -f catalogue/db-try1/task.yaml -f catalogue/db-try1/deployTask.yaml 	
	-f catalogue/db-try1/pipeline.yaml -f catalogue/db-try1/pipelineRun.yaml -n test
catalogue-tkn:
	kubectl create -f catalogue/try1/pipelineResource.yaml -f catalogue/try1/task.yaml -f catalogue/try1/run.yaml -f catalogue/try1/deployTask.yaml \
	-f catalogue/try1/deployRunner.yaml -f catalogue/try1/pipeline.yaml -f catalogue/try1/pipelineRun.yaml -n test
cart-db-tkn:
	kubectl create -f cart/db-try1/pipelineResource.yaml  -f cart/db-try1/deployTask.yaml \
        -f cart/db-try1/deployRunner.yaml -f cart/db-try1/pipeline.yaml -f cart/db-try1/pipelineRun.yaml -n test
cart-tkn:
	kubectl create -f cart/try1/pipelineResource.yaml -f cart/try1/task.yaml -f cart/try1/run.yaml -f cart/try1/deployTask.yaml \
        -f cart/try1/deployRunner.yaml -f cart/try1/pipeline.yaml -f cart/try1/pipelineRun.yaml -n test
orders-tkn:
	kubectl create -f orders/try1/pipelineResource.yaml -f orders/try1/task.yaml -f orders/try1/run.yaml -f orders/try1/deployTask.yaml \
        -f orders/try1/deployRunner.yaml -f orders/try1/pipeline.yaml -f orders/try1/pipelineRun.yaml -n test

payment-tkn:
	kubectl create -f payment/try1/pipelineResource.yaml -f payment/try1/task.yaml -f payment/try1/run.yaml -f payment/try1/deployTask.yaml \
        -f payment/try1/deployRunner.yaml -f payment/try1/pipeline.yaml -f payment/try1/pipelineRun.yaml -n test
shipping-tkn:
	kubectl create -f shipping/try1/pipelineResource.yaml -f shipping/try1/task.yaml -f shipping/try1/run.yaml -f shipping/try1/deployTask.yaml \
        -f shipping/try1/deployRunner.yaml -f shipping/try1/pipeline.yaml -f shipping/try1/pipelineRun.yaml -n test
queue-master-tkn:
	kubectl create -f queue-master/try1/pipelineResource.yaml -f queue-master/try1/task.yaml -f queue-master/try1/run.yaml \
        -f queue-master/try1/deployTask.yaml  -f queue-master/try1/deployRunner.yaml -f queue-master/try1/pipeline.yaml \
        -f queue-master/try1/pipelineRun.yaml -n test

e2e-test-tkn:


push-images: secret-dockerhup e2e-tests-image front-end-image user-image catalogue-image payment-image shipping-image carts-image queue-master-image orders-image load-test-image

secret-dockerhup:
	docker login
	kubectl create secret generic rayanah-secret \
	 --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test
e2e-tests-image:
	kubectl create -f e2e-tests/tektonDockerPush/serviceaccount.yaml -f e2e-tests/tektonDockerPush/pipelinerun.yaml\
        -f e2e-tests/tektonDockerPush/task.yaml -f e2e-tests/tektonDockerPush/run.yaml -n test

front-end-image:

user-db-image:

user-image:

catalogue-db-image:


catalogue-image:
	       
orders-image:

payment-image:
	kubectl create -f payment/tektonDockerPush/serviceaccount.yaml -f payment/tektonDockerPush/pipelinerun.yam\
	l -f payment/tektonDockerPush/task.yaml -f payment/tektonDockerPush/run.yaml -n test

shipping-image:
	kubectl create -f shipping/tektonDockerPush/serviceaccount.yaml -f shipping/tektonDockerPush/pipelinerun.yaml\
	 -f shipping/tektonDockerPush/task.yaml -f shipping/tektonDockerPush/run.yaml -n test
cart-db-image:

cart-image:


queue-master-image:
	  kubectl create -f queue-master/tektonDockerPush/serviceaccount.yaml -f queue-master/tektonDockerPush/pipelinerun.yaml\
         -f queue-master/tektonDockerPush/task.yaml -f queue-master/tektonDockerPush/run.yaml -n test

orders-image:
	kubectl create -f orders/tektonDockerPush/serviceaccount.yaml -f orders/tektonDockerPush/pipelinerun.yaml\
         -f orders/tektonDockerPush/task.yaml -f orders/tektonDockerPush/run.yaml -n test

edge-router-image:
	kubectl create -f edge-router/tektonDockerPush/serviceaccount.yaml -f edge-router/tektonDockerPush/pipelinerun.yaml\
         -f edge-router/tektonDockerPush/task.yaml -f edge-router/tektonDockerPush/run.yaml -n test
load-test-image:
	kubectl create -f load-test/tektonDockerPush/serviceaccount.yaml -f load-test/tektonDockerPush/pipelinerun.yaml\
	-f load-test/tektonDockerPush/task.yaml -f load-test/tektonDockerPush/run.yaml -n test

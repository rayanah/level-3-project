
up: 
	cd k8s-sandbox && make up && make install-cicd k8s  
k8s: front-end-k8s catalogue-k8s cart-k8s orders-k8s payment-k8s shipping-k8s user-k8s 

front-end-k8s:
	cd front-end && kubectl create -f front-end-dep.yaml -n test && cd ..

catalogue-k8s:
	cd catalogue && kubectl create -f catalogue-dep-ser.yaml -f cataloguedb-dep-ser.yaml -n test
cart-k8s:
	cd carts && kubectl create -f cart-dep-ser.yaml -f cartdb-dep-ser.yaml -n test
orders-k8s:
	cd orders && kubectl create -f orders-dep-ser.yaml -f ordersdb-dep-ser.yaml -n test
payment-k8s:
	cd payment && kubectl create -f payment-dep-ser.yaml -n test
shipping-k8s:
	cd shipping && kubectl create -f shipping-dep-ser.yaml -n test
user-k8s:
	cd user && kubectl create -f user-dep-ser.yaml -f userdb-dep-ser.yaml -n test
push-images: secret-dockerhup e2e-tests-image front-end-image user-image catalogue-image payment-image shipping-image carts-image queue-master-image orders-image load-test-image

secret-dockerhup:
	docker login
	kubectl create secret generic regcred \
	 --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson -n test
e2e-tests-image:
	kubectl create -f e2e-tests/tektonDockerPush/serviceaccount.yaml -f e2e-tests/tektonDockerPush/pipelinerun.yaml\
        -f e2e-tests/tektonDockerPush/task.yaml -f e2e-tests/tektonDockerPush/run.yaml -n test

front-end-image:
	kubectl create -f front-end/tektonDockerPush/serviceaccount.yaml -f front-end/tektonDockerPush/pipelinerun.yaml\
	 -f front-end/tektonDockerPush/task.yam -f front-end/tektonDockerPush/run.yaml -n test

user-image:
	kubectl create -f user/tektonDockerPush/serviceaccount.yaml -f user/tektonDockerPush/pipelinerun.yaml\
	 -f user/tektonDockerPush/task.yaml -f user/tektonDockerPush/run.yaml -n test

catalogue-image:
	kubectl create -f catalogue/tektonDockerPush/serviceaccount.yaml -f catalogue/tektonDockerPush/pipelinerun.yaml\
	-f catalogue/tektonDockerPush/task.yaml -f catalogue/tektonDockerPush/run.yaml -n test

payment-image:
	kubectl create -f payment/tektonDockerPush/serviceaccount.yaml -f payment/tektonDockerPush/pipelinerun.yam\
	l -f payment/tektonDockerPush/task.yaml -f payment/tektonDockerPush/run.yaml -n test

shipping-image:
	kubectl create -f shipping/tektonDockerPush/serviceaccount.yaml -f shipping/tektonDockerPush/pipelinerun.yaml\
	 -f shipping/tektonDockerPush/task.yaml -f shipping/tektonDockerPush/run.yaml -n test

carts-image:
	kubectl create -f carts/tektonDockerPush/serviceaccount.yaml -f carts/tektonDockerPush/pipelinerun.yaml\
	 -f carts/tektonDockerPush/task.yaml -f carts/tektonDockerPush/run.yaml -n test

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

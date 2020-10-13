
up: 
	cd k8s-sandbox && make up && make install-cicd

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
	-f catalogue/tektonDockerPush/task.yaml catalogue/tektonDockerPush/run.yaml -n test

payment-image:
	kubectl create -f payment/tektonDockerPush/serviceaccount.yaml -f payment/tektonDockerPush/pipelinerun.yam\
	l -f payment/tektonDockerPush/task.yaml -f patment/tektonDockerPush/run.yaml -n test

shipping-image:
	kubectl create -f shipping/tektonDockerPush/serviceaccount.yaml -f shipping/tektonDockerPush/pipelinerun.yaml\
	 -f shipping/tektonDockerPush/task.yaml -f shipping/tektonDockerPush/run.yaml -n test

carts-image:
	kubectl create -f carts/tektonDockerPush/serviceaccount.yaml -f cart/tektonDockerPush/pipelinerun.yaml\
	 -f carts/tektonDockerPush/task.yaml -f carts/tektonDockerPush/run.yaml -n test

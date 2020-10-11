
up: 
	cd k8s-sandbox && make up && make install-cicd

e2e-tests-image:
	kubectl create -f e2e-tests/tektonDockerPush/serviceaccount.yaml -n tekton-pipelines\
        kubectl create -f e2e-tests/tektonDockerPush/pipelinerun.yaml -n tekton-pipelines\
        kubectl create -f e2e-tests/tektonDockerPush/run.yaml -n tekton-pipelines\
        kubectl create -f e2e-tests/tektonDockerPush/task.yaml -n tekton-pipelinens\

front-end-image:
	kubectl create -f front-end/tektonDockerPush/serviceaccount.yaml -n tekton-pipelines\
        kubectl create -f front-end/tektonDockerPush/pipelinerun.yaml -n tekton-pipelines\
        kubectl create -f front-end/tektonDockerPush/run.yaml -n tekton-pipelines\
        kubectl create -f front-end/tektonDockerPush/task.yaml -n tekton-pipelinens\

user-image:
	kubectl create -f user/tektonDockerPush/serviceaccount.yaml -n tekton-pipelines\
        kubectl create -f user/tektonDockerPush/pipelinerun.yaml -n tekton-pipelines\
        kubectl create -f user/tektonDockerPush/run.yaml -n tekton-pipelines\
        kubectl create -f user/tektonDockerPush/task.yaml -n tekton-pipelinens\

catalogue-image:
	kubectl create -f catalogue/tektonDockerPush/serviceaccount.yaml -n tekton-pipelines\
        kubectl create -f catalogue/tektonDockerPush/pipelinerun.yaml -n tekton-pipelines\
        kubectl create -f catalogue/tektonDockerPush/run.yaml -n tekton-pipelines\
        kubectl create -f catalogue/tektonDockerPush/task.yaml -n tekton-pipelinens\

payment-image:
	kubectl create -f payment/tektonDockerPush/serviceaccount.yaml -n tekton-pipelines\
        kubectl create -f payment/tektonDockerPush/pipelinerun.yaml -n tekton-pipelines\
        kubectl create -f payment/tektonDockerPush/run.yaml -n tekton-pipelines\
        kubectl create -f patment/tektonDockerPush/task.yaml -n tekton-pipelinens\

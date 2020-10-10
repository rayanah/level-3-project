


e2e-tests-image:

     kubectl create -f e2e-tests/tektonDockerPush/serviceaccount.yaml -n tekton-pipelines
     kubectl create -f e2e-tests/tektonDockerPush/pipelinerun.yaml -n tekton-pipelines
     kubectl create -f e2e-tests/tektonDockerPush/run.yaml -n tekton-pipelines
     kubectl create -f e2e-tests/tektonDockerPush/task.yaml -n tekton-pipelinen



## Day 1
  Create my own Sandbox and Create New Repo for the final-project and clone all the micro-services  

###### **finish day 1 Successfully**

## Day 2
  Run Sandbox and create Cluster and cofigure it with the project needs, and Work on micro-services DockerFiles and try to push them to dockerHup by Tekton pipelines.
  I have a little conflict in creating secret by yaml file, but I switched to create a secret based on existing Docker credentials by -docker login-. So I start pushing the images and some of them working fine and others I have problem with them 
  half the images
###### **finish day 2 with almost half Successful**

## Day 3
 All the day working completing push images to dockerHup, I have successful pushing all images even the multistage images and so happy to figure it out 
###### **finish day 3**

## Day 4
 After finish  pushing the images, I decide to test and run the Dockerfiles locally, before continue on unstable ground. Sadly, some images didn't work. So I review all the micro-service dockerfile and go all over the web and figure out the cause of errors in running the Dockerfiles
###### **finish day 4**

## Day 5
 Continue with Dockerfiles and Done finaly from pushing the images for all microservices.

###### **finish day 5 Successfuly**

## Day 6 
 Woring with k8 , and I have hard time with it.

###### **finish day 6**

## Day 7
 Suffering from using k8s with the microservices, starting with front end. and the front-end stubborn to work.


## Day 8
 Still working in front-end to deploy with k8s.


## Day 9
 Finally the front end work from stuppid mistake. Shame to mension it,all the three days wasted, becuase the selector label are diffrent in the Deployement and Service, that should be identical labels

## Day 10

I'am happy for today.I have the microservices work with k8s(orders/orders-db/catalouge/catalouge-db/carts/carts-db,payment).
I had some problem with Catalogue and Payment thay was crash immedeatly,it's was strange in the biginning, But I used k8s logs and describe to understand the error why is happing, it shows tha I  got port 80 permission denied. In the begging I thought it was the wrong ports. But I search and show that I have to give the container "root as user" to work. so I delete the pods and build it again and the result was runnuing successfully :D thanks god. 
Also I had problem in Carts and it was old file, I didn't make push for the Carts before couble of days in githup, i know that becuase the error was familiar  :).


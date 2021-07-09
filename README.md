#  Description

#### Using terraform to provision Linux VM ######
Terraform modules were used in deploying a single linux box to AWS 

1. in the grit_code directory, we have the following files:

    - datasource.tf - contains the data source of already existing services i.e., VPC, Subnets, AMIs
                    Here, we got the VPC ID and all available subnets and specific AMI        
    - main.tf - contains the main code for deploying the ec2 server, here we are using a terraform module to basically setting - up the server on AWS
    - providers.tf  - This containers the terraform & AWS providers
    - variables.tf - This are the variables used for the deployment

## Setting up the pipeline #####

the *.github/workflows/deploy.yml* file contains the steps used in deploying the nginx container to the Linux server

##### in the first step;
Build: we are basically checking out the repository and building the docker container and pushing to dockerhub.

##### Second step:
Deploy to EC2: This step is dependent on the build step. it involved deploying the container to the EC2 server.


##### Security ######################
In the providers.tf file, we have the option of storing our terraform state files in a remote backend. However, for this deployment the state files are not committed.

A Key pair was created on AWS, and the private key was passed as a variable

Github secrets were created to store sensitive information such as; ssh key, host, port, user and docker credentials.

##### How to use ##############

- Clone the repository

- Create an IAM user with Secrets on AWS

- Using AWS CLI, configure your secrets on the terminal by using the "aws configure" - This is what terraform will use to provision resources

- Edit the variables.tf file in the grit_code directory, update the vpc_id and key_pair with updated values.
  Change the remote backend to store terraform state files

- Update all other variables as needed.

- To further customize your deployment, you can make changes to the ec2 and security modules in the main.tf file in grit_code   directory. i.e ingress rule, ingresss CIDR.

- The pipeline steps contained in the *.github/workflows/deploy.yml* file deploys on every push to the master branch, this can be customized to the specific branch you want the build to trigger. 
Update the container image tag to your repository_name/directory:tag

- In your repository, create secrets for storing your Dockerhub/Docker repositories secrets and other secrets needed for the build.

- Run Terraform init, plan and apply to deploy your code

- The application can be accessed via http://18.209.227.252
##### The server will be shutdown tomorrow











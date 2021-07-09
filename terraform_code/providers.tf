terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.27.0"
    }
  }

#   backend "s3" {
#     bucket = "grid.terraform.state"
#     key = "global/grit_code/terraform.tfstate"
#     region = "us-east-1"

#     ## Use dynamo db for lock_state
#     ## Lock state prevents concurrent application of cconfiguration changes
#     dynamodb_table = "grid_terraform_lock"
#     encrypt = true
#   }
}

provider "aws" {
  region = "us-east-1"
}
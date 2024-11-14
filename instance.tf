  provider "aws" { 
  region = "us-east-1" 
  access_key=var.AWS_ACCESS_KEY 
  secret_key=var.AWS_SECRET_KEY 
  } 

  resource "aws_instance" "web" { 
  ami           = "ami-0fc5d935ebf8bc3bc" 
  instance_type = "t3.micro" 
  tags = { 
  Name = "Hello from Terraform Cloud" 
  } 
  }

# Project 4: Family Future Cloud Server (Terraform)
# This is how cloud engineers build

resource "aws_instance" "family_server" {
  # This will be your first server in Asia
  ami           = "ami-0free" # Free Amazon Linux
  instance_type = "t2.micro"  # Free Tier = R0
  
  tags = {
    Name = "FamilyFuture-Server"
    Goal = "R8000-job-for-siblings"
    Owner = "Village-Engineer"
  }
}

# Output - your future job IP
output "future_ip" {
  value = "Your server will be here when you get AWS free account"
}

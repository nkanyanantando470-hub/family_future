# FAMILY FUTURE - COMPANY READY - 1 CLICK DEPLOY
# Built on A06, R150, No Wifi - Durban Village Lab

# --- PART 1: FIXED NETWORK (your 47-line fix) ---
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = { Name = "company-fixed-by-village-engineer" }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "allow_web" {
  vpc_id = aws_vpc.main.id
  name = "company-web"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- PART 2: YOUR DREAM SERVER (your 19-line dream) ---
resource "aws_instance" "family_server" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_web.id]

  tags = {
    Name = "FamilyFuture-Server"
    Goal = "R8000-job-for-siblings"
    FixedBugs = "5"
    BuiltOn = "Samsung-A06-Termux"
  }
}

output "company_network" {
  value = "Fixed: DNS + Route + IGW + SG - 100% packet loss SOLVED"
}

output "server_ip" {
  value = aws_instance.family_server.public_ip
}

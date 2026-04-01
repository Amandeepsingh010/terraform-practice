🏗️ Project Title
Terraform AWS Infrastructure – Day 5 (Advanced Architecture)

📌 Overview
This project demonstrates how to build a production-style cloud infrastructure using Terraform on Amazon Web Services.

It includes networking, compute, and database layers with proper security and high availability concepts.

🧱 Architecture
User → EC2 (Public Subnet)
           ↓
        NAT Gateway
           ↓
   Private Subnets (Multi-AZ)
           ↓
        RDS (Primary DB)
           ↓
      Read Replica
⚙️ Resources Created
🌐 Networking

--------------------------------
VPC
Public Subnet (for EC2)
Private Subnets (for RDS)
Internet Gateway
NAT Gateway
Route Tables & Associations
-------------------------------
💻 Compute

EC2 Instance (t2.micro - Free Tier)

🛢️ Database

Amazon RDS MySQL Instance

DB Subnet Group (Multi-AZ)

Read Replica

Automated Backups Enabled

🔐 Security

Security Groups:

EC2 → Allow SSH (22), HTTP (80)

RDS → Allow MySQL (3306) only from EC2

📂 File Structure
.
├── main.tf
├── provider.tf
├── vpc.tf
├── subnet.tf
├── internet-gateway.tf
├── nat-gateway.tf
├── route-table.tf
├── security-group.tf
├── ec2.tf
├── rds.tf
├── outputs.tf
├── variables.tf
🚀 How to Run
1️⃣ Initialize Terraform
terraform init
2️⃣ Validate Configuration
terraform validate
3️⃣ Preview Changes
terraform plan
4️⃣ Apply Infrastructure
terraform apply
⚠️ Important Notes

RDS requires at least 2 subnets in different AZs

Read Replica requires automated backups enabled

NAT Gateway may incur cost

Always clean up resources after testing

terraform destroy
🧠 Key Learnings

Multi-AZ architecture for high availability

Difference between public & private subnets

Terraform state handling in complex setups

Real-world debugging of AWS constraints

Infrastructure design thinking

🔥 Future Improvements

Convert project into Terraform Modules

Add Load Balancer (ALB)

Use Auto Scaling Group

Store secrets in AWS Secrets Manager

🙌 Conclusion

This project helped me understand how real-world cloud infrastructure is designed using Terraform.

From networking to database replication, every component plays a role in building scalable and secure systems.
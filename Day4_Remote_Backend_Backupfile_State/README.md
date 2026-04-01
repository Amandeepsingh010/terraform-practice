# Day 4 – Terraform State Management & Remote Backend

## Overview
In this practice session, I explored how Terraform manages infrastructure state and how remote backends are configured for team collaboration.

Terraform keeps track of infrastructure resources using a **state file**, which allows it to understand the current infrastructure and apply only the required changes.

---

# Terraform State File

When infrastructure is created using Terraform, a file called:

terraform.tfstate

is generated.

This file stores:

- Resource IDs
- Infrastructure configuration
- Metadata required by Terraform

Terraform uses this file to determine what changes need to be applied during future executions.

---

# Terraform Backup State File

When changes are made and `terraform apply` is executed again, Terraform:

1. Creates a backup of the current state
2. Stores it as:

terraform.tfstate.backup

3. Updates the new infrastructure state inside:

terraform.tfstate

This ensures the previous state is preserved in case recovery is needed.

---

# Remote Backend Configuration

By default, Terraform stores the state file locally.

In real-world DevOps environments, the state file is stored remotely so multiple engineers can work safely on the same infrastructure.

For this task, the remote backend was configured using AWS services.

### Services Used

- Amazon S3 → Remote storage for Terraform state
- Amazon DynamoDB → State locking to prevent concurrent changes

---

# Backend Configuration Example

```hcl
terraform {
 backend "s3" {
   bucket         = "my-terraform-state-bucket"
   key            = "dev/terraform.tfstate"
   region         = "us-east-1"
   dynamodb_table = "terraform-lock-table"
 }
}
```

---

# Workflow

1. Write Terraform configuration
2. Run `terraform init` to initialize backend
3. Terraform connects to the S3 bucket
4. State file is stored remotely
5. DynamoDB manages state locking
6. Team members can safely collaborate on infrastructure

---

# Key Learnings

- Importance of Terraform state file
- How Terraform backup files work
- Benefits of remote backend
- State locking using DynamoDB
- Best practices for collaborative Infrastructure as Code workflows

---

# Tools Used

- Terraform
- AWS CLI
- Amazon S3
- Amazon DynamoDB
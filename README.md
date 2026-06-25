We are using Terraform to create the infra here we have three ways
1. workspace, 
2. tfvars
3. seperate repos

# workspace
If you want to create multiple environemnt, you can use Terraform workspace. Terraform will provide a special variable called terraform.workspace
terraform workspace --help(to list all the commands) to create new, select, and delete  environments.

- We can use terraform.workspace variable, we control the values
ex: terraform workspace select dev -> value should be t3.micro; qa -> value should be t3.small ; prod -> value should be t3.medium
i.e., consistent across all the environments (dev, qa, uat, prod)
What do you mean by environment means -> same code on all environments

# Advantages:
- same code
- consistent across all environments.

# Disadvantages
If you make changes to the code and switch to the prod workspace instead of dev, those changes will be applied to production as well. Since the codebase is the same across workspaces, we need to be very careful because any mistake can impact the production environment.

# tfvars
In Terraform, we create separate directories for each environment, such as dev, qa, and prod.
Inside each environment folder, we define a separate backend.tf file to configure remote state storage (for example, an S3 bucket to store the Terraform state file).
We also maintain separate variable files like dev.tfvars, qa.tfvars, and prod.tfvars to manage environment-specific values.
Whenever we initialize Terraform for a specific environment, we use:

terraform init -backend-config=dev/backend.tf

# Advantages:
- same code
- consistent across all environments.

# Disadvantages:
Since the code is the same, instead of make chnges in dev, we do change in prod, and we will applythe  same like terrfor workspace

ex:
bimistakely we will pass the prod values in the dev environment
dev.tfvars:
environmnet = "prod"
instance_type = "t3.medium"
---
#  seperate repos

# Advantage:
1. Blast radius is zero
2. clear isolation
3. sepertare states

# Disadvantages:
1. duplicate code
2. maintenance

To overcome all these issue terraform came into the picture.
**Project structure**

```

terraform-multienv/
└── tfvars/
    ├── ec2.tf
    ├── provider.tf
    ├── variables.tf
    │
    ├── dev/
    │   ├── backend.tf
    │   └── terraform.tfvars
    │
    └── qa/
        ├── backend.tf
        └── terraform.tfvars

```

In tfvars, we are also facing the same problems.



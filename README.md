# workspace
if you want to create multiple environemnt you can use terraform workspace, terraform will provide special variable called terraform.workspace
terraform workspace --help(to lsit all the commands) to create new, select, delete  environment.

-> we can use terraform.workpace variable we control the values
ex: terraform workspace select dev -> value should be t3.micro; qa -> value should be t3.small ; prod -> value should be t3.medium
i.e., consitent across all the environments (dev, qa, uat, prod)
waht do yo mean by environment means -> same code on all environment

# Advantages:
- same code
- consistent across all environments.

# Disadvantages
If you make changes to the code and switch to the prod workspace instead of dev, those changes will be applied to production as well. Since the codebase is the same across workspaces, we need to be very careful because any mistake can impact the production environment.

# tfvars
In Terraform, we create separate directories for each environment such as dev, qa, and prod.
Inside each environment folder, we define a separate backend.tf file to configure remote state storage (for example, an S3 bucket to store the Terraform state file).
We also maintain separate variable files like dev.tfvars, qa.tfvars, and prod.tfvars to manage environment-specific values.
Whenever we initialize Terraform for a specific environment, we use:

terraform init -backend-config=dev/backend.tf

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

in tfvars also we are facing same problems.



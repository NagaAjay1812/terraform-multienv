
bucket       = "remote-state-aws-cloudkarna-dev"
key          = "remote-state-terraform.tfstate"
region       = "us-east-1"
encrypt      = true
use_lockfile = true # otherwise if u r creating infra someone tried makes the changes during that time state file will corrupt


provider "aws" {
    alias  = "aws"
    region = "us-east-1"
    
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "default"
}

# Another way to login not quite recommended is by access keys and secret access keys.
# provider "aws" {
#     alias  = "aws"
#     region = "us-east-1"
#     access_key = var.access_key
#     secret_key = var.secret_key
#     token      = var.session_token    
# }

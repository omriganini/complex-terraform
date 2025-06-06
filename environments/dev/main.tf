module "vpc" {
  source = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
  public_subnet_count = 2
  private_subnet_count = 2
}

module "web_ui_bucket" {
  source      = "../../modules/s3"
  bucket_name = "web-ui-bucket-dev"
}

module "cloudfront" {
  source                = "../../modules/cloudfront"
  s3_bucket_domain_name = module.web_ui_bucket.bucket_arn # Replace with S3 website endpoint if needed
}

# IAM for Lambda
module "lambda_iam" {
  source = "../../modules/iam"
  name = "lambda-role-dev"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
  policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

module "lambda" {
  source        = "../../modules/lambda"
  function_name = "my-lambda-dev"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role_arn      = module.lambda_iam.role_arn
  filename      = "../lambda.zip" # Placeholder, provide your zip
}

# IAM for AppSync
module "appsync_iam" {
  source = "../../modules/iam"
  name = "appsync-role-dev"
  assume_role_policy = data.aws_iam_policy_document.appsync_assume_role_policy.json
  policy_arns = []
}

data "aws_iam_policy_document" "appsync_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["appsync.amazonaws.com"]
    }
  }
}

module "cognito" {
  source    = "../../modules/cognito"
  pool_name = "my-user-pool-dev"
}

module "appsync" {
  source                = "../../modules/appsync"
  api_name              = "my-appsync-api-dev"
  cognito_user_pool_id  = module.cognito.user_pool_id
  aws_region            = var.aws_region
}

module "dynamodb" {
  source      = "../../modules/dynamodb"
  table_name  = "settings-table-dev"
  hash_key    = "id"
  hash_key_type = "S"
}

# IAM for ECS
module "ecs_iam" {
  source = "../../modules/iam"
  name = "ecs-role-dev"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy.json
  policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
}

data "aws_iam_policy_document" "ecs_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

module "ecs" {
  source       = "../../modules/ecs"
  cluster_name = "my-ecs-cluster-dev"
}

module "ecr" {
  source           = "../../modules/ecr"
  repository_name  = "my-ecr-repo-dev"
}

module "fargate" {
  source              = "../../modules/fargate"
  service_name        = "my-fargate-service-dev"
  cluster_arn         = module.ecs.cluster_arn
  task_definition_arn = "arn:aws:ecs:us-east-1:123456789012:task-definition/my-task:1" # Placeholder
  subnet_ids          = module.vpc.private_subnet_ids
  security_group_ids  = [] # Add security group IDs
  desired_count       = 1
}

module "amplify" {
  source    = "../../modules/amplify"
  app_name  = "my-amplify-app-dev"
}

module "athena" {
  source        = "../../modules/athena"
  database_name = "my_athena_db_dev"
  bucket        = module.web_ui_bucket.bucket_arn # Use a dedicated bucket in production
}

module "cur" {
  source      = "../../modules/cur"
  report_name = "my-cur-report-dev"
  s3_bucket   = module.web_ui_bucket.bucket_arn
  s3_region   = var.aws_region
  s3_prefix   = "cur/"
}

module "neptune" {
  source             = "../../modules/neptune"
  cluster_identifier = "my-neptune-cluster-dev"
}

module "opensearch" {
  source      = "../../modules/opensearch"
  domain_name = "my-opensearch-domain-dev"
}

module "codebuild" {
  source            = "../../modules/codebuild"
  project_name      = "my-codebuild-project-dev"
  service_role_arn  = module.lambda_iam.role_arn # Example reuse
  environment_image = "aws/codebuild/standard:6.0"
  source_location   = module.web_ui_bucket.bucket_arn
}

module "config" {
  source   = "../../modules/config"
  role_arn = module.lambda_iam.role_arn # Example reuse
}

module "waf" {
  source = "../../modules/waf"
  name   = "my-waf-dev"
  scope  = "REGIONAL"
} 
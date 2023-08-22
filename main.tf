module "vpc" {

    source = "./vpc" 

}

module "s3" {

    source = "./s3" 

}

# module "acm" {

#     source = "./acm" 

# }

module "cdn" {

    source = "./cdn"
    s3_bucket = module.s3.s3_bucket_arn

}

module "security_group_alb_id" {

    source                = "./alb-sg"
    security_group_name   = "alb-sg"
    vpc_id                = module.vpc.vpc_id

}

module "security_group_ec2" {

    source                = "./ec2-sg"
    security_group_name   = "ec2-sg"
    vpc_id                = module.vpc.vpc_id
}

module "targetgroup" {

    source                = "./targetgroup"
    alb                   = "cloudhats-alb"
    vpc_id                = module.vpc.vpc_id

}

module "alb" {

    source                = "./alb" 
    vpc_id                = module.vpc.vpc_id
    public_subnet_ids     = module.vpc.public_subnet_ids
    security_group_alb_id = module.security_group_alb_id.security_group_alb_id
    targetgroup_id        = module.targetgroup.targetgroup_id

}

module "ecr" {

    source = "./ecr"

}

module "ecs" {

    source                = "./ecs"
    ec2_sg                = module.security_group_ec2.security_group_ec2_id
    instance_type         = "t2.small"
    ami_id                = "ami-0da59f1af71ea4ad2"
    key                   = null
    public_subnet_ids     = module.vpc.public_subnet_ids

}
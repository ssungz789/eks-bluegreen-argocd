output "vpc_id" {
  value = module.vpc.vpc_id
}

output "blue_public_subnets" {
  value = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
}

output "green_public_subnets" {
  value = [module.vpc.public_subnets[2], module.vpc.public_subnets[3]]
}

# output "public_subnets" {
#   value = module.vpc.public_subnets
# }

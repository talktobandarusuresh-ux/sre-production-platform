module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "sre-eks"
  cluster_version = "1.29"

  vpc_id     = aws_vpc.sre_vpc.id
  subnet_ids = [aws_subnet.public.id]

  eks_managed_node_groups = {

    default = {

      desired_size = 3
      max_size     = 6
      min_size     = 2

      instance_types = ["t3.large"]

      iam_role_arn = aws_iam_role.eks_node_role.arn
    }
  }
}
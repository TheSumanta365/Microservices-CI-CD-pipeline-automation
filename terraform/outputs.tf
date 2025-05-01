output "cluster_name" {
  value = aws_eks_cluster.demo.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.demo.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.demo.certificate_authority[0].data
}

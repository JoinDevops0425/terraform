/* locals {
  final_name = "${var.project}-${var.environment}-${var.component}"
  ec2_tags = merge(
    var.common_tags,
    {
      Name    = "cart",
      Version = "1.1"
    }
  )
  sg_id = [aws_security_group.allow_all.id]
}
 */

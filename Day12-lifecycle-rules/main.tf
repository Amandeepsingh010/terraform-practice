
resource "aws_s3_bucket" "name" {
    bucket = "bucket-aman-bucket" 
    # lifecycle {
    #   create_before_destroy = true
    # }
    # lifecycle {
    #   ignore_changes = [ tags ]
    # }
    # lifecycle {
    #   prevent_destroy = true
    # }

    tags = {
        Name = "bucket-aman-bucket"
    }

}
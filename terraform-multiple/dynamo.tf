resource "aws_dynamodb_table_item" "mytfdb-name" {
    table_name = aws_dynamodb_table.mytfdb-name.name
    hash_key = aws_dynamodb_table.mytfdb-name.hash_key
    item = <<ITEM
{

    "mytfdbHashKey": {"S": "apple"},
    "one": {"N": "111"},
    "two": {"N": "222"},
    "three": {"N": "333"},
    "four": {"N": "444"}
}
ITEM
}
resource "aws_dynamodb_table" "mytfdb-name" {
    name = "mytfdb-name"
    read_capacity = 10
    write_capacity = 10
    hash_key = "mytfdbHashKey"

attribute {
    name = "mytfdbHashKey"
    type = "S"
}
}
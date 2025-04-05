resource "random_id" "test" {
  byte_length = 4
}

output "test_id" {
  value = random_id.test.hex
}

output "module_name" {
  value = basename(path.cwd)
}

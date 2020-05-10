data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

output "my_public_ip" {
  value = "${data.external.myipaddr.result.ip}"
}
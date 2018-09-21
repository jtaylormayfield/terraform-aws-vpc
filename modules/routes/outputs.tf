output "ngw_public_ip" {
  value = "${aws_nat_gateway.ngw.*.public_ip[0]}"
}

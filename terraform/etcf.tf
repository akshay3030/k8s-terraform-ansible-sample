#########################
# etcd cluster instances
#########################

resource "aws_instance" "etcd" {
    count = 3
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "${var.etcd_instance_type}"

    subnet_id = "${data.aws_subnet.private_subnet_0.id}"
    #private_ip = "${cidrhost(var.vpc_cidr, 10 + count.index)}"
    #associate_public_ip_address = true # Instances have public, dynamic IP

    availability_zone = "${var.region}${var.availibility_zone_suffix}"
    vpc_security_group_ids = ["${aws_security_group.kubernetes.id}"]
    key_name = "${var.default_keypair_name}"

    tags {
      Owner = "${var.owner}"
      Name = "etcd-${count.index}"
      ansibleFilter = "${var.ansibleFilter}"
      ansibleNodeType = "etcd"
      ansibleNodeName = "etcd${count.index}"
    }
}

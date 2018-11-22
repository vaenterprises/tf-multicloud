resource "digitalocean_ssh_key" "do_ssh_key" {
    name       = "Test SSH Key"
    public_key = "${var.do_ssh_key}"
}

resource "digitalocean_droplet" "do-test-droplet" {
    image  = "ubuntu-16-04-x64"
    name   = "do-test-droplet"
    region = "sgp1"
    size   = "1gb"
    ssh_keys = ["${digitalocean_ssh_key.do_ssh_key.fingerprint}"]
}

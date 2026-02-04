resource "google_compute_instance" "web" {
  name         = "web-vm"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }

  metadata_startup_script = <<EOF
#!/bin/bash
apt-get update -y
apt-get install -y nginx
echo "<h1>Hello from Terraform + GitOps v2</h1>" > /var/www/html/index.html
systemctl enable nginx
systemctl start nginx
EOF
}

provider "local" {}

resource "random_pet" "example" {
  length = 2
}

resource "null_resource" "generate_id" {
  triggers = {
    random_id = random_pet.example.id
  }

  provisioner "local-exec" {
    command = "echo '${random_pet.example.id}' > generated_id.txt"
  }
}

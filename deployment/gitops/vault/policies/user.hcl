path "secret/platform/*" {
   capabilities = [  "read", "list" ]
}

path "*" {
   capabilities = ["deny"]
}

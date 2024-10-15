path "secret/data/platform/*" {
   capabilities = [ "create", "read", "update", "patch" ]
}

path "*" {
   capabilities = ["deny"]
}

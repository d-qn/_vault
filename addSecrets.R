library(secret)
library(here)

# create vault
here()
create_vault(here("tdg", "_vault"))
path <- here("tdg", "_vault")

# add user and my public key
openssl::read_pubkey("~/.ssh/id_rsa.pub")
myprivatekey <- here(".ssh", "id_rsa")
mypublickey <- here(".ssh", "id_rsa.pub")
add_user("ducquang.nguyen@gmail.com", mypublickey, vault = path)


# https://cran.r-project.org/web/packages/secret/vignettes/secrets.html
secret_to_keep <- c(password = "my_password")
add_secret("secret_one", secret_to_keep, users = "alice", vault = vault)

add_secret("wch_interactive", wch_interactive, 
           users = "ducquang.nguyen@gmail.com", vault = path)


get_secret("wch_interactive", key = myprivatekey, vault = path)

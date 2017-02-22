TODO

```
sudo apt-get install npm
sudo npm install -g node-red-admin
```

Create a password hash:

```
node-red-admin hash-pw
```

Add in `settings.js`:

```
adminAuth: {
    type: "credentials",
    users: [
        {
            username:        "admin",
            password:        "<password hash>",
            permissions:     "*"
        }
    ],
    default: {
        permissions:         "read"
    }
}
```
### Rails API

For the moment there is no token anywhere and no sign-in

* * *
### Endpoints

**GET /users**
visualize public info for all users

**GET /users/id**
visualize public info for specified user

**POST /signup**

data-form body:
```
{
  user[first_name]: "something",
  user[last_name]: "something",
  user[username]: "something",
  user[email]: "something@yopmail.com",
  user[password]: "something"
}
```

**PATCH /users/id**

data-form body:
```
{
  user[first_name]: "something",
  user[last_name]: "something",
  user[username]: "something",
  user[email]: "something@yopmail.com",
  user[password]: "something"
}
```

**DELETE /users/id**

example answer 
```{
  id: 3
  status: 'user deleted'
}```
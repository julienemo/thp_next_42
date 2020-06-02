### Rails API


* * *
### Endpoints

#### Public (without token)
**POST /sign_up**

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

After sign-up, user needs to sign-in to get token


**POST /sign_in**

data-form body:
```
{
  user[email]: "something@yopmail.com",
  user[password]: "something"
}
```
Token is in the "Authorization" header

#### Private (token mandatory)

the following requests need authorization header

**DELETE /sign_out**
no body

**GET /users**
visualize public info for all users

**GET /users/id**
visualize public info for specified user

**PATCH /users/id**

update certain info on specified user (currently can modify other people's info)

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

(currently can modify other people's info)

answer 
```{
  id: 3
  status: 'user deleted'
}```
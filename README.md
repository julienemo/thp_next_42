### Rails API


* * *
### Endpoints

* * *

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

* * *

#### Private (token mandatory)

the following requests need authorization header

**DELETE /sign_out**
no body

**GET /users**
visualize public info for all users

**GET /users/id**
visualize public info for specified user

**GET /profile**
visualize own profile, all info except for password

**PATCH /users/id**

only allowed on one's own profile

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

only allowed on one's own profile

answer 
```{
  id: 3
  status: 'user deleted'
}
```

**GET /images**
visualize all public or own images

**GET /images/id**
visualize specified image, if private, returns "can not find"

**POST /images**

data-form body:
```
{
  image[description]: "something",
  image[extension]: "something",
  image[stream]: "something",
  image[is_private]: true
}
```

**PATCH /images/id**
only allowed on one's own image

data-form body:
```
{
  image[description]: "something",
  image[extension]: "something",
  image[stream]: "something",
  image[is_private]: true
}
```

**DELETE /images/id**
only allowed on one's own image


**GET /profile/images**
visualize one's own images


**GET /users/id/images**
visualize a specified user's visible images

**POST /images/id/comments**
can not comment on an image you can't see
currently supports that children and parent have different image ref

data-form body:
```
{
  comment[content]: "something",
  comment[parent_id]: n, (optional)
}
```

**GET /comments/id**
visualize a specified comment

**PATCH /comments/id**
only allowed on one's own comment as author
currently supports that children and parent have different image ref

data-form body:
```
{
  comment[content]: "something",
  comment[parent_id]: n, (optional)
}
```

**DELETE /comments/id**
only allowed on one's own comment as author
cannot delete comments that have children

**GET profile/comments**
visualize all one's own comments
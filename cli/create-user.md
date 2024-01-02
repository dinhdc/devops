# Using AWS CLI to create IAM user With NONE PERMISSION
## Create IAM user

- ```aws iam create-user --user-name YOUR_USERNAME```

- Output

```json
{
    "User": {
        "UserName": "YOUR_USERNAME",
        "Path": "/",
        "CreateDate": "2022-01-08T03:20:41.270Z",
        "UserId": "AIDAIOSFODNN7EXAMPLE",
        "Arn": "arn:aws:iam::123456789012:user/YOUR_USERNAME"
    }
}
```

## Create Login Profile for User

- Generate login profile skeleton
- ```aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json```

- Edit information for user/password
```
vi create-login-profile.json

# Edit User/pass information as following

{
    "UserName": "YOUR_USERNAME",
    "Password": "123123a@",
    "PasswordResetRequired": true
}

```
- Create Login Profile
- ```aws iam create-login-profile --cli-input-json file://create-login-profile.json```

- Output

```
{
    "LoginProfile": {
        "UserName": "YOUR_USERNAME",
        "CreateDate": "2022-01-08T20:55:40.274Z",
        "PasswordResetRequired": true
    }
}
```

# Using AWS CLI to create IAM user with CHANGE PASSWORD PERMISSION

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

## Create IAM Group

- Create your group entity
- ```aws iam create-group --group-name YOUR_GROUP```

- Create your json policy file **change-password-policy.json** and insert this to your json file
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Action": "iam:GetAccountPasswordPolicy",
        "Resource": "*"
    },
    {
        "Effect": "Allow",
        "Action": "iam:ChangePassword",
        "Resource": "arn:aws:iam::*:user/${aws:username}"
    }
  ]
}
```

## Create IAM Policy
- Create your policy entity to change password after login
- ```aws iam create-policy --policy-name YOUR_POLICY_NAME --policy-document file://change-password-policy.json```


## Attach POLICY to GROUP and USER to GROUP
- Attach YOUR POLICY to YOUR Group
- ```aws iam attach-group-policy --group-name YOUR_GROUP_NAME --policy-arn YOUR_POLICY_ARN```

- Attach YOUR USER to YOUR GROUP
- ```aws iam add-user-to-group --user-name YOUR_USER --group-name YOUR_GROUP```
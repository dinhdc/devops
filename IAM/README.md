# IAM Service

## IAM Policy

- Một policy là danh sách các **statements**
- **Sid** là một **id** được đặt tùy ý
- **Action** là hành động tác động lên **Resource**
- **Effect** là cho phép (**Allow**) hoặc từ chối (**Denied**)
- **Resource** là hành động được thực hiện trên resource nào

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "IdentityBasePolicy",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::abc"
      ]
    }
  ]
}
```

- Các tính năng của dịch vụ IAM
    - Quản lý phân quyền tập trung cho tài khoản AWS
    - Chia sẻ quyền hạn (permission) cho các tài khoản AWS khác
    - Kiểm soát (Granular Permissions) tới từng action
    - Identity Federation
    - Xác thực nhiều lớp (Multifactor Authentication)
    - Thiết lập password policy cho các tài khoản
    - Hỗ trợ tích hợp với nhiều dịch vụ khác của AWS

## IAM Role

- Role là cách gán quyền cho một Service có quyền truy cập tới:
    - Service khác trong cùng tài khoản
    - Service ở một tài khoản khác (Cross Account Access)

## IAM best practice

- Một người dùng thật (real user) ánh xạ với một IAM User
- Không sử dụng **Root User** cho các hoạt động quản trị thông thường
- Không bao giờ nhúng **IAM Credentials** vào trong soure code
- Không sử dụng **IAM Credentials** của **Root User**
- Bật xác thực nhiều lớp (MFA)
- Luôn luôn áp dụng nguyên tắc **Quyền tối thiểu (Least Priviledge Principle)**

## AWS CLI

- create user: ```aws iam create-user --user-name Bob```
  - create profile template: ```aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json```
     - 71  aws iam create-user --user-name Bob
     - 72  aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json
     - 73  ls -la
     - 74  vi create-login-profile.json
     - 75  aws iam create-login-profile --cli-input-json file://create-login-profile.json
     - 76  vi create-login-profile.json
     - 77  aws iam create-login-profile --cli-input-json file://create-login-profile.json
     - 78  aws iam create-user --user-name Pop
     - 79  aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json
     - 80  vi create-login-profile.json
     - 81  aws iam create-login-profile --cli-input-json file://create-login-profile.json
     - 82  cat create-login-profile.json 
     - 83  aws iam create-group --group-name Ops
     - 85  touch ec2-full-access-policy.json
     - 86  nano ec2-full-access-policy.json 
     - 87  aws iam create-policy --policy-name EC2FullAccess --policy-document file://ec2-full-access-policy.json
     - 88  aws iam attach-group-policy --group-name Ops --policy-arn arn:aws:iam::416145167352:policy/EC2FullAccess
     - 89  aws iam add-user-to-group --user-name Bob --group-name Ops
     - 90  aws iam create-login-profile --user-name Bob --password Callmedev2k@ --password-reset-required
     - 91  aws iam create-login-profile --user-name Bobv2 --password Callmedev2k@ --password-reset-required
     - 92  aws iam create-user --user-name Bobv2
     - 93  aws iam create-login-profile --user-name Bobv2 --password Callmedev2k@ --password-reset-required
     - 94  ls -la
     - 95  nano ec2-full-access-policy.json 
     - 96  history

# Localstack Terraform 테스트

- sqs, s3 서비스 테스트 내용입니다.

1. Localstack 실행(docker-compose)
```bash
docker-compose up -d --build
```

2. Terraform apply
```bash
terraform init
terraform apply
```

3. 결과 확인
```bash
aws --endpoint-url=http://localhost:4566 s3api list-buckets --query "Buckets[].Name"
aws --endpoint-url=http://localhost:4566 sqs list-queues
or
awslocal s3api list-buckets --query "Buckets[].Name"
awslocal sqs list-queues
```


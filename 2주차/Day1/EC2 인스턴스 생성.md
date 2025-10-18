<EC2 인스턴스 생성>

1. AWS Console → EC2 → Launch Instance
2. 이름: week2-day1-server
3. AMI 선택: Ubuntu 22.04 LTS
4. 인스턴스 타입: t2.micro (Free Tier)
5. 키페어 생성: week2-key.pem 다운로드
6. 네트워크 설정: 보안 그룹 → SSH(22), HTTP(80) 열기
7. 인스턴스 실행 후 퍼블릭 IPv4 주소 확인
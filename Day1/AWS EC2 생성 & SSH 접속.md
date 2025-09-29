AWS EC2 (Ubuntu) 생성 & SSH 접속

1) AWS 계정 로그인 → EC2 → '인스턴스 시작'
   - AMI: Ubuntu 22.04 LTS 선택
   - 인스턴스 유형: t2.micro (Free Tier)
   - 키페어 생성 → .pem 파일 다운로드
   - 보안 그룹: 22번 포트(SSH) 허용

2) 로컬 터미널에서 원격 서버 접속:
# SSH로 접속하기 이전에 EC2의 보안그룹을 SSH, 포트 22번으로 설정해둬야 SSH 접속이 가능하다.
ssh -i ~/다운로드/mykey.pem ubuntu@<EC2_공인_IP>

exit # 원격 서버에서 로그아웃
<키페어 권한 설정 & SSH 접속>

1. 로컬 PC 터미널에서:
   chmod 400 week2-key.pem
   ssh -i week2-key.pem ubuntu@퍼블릭IP
2. 성공하면 프롬프트가 ubuntu@ip-... 형태로 바뀜
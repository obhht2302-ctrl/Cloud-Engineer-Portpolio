<AWS 계정 생성>

1. AWS 공식 사이트(https://aws.amazon.com) 접속
2. 무료 계정 만들기 (Free Tier) 선택
3. 이메일, 비밀번호, 결제 카드 등록 (무료 티어지만 카드 등록 필요)
4. 루트 계정 로그인 성공 확인

<IAM 사용자 생성 (보안 모범 사례)>

1. AWS Management Console → IAM 서비스 이동
2. 사용자 추가 클릭
   - 이름: obhml-admin (예시)
   - 권한: AdministratorAccess 정책 할당
3. 액세스 키 생성 → 로컬에 저장
   - CLI에서 사용 가능 (오늘은 콘솔 위주, 내일 CLI 실습에 활용)
# 3주차 학습 요약 — S3 & EC2 연동

## 1. S3 기본 개념
- AWS의 객체 스토리지
- 정적 웹사이트 호스팅 가능
- 버킷 정책 및 퍼블릭 접근 설정 중요

## 2. CLI 활용
- aws s3 sync 명령어로 업로드/삭제 자동화
- --delete 옵션으로 완전 동기화 가능
- --cache-control 옵션으로 캐시 무효화 적용

## 3. EC2 ↔ S3 연동
- IAM Role을 이용해 Access Key 없이 인증
- EC2 내부에서 CLI로 업로드 테스트 성공

## 4. 자동 배포 스크립트
- deploy.sh 작성
- chmod +x 권한 부여 후 실행
- 한 줄 명령으로 전체 사이트 자동 업데이트

## 5. 트러블슈팅
- AccessDenied → Role 미연결
- credentials 오류 → ~/.aws 삭제
- 캐시 반영 안됨 → --cache-control 추가

✅ **이번 주 목표 달성:**  
정적 웹사이트 자동 배포 파이프라인 완성!

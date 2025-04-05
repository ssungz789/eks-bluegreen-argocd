
# 고급 실습: App of Apps, ALB, Route53 트래픽 전환

이 구성은 다음을 포함합니다:
- ArgoCD App of Apps 구조로 모듈화된 배포
- ALB Controller를 Helm으로 배포
- Route53 weighted 레코드로 Blue → Green 트래픽 전환

초기 설정 시 Blue에 100%, Green에 0% 트래픽 전송
terraform apply 후 수동으로 weight 값을 변경하면 트래픽을 점진적으로 전환할 수 있습니다.

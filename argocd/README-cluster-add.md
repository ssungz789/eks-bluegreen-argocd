
# ArgoCD Cluster 등록 가이드

ArgoCD는 기본적으로 자기 클러스터만 알고 있습니다.
따라서 green 클러스터를 ArgoCD가 알 수 있도록 아래 명령어를 사용하여 등록해야 합니다.

## Blue 클러스터에서 Green 연결 추가

1. kubeconfig를 green으로 설정
   ```
   aws eks update-kubeconfig --name eks-green --region ap-northeast-2
   ```

2. Blue 클러스터에 로그인된 상태에서 아래 명령 실행
   ```
   argocd cluster add <green-context-name>
   ```

위 명령을 통해 ArgoCD에서 green 클러스터도 관리할 수 있게 됩니다.

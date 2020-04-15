kubectl -n rollback set image deployment/nginx-deployment nginx=nginx:1.16.1 --record

kubectl -n rollback get po -w

echo ""

kubectl -n rollback rollout history deploy/nginx-deployment --revision=2

echo ""

kubectl -n rollback rollout history deploy/nginx-deployment

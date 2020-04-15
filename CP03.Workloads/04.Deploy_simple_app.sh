
kubectl create ns rollback
kubectl -n rollback apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
kubectl -n rollback get all
kubectl -n rollback rollout status deploy/nginx-deployment
kubectl -n rollback rollout history deploy/nginx-deployment

kubectl -n rollback get all

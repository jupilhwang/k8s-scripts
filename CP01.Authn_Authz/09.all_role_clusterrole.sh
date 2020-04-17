
kubectl config use-context mgmt-admin@mgmt
kubectl get role,clusterrole --all-namespaces

kubectl config use-context dev-admin@dev
kubectl get role,clusterrole --all-namespaces

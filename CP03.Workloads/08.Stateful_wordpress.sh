kubectl create ns ns-stateful
kubectl -n ns-stateful create secret generic mysql-pass --from-literal=password='VMware1!'
kubectl -n ns-stateful apply -f https://k8s.io/examples/application/wordpress/mysql-deployment.yaml
kubectl -n ns-stateful apply -f https://k8s.io/examples/application/wordpress/wordpress-deployment.yaml

kubectl -n ns-stateful get all

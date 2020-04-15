
kubectl -n ns-stateless scale deploy frontend --replicas=4

kubectl -n ns-stateless get po -w

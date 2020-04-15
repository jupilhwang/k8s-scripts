
kubectl -n ns-stateless scale deploy frontend --replicas=5
kubectl -n ns-stateless get po -w

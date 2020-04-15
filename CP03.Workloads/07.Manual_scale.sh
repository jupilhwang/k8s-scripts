kubectl -n ns-stateless scale deploy frontend --replicas=10

kubectl -n ns-stateless get po -w

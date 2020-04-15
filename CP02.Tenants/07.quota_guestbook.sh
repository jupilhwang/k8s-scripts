
#kubectl -n ns-stateless create quota object-counts --hard=count/pods=7,limits.cpu=2000m,limits.memory=2000Mi
kubectl -n ns-stateless create quota object-counts --hard=count/pods=7

kubectl -n ns-stateless describe quota object-counts

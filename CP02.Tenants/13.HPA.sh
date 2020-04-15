kubectl -n ns-stateless autoscale deploy frontend --min=3 --max=5 --cpu-percent=30

kubectl -n ns-stateless describe hpa frontend

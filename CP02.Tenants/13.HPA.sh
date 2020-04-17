kubectl -n ns-stateless autoscale deploy frontend --min=3 --max=10 --cpu-percent=40

kubectl -n ns-stateless describe hpa frontend

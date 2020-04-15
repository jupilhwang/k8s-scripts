kubectl -n ns-stateless autoscale deploy frontend --min=3 --max=5 --cpu-percent=20

kubectl -n ns-stateless describe hpa frontend

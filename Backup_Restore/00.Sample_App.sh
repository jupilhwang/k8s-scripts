
echo ""
echo "####  Namespaces"
kubectl get ns


echo ""
echo "####  Deploy Nginx App"
kubectl apply -f with-pv.yaml


echo ""
echo "#### Get Nginx Application"
kubectl -n nginx-example get all
kubectl -n nginx-example get pvc


kubectl -n nginx-example annotate pod --selector app=nginx backup.velero.io/backup-volumes=nginx-logs --overwrite


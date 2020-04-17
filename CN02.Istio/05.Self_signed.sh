echo "#### Get secrets in default namespace"
kubectl get secrets


echo "#### Create Issuer"
kubectl apply -f -<<EOF
apiVersion: cert-manager.io/v1alpha2
kind: Issuer
metadata:
  name: selfsigned-issuer
spec:
  selfSigned: {}
EOF

echo "#### Get secrets in default namespace"
kubectl get secrets

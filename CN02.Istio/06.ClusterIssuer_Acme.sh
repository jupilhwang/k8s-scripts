
kubectl apply -f -<<EOF
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    email: jupil.hwang@gmail.com
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: issuer-account-key
    solvers:
    - http01:
        ingress:
          class: contour
EOF


sleep 3 
echo "#### ClusterIssuer"
kubectl describe ClusterIssuer letsencrypt-staging 

cat << EOF | kubectl apply -f -
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: jupil.hwang@gmail.com
    privateKeySecretRef:
      name: letsencrypt-private-key-prod
    solvers:
    - selector: {}
      http01:
       ingress:
         class: contour
---
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: jupil.hwang@gmail.com
    privateKeySecretRef:
      name: letsencrypt-private-key-staging
    solvers:
    - selector: {}
      http01:
       ingress:
         class: contour
EOF


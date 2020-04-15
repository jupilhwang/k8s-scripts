
kubectl apply -f -<<-EOF
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: https-ingress
  namespace: test-ingress
  labels:
    app: hello
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
    ingress.kubernetes.io/force-ssl-redirect: "True"
    kubernetes.io/ingress.class: contour
    kubernetes.io/tls-acme: "true"
spec:
  tls:
  - secretName: https-ingress-tls
    hosts:
    - hello.tidc.skt
  rules:
  - host: hello.tidc.skt
    http:
      paths:
      - path: /foo
        backend:
          serviceName: s1
          servicePort: 80
      - path: /bar
        backend:
          serviceName: s2
          servicePort: 80
EOF

echo ""
echo "#### Ingress with Cert-Manager"
kubectl -n test-ingress describe ing https-ingress



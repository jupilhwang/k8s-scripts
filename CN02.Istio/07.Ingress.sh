

kubectl apply -f -<<EOF
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: httpbin
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-staging
    ingress.kubernetes.io/force-ssl-redirect: "true"
    kubernetes.io/ingress.class: contour
    kubernetes.io/tls-acme: "true"
spec:
  tls:
  - secretName: httpbin
    hosts:
    - http.k8s.tidc.skt
  rules:
  - host: http.k8s.tidc.skt
    http:
      paths:
      - backend:
          serviceName: httpbin
          servicePort: 8080

EOF

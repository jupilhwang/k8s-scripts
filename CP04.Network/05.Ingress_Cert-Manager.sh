kubectl apply -f -<<-EOF
apiVersion: v1
kind: Namespace
metadata:
  name: test-ingress
---
apiVersion: v1
kind: Service
metadata:
  name: s1
  namespace: test-ingress
  labels:
    app: hello
spec:
  selector:
    app: hello
    tier: web
  ports:
  - port: 80
    targetPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: s2
  namespace: test-ingress
  labels:
    app: hello
spec:
  selector:
    app: hello
    tier: web
  ports:
  - port: 80
    targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloweb
  namespace: test-ingress
  labels:
    app: hello
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello
      tier: web
  template:
    metadata:
      labels:
        app: hello
        tier: web
    spec:
      containers:
      - name: hello-app
        image: gcr.io/google-samples/hello-app:1.0
        ports:
        - containerPort: 8080
EOF

kubectl apply -f -<<-EOF
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: http-ingress
  namespace: test-ingress
  labels:
    app: hello
spec:
  rules:
  - host: example.com
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

kubectl -n test-ingress get po,deploy,ing

echo ""
echo "#### Ingress config"
kubectl -n test-ingress describe ing http-ingress


sleep 5

echo ""
echo "#### HTTP request"
curl -s --header 'Host:example.com' http://10.197.37.200:32326/foo




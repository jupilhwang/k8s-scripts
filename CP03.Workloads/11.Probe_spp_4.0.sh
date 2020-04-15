kubectl apply -f -<<-EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-deployment
  labels:
    app: webapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: webapp
        image: namoo4u/probe-check-app:4.0
        ports:
        - containerPort: 5000
        readinessProbe:
          httpGet:
            path: /health
            port: 5000
          initialDelaySeconds: 40
        livenessProbe:
          httpGet:
            path: /health
            port: 5000
          initialDelaySeconds: 120
---
apiVersion: v1
kind: Service
metadata:
  name: webservice
spec:
  selector:
    app: webapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 5000
EOF

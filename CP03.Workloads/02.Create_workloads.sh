
kubectl apply -f -<<-EOF
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: cronjob-hello
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox
            args:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes cluster
          restartPolicy: OnFailure
EOF

kubectl run cronjob-hello --schedule="*/1 * * * *" --restart=OnFailure --image=busybox -- /bin/sh -c "date; echo Hello from the Kubernetes cluster"
kubectl get cronjob cronjob-hello

kubectl get jobs -w

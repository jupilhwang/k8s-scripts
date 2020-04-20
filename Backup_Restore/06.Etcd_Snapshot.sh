kubectl -n kube-system exec -it etcd-dev-control-plane-6zbwd -- \
etcdctl \
--endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
-w table \
snapshot save /var/lib/etcd_backup_snapshot.db

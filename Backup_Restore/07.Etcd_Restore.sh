kubectl -n kube-system exec -it etcd-dev-control-plane-6zbwd -- \
etcdctl \
snapshot restore /var/lib/etcd_backup_snapshot.db

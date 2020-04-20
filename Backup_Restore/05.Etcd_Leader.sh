kubectl -n kube-system exec -it etcd-dev-control-plane-6svlc -- \
etcdctl \
-w table \
--endpoints=https://10.40.89.211:2379,https://10.40.89.204:2379,https://10.40.89.207:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
endpoint status

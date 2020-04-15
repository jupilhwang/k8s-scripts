kubectl --kubeconfig user05-kubeconfig -n ns-stateless patch quota object-counts -p '{"spec": {"hard": {"count/pods":10}}}'

kubectl -n default create rolebinding org01-view-all --clusterrole=view --group=group01
kubectl -n default create rolebinding org02-view-all --clusterrole=view --group=group02
kubectl -n default create rolebinding org03-view-all --clusterrole=view --group=group03
kubectl -n default create rolebinding org04-view-all --clusterrole=view --group=group04
kubectl -n default create rolebinding org05-view-all --clusterrole=view --group=group05


#kubectl -n org02 create rolebinding org02-view --clusterrole=view --user=user08
#kubectl -n org02 create rolebinding org02-view --clusterrole=view --user=user09
#kubectl -n org02 create rolebinding org02-view --clusterrole=view --user=user10

kubectl create ns org01
kubectl create ns org02
kubectl create ns org03
kubectl create ns org04
kubectl create ns org05

kubectl -n org01 create rolebinding org01-view-all --clusterrole=view --group=group01
kubectl -n org01 create rolebinding org01-admin --clusterrole=admin --user=user01
kubectl -n org01 create rolebinding org01-edit --clusterrole=edit --user=user02

kubectl -n org01 create rolebinding org01-view-all --clusterrole=view --group=group02
kubectl -n org02 create rolebinding org02-admin --clusterrole=admin --user=user06
kubectl -n org02 create rolebinding org02-edit --clusterrole=edit --user=user07

kubectl -n org01 create rolebinding org01-view-all --clusterrole=view --group=group03
kubectl -n org03 create rolebinding org03-admin --clusterrole=admin --user=user11
kubectl -n org03 create rolebinding org03-edit --clusterrole=edit --user=user12


kubectl -n org01 create rolebinding org01-view-all --clusterrole=view --group=group04
kubectl -n org04 create rolebinding org04-admin --clusterrole=admin --user=user16
kubectl -n org04 create rolebinding org04-edit --clusterrole=edit --user=user17


kubectl -n org01 create rolebinding org01-view-all --clusterrole=view --group=group05
kubectl -n org05 create rolebinding org05-admin --clusterrole=admin --user=user21
kubectl -n org05 create rolebinding org05-edit --clusterrole=edit --user=user22



#kubectl -n org02 create rolebinding org02-view --clusterrole=view --user=user08
#kubectl -n org02 create rolebinding org02-view --clusterrole=view --user=user09
#kubectl -n org02 create rolebinding org02-view --clusterrole=view --user=user10

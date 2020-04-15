export API_ENDPOINT=10.197.37.218:6443
export POD_NAME='kube-apiserver-dev-cluster-control-plane-gv4x5'
export USERNAME=private-user
export GROUP=private-group

#envsubst < ./private-user-group/private_key_template.json | cfssl genkey - | cfssljson -bare client

cat <<EOF | echo kubectl apply -f -
apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: $USERNAME
spec:
  username: $USERNAME
  groups:
  - system:authenticated
  request: $(cat client.csr | base64 | tr -d '\n')
  usages:
  - digital signature
  - key encipherment
  - client auth
EOF

dd if=/dev/urandom of=~/.rnd bs=256 count=1

kubectl -n kube-system exec ${POD_NAME} -- cat /etc/kubernetes/pki/ca.crt > ./private-user-group/ca.crt
kubectl -n kube-system exec ${POD_NAME} -- cat /etc/kubernetes/pki/ca.key > ./private-user-group/ca.key

openssl req -new -newkey rsa:2048 -nodes -keyout ./private-user-group/${USERNAME}.key -out ./private-user-group/${USERNAME}.csr -subj "/O=${GROUP}/CN=${USERNAME}"

openssl x509 -req -days 3650 -CA ./private-user-group/ca.crt -CAkey ./private-user-group/ca.key -CAcreateserial -in ./private-user-group/${USERNAME}.csr -out ./private-user-group/${USERNAME}.crt

kubectl create ns private-org
kubectl -n private-org create rolebinding private-org-admin --clusterrole=admin --user=$USERNAME

rm -rf ./private-user-kubeconfig
export KUBECONFIG=./private-user-kubeconfig
kubectl config set-cluster dev --server=https://$API_ENDPOINT --certificate-authority=./private-user-group/ca.crt --embed-certs=true
kubectl config set-credentials ${USERNAME} --client-certificate=./private-user-group/${USERNAME}.crt --client-key=./private-user-group/${USERNAME}.key --embed-certs=true
kubectl config set-context dev --cluster=dev --user=$USERNAME
kubectl config use-context dev

echo "kubectl get all from Cluster"
kubectl get all 

echo ""
echo ""

echo "kubectl get all -n private-org"
kubectl get all -n private-org

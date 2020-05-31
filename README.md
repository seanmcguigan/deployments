# deployments

# install flux
helm upgrade -i flux fluxcd/flux --wait --namespace fluxcd --set git.url=git@github.com:seanmcguigan/deployments.git --set git.branch=development

# install flux crd
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/crds.yaml

# install helm operator
helm upgrade -i helm-operator fluxcd/helm-operator --wait --namespace fluxcd --set git.ssh.secretName=flux-git-deploy --set helm.versions=v3

# get flux public key
fluxctl identity --k8s-fwd-ns fluxcd


#!/bin/bash
kubectl -n kube-system get configmap kubeadm-config -o jsonpath={.data.ClusterConfiguration} 2>/dev/null | echo -n replaceme.io
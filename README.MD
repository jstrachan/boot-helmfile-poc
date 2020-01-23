# jx-boot-helmfile

Experimentle repo looking at getting [helmfile](https://github.com/roboll/helmfile) working with a jx boot config repo.

## prerequisits

- helmfile `brew install helmfile` - note this also installs a helm 3 binary on your `$PATH`
- helm plugins
```bash
helm plugin install https://github.com/aslafy-z/helm-git.git
helm plugin install https://github.com/databus23/helm-diff
```
- clean Jenkins X cluster created with `jx create cluster gke --skip-installation`

## running the helmfile installer

There's lots of info on the [helmfile](https://github.com/roboll/helmfile) github repo, take a look to see how things fit together.

```
git clone git@github.com:jenkins-x-labs/boot-helmfile-poc.git
cd boot-helmfile-poc
```    

### modify requirements

modify the `jx-requirements.yml` to modify the `cluster` fields to point to your cluster: 

* `clusterName`
* `project`
* `zone`

### setup Secrets


write some installation secrets to a file using the template below, this is a temporary solution

```
vi $HOME/.jx/localSecrets/{{ add your cluster name }}/secrets.yaml
```

```yaml
secrets:     
  adminUser:
    username: "admin"
    password: "" 
  hmacToken: "" 
  pipelineUser:
    username: ""  
    email: "" 
    token: "" 
```


### run boot

from inside your git clone run

``` 
jx boot
``` 

using a recent `jx`  version 

## uninstall

```
helmfile destroy
```



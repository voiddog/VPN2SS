# Convert VPN to SS use docker
借助 docker 的虚拟机，把 vpn 代理成 shadowsocks 开放出来
> 必须先安装 docker

## build 镜像
如果没有 build 过镜像，首先需要 build 镜像
```bash
bash build_docker.sh
```
build 之后，执行下面步骤

## 开启 ss 服务
首选需要配置 openvpn 对应的配置文件(.ovpn 文件)，可以去对应的 vpn 服务商下载，下载后放到 `vpnapp` 目录下
> `vpnapp` 目录作为映射映射到了 docker 容器中

然后在 `vpnapp` 目录下创建 `user-pass` 文件，文件的第一行为你 vpn 登录的 username, 第二行为 password
例：user-pass
```
username
1234567
```

修改 `vpnapp/run_ss.sh` 中默认的 ovpn_config 的文件名为你下载的 .ovpn 文件，或者修改 `run_docker.sh` 中的命令，添加 `-o your.ovpn` 参数
```bash
...
ubuntu:vpn2ss /bin/bash /vpnapp/run_ss.sh -o your.ovpn
```

最后执行 `bash run_docker.sh` 就可以了

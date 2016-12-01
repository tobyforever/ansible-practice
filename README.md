# ansible 常用模块命令
* 拷贝文件

```bash
$ ansible atlanta -m copy -a "src=/etc/hosts dest=/tmp/hosts"
```

* yum和apt软件包管理

```bash
$ ansible webservers -m yum -a "name=acme state=present"
$ ansible webservers -m yum -a "name=acme-1.5 state=present"
$ ansible webservers -m yum -a "name=acme state=latest"
$ ansible webservers -m yum -a "name=acme state=absent"
```
如果不是yum或者apt，也可以用command模块来通过脚本安装。

loop with_items 循环变量
https://raw.githubusercontent.com/ansible/ansible-examples/master/language_features/loop_with_items.yml

* 用户和组管理

```bash
$ ansible all -m user -a "name=foo password=<crypted password here>"

$ ansible all -m user -a "name=foo state=absent"
```


* 从git下载代码

```bash
$ ansible webservers -m git -a "repo=git://foo.example.org/repo.git dest=/srv/myapp version=HEAD"
```

* 服务service管理

```bash
$ ansible webservers -m service -a "name=httpd state=started"
$ ansible webservers -m service -a "name=httpd state=restarted"
$ ansible webservers -m service -a "name=httpd state=stopped"
```

* 长时间运行后台任务，并在后续检查任务状态

```bash
#不轮询
$ ansible all -B 3600 -P 0 -a "/usr/bin/long_running_operation --do-stuff"
#用async_status检查任务状态
$ ansible web1.example.com -m async_status -a "jid=488359678239.2844"
#轮询每60s
$ ansible all -B 1800 -P 60 -a "/usr/bin/long_running_operation --do-stuff"
```
一般是把长时间运行的shell脚本和软件升级作为background。copy模块拷贝文件不能被设为后台。

* 获取Facts

```bash
#不轮询
$ ansible all -m setup
```

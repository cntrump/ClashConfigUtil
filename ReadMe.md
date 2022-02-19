# ClashConfigUtil

Clash 配置文件实用工具。

需要安装: `ruby`。

实现订阅线路和自定义规则分离。

基本配置文件：`basic.yaml`，忽略 `rules`、`proxies`、 `proxy-groups`。

可选自定义规则：`proxyGroups.yaml`，只读取 `proxy-groups`, 使用该配置文件将忽略默认生成的 3 个 `proxy-groups` 配置, `proxyGroups.yaml` 的 `proxy-group` 节点添加自定义可选属性: `proxies-type`, 值为 `all` 时为使用 `proxies` 节点, `add` 时为保留配置文件中的节点并添加所有的 `proxies` 节点, 无该属性时不添加 `proxies` 节点。

```yaml
proxy-groups:
-
  name: Proxy
  type: select
  proxies-type: all
-
  name: Domestic
  type: select
  proxies-type: add
  proxies:
    - AUTO
```

自定义规则：`rules.yaml`，只读取 `rules`。

节点文件或订阅链接：由命令行参数指定，只读取 `proxies`。

`basic.yaml` 配置文件添加可选属性 `proxies-ignore-first-counts`, 该属性用来忽略节点文件或订阅链接的 `proxies` 前几个节点。

```
proxies-ignore-first-counts:
  - 4 # 忽略第一个节点文件或订阅链接的 `proxies` 前4个节点。
  - 3 # 忽略第二个节点文件或订阅链接的 `proxies` 前3个节点。
```

忽略默认的

生成的配置文件名称：`config.yaml`。

生成默认的 3 个 `proxy-groups`：

- `PROXY`，用户选择的节点
- `AUTO`，自动测速节点
- `FINAL`，兜底策略

## 使用方法

```
./ClashConfigUtil proxys_url1 proxys_url2 ...
```

```
./ClashConfigUtil proxys_file1 proxys_file2 ...
```

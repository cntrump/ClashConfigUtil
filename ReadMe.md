# ClashConfigUtil

Clash 配置文件实用工具。

## Why

Clash 的配置文件中，线路和策略是混合在一起的，这样设计的好处是每一份配置文件都包含了完整的信息。

但是用户基本上都有一套自己的规则，引用订阅配置的时候只希望使用里面的线路再配合自己的规则使用。

本脚本就是实现这样的功能，把订阅配置中的线程单独提取出来整合到 `proxies` 里。

然后在 `proxy-groups` 中创建三个组：`PROXY`, `AUTO`, `FINAL`。

分别表示**手动选择**、**自动测速**和**兜底策略**。

`rules` 是用户定义的规则集，与上面的三个策略组相绑定，这样就实现了订阅配置线路+自定义规则组合的功能。

每次更新订阅的时候，都使用本脚本来操作，就不会让自定义规则被覆盖了。

## How

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

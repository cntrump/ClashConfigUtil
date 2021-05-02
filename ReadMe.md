# ClashConfigUtil

Clash 配置文件实用工具。

需要安装: `ruby`。

实现订阅线路和自定义规则分离。

基本配置文件：`basic.yaml`，忽略 `rules`、`proxies`、 `proxy-groups`。

自定义规则：`rules.yaml`，只读取 `rules`。

节点文件或订阅链接：由命令行参数指定，只读取 `proxies`。

生成的配置文件名称：`config.yaml`。

生成 3 个 `proxy-groups`：

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
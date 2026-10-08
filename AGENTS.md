# jx3-skill-parser

此仓库是 Node.js 技能 Lua 解析器，依赖已发布的 wasmoon-lua5.1。保留用户未提交和已暂存的内容；未经明确要求不提交、推送或触发发布。

- 使用 tsdown 生成 CommonJS、ESM 和各自声明。公共选项与结果类型从包入口导出；动态游戏字段不得凭猜测补成确定类型。
- `dist/lua` 是运行时资产，必须进入 tarball。修改打包或声明后运行 `npm run test:package`，验证独立安装、两种入口和不带 DOM/skipLibCheck 的 Node 类型检查。
- npm CLI 相关验证使用工作流固定的 npm 版本，不用本机不同版本的结果代替。正式依赖与锁文件不使用邻仓库路径或未发布版本。
- npm Trusted Publisher 对应 master 分支的 `.github/workflows/publish.yml`。用户已确认允许直接 npm publish；不要改为 stage 或加入 token 兜底。具体命令见 README。
- 不修改调用方传入的配置、解析选项或共享数据。新增和修改的源码文件用简短中文文件头说明职责，遵循仓库 Prettier/ESLint 风格。

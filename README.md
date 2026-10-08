# JX3 skill parser

在 Node.js 中执行剑三技能 Lua，提取技能属性、检查条件与子技能引用。
运行时支持 Node 20+；开发与 CI 使用 Node 24.15+、npm 12.2.0。

## 包入口与类型

包提供 CommonJS、ESM 和各自的声明文件。Lua 引导、mock 与属性桥接脚本位于
`dist/lua`，已包含在 npm 包中；运行时不需要邻仓库或额外复制这些文件。

```ts
import {
    SkillParser,
    type CreateOptions,
    type SkillParseOptions,
    type SkillResult,
} from '@jx3box/jx3-skill-parser';
```

`SkillResult` 对已实现的属性、Buff 检查、冷却和子技能记录提供类型。游戏脚本任意
写入的额外字段为 `unknown`，读取时需自行收窄。部分复杂参数仍可能是 Lua 表代理，
需要在关闭 VM 前读取或调用 `$detach`。默认行为不改为全量复制结果。

## 按需异步 Include

```js
import { SkillParser } from '@jx3box/jx3-skill-parser';

const parser = await SkillParser.create({
    include: async (name) => readSnapshotFile(name), // Buffer | undefined
});
try {
    const skill = await parser.parse(scriptBuffer, { id: 123, level: 1 });
} finally {
    parser.lua.global.close();
}
```

`include` 同时接受同步 Buffer 和 Promise。文件名先按 GBK 解码，再统一斜线、
规范相对路径并转小写。只有执行到 Include 时才请求文件，等待时保留 Lua 执行栈，
动态路径、嵌套 Include 和解析环境中的 `pcall` / `xpcall` 都可以继续执行。
拒绝的 Promise 会在 Lua 中抛错，允许脚本捕获；宿主若要求下载失败必须中止构建，
应另外保留该失败状态并在 parse 后检查。

缓存仍按 `cache` 控制：默认公共 Include 的结果保存在环境模板，`false` 禁用；
一次 parse 结束或失败后卸载挂载文件。串行调用同一个 parser，并在关闭 VM 前等待
parse 完成。不支持在其他 Lua 5.1 原生 C 回调（例如排序比较函数）中异步 Include。

配置与解析选项不会被修改；复用 `level: 0` 选项时，每个技能独立计算最大等级。

## 构建与发布

```sh
npm ci
npm run lint:nofix
npm run typecheck
npm run build
npm test
npm run test:package
```

构建使用 tsdown。`test:package` 将真实 tarball 安装到独立临时目录，验证 CJS/ESM
入口、Lua 文件、嵌套异步 Include 与纯 Node 的严格 TypeScript 编译；不使用
`skipLibCheck`、DOM 类型库或邻仓库源码补全声明。

`.github/workflows/publish.yml` 验证针对 master 的 PR；只有 master 的 push 在全部
检查通过后执行 `npm publish --provenance --access public`。使用 npm Trusted
Publisher 的 GitHub OIDC，不需要 NPM_TOKEN。npm 侧配置应对应
`JX3BOX/jx3-skill-parser` 和 `publish.yml`，并允许直接 publish。
已移除分支与工具版本过时的独立 test.yml，测试统一在此流程中执行。

依赖的 wasmoon 必须同时支持异步绑定和纯 Node 类型声明。正式依赖及锁文件只使用
已发布版本；不要把本机绝对路径或未发布版本写入正式依赖。

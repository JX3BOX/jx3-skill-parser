// 生成 Node.js 的 CommonJS、ESM 与完整声明，并保留运行时需要的 Lua 脚本。
import { defineConfig } from 'tsdown';

export default defineConfig({
    entry: ['src/index.ts'],
    format: ['esm', 'cjs'],
    platform: 'node',
    target: 'node20',
    dts: true,
    shims: true,
    copy: [{ from: 'src/lua/*.lua', to: 'dist/lua' }],
    outExtensions: ({ format }) => ({
        js: format === 'es' ? '.mjs' : '.js',
        dts: format === 'es' ? '.d.mts' : '.d.ts',
    }),
});

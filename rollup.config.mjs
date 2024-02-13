import typescript from '@rollup/plugin-typescript';
import json from '@rollup/plugin-json';
import copy from 'rollup-plugin-copy';
import dts from 'rollup-plugin-dts';

const production = !process.env.ROLLUP_WATCH;

export default [
    {
        input: './src/index.ts',
        external: ['lodash'],
        output: {
            file: 'dist/index.js',
            format: 'umd',
            name: 'jx3-skill-parser',
            sourcemap: true,
            globals: {
                lodash: 'lodash',
            },
        },
        plugins: [
            typescript({
                tsconfig: './tsconfig.json',
                sourceMap: true,
                declaration: false,
            }),
            json(),
            copy({
                targets: [{ src: 'src/lua', dest: 'dist' }],
            }),
        ],
    },
    {
        input: './src/index.ts',
        output: { file: 'dist/index.d.ts', format: 'es' },
        plugins: [dts()],
    },
];

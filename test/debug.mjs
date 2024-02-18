import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';
import { readFileSync } from 'fs';

const parser = await SkillParser.create();


const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/装备/挂件相关/背挂_寄琼苏_主动技能.lua',
);

console.log(
    await parser.parse(content, {
        id: 26473,
        level: 1,
    }),
);

import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/装备/输出通用附魔减疗加伤害.lua',
);

console.log(await parser.parse(content, { level: 11 }));

import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';
import { readFileSync } from 'fs';

const parser = await SkillParser.create();

const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/npc助战降临/贺闲/贺闲小技能剑羽伤害子技能.lua',
);

console.log(
    await parser.parse(content, {
        id: 36221,
        level: 1,
    }),
);

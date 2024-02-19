import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';
import { readFileSync } from 'fs';

const parser = await SkillParser.create({
    include(name) {
        return readFileSync(`/d/games/SeasunGame_unpack/std/${name.replace(/\\/g, '/')}`);
    },
});

const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/npc助战降临/贺闲/贺闲小技能剑羽伤害子技能.lua',
);

for (let i = 0; i < 40; i++) {
    console.log(i);
    const result = await parser.parse(content);
}

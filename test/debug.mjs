import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';
import { readFileSync } from 'fs';

const parser = await SkillParser.create({
    include(name) {
        try {
            const buffer = readFileSync(
                `/d/games/SeasunGame_unpack/std/${name.replace(/\\/g, '/')}`,
            );
            return buffer;
        } catch (e) {
            return null;
        }
    },
});

const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/npc助战降临/贺闲/贺闲小技能剑羽伤害子技能.lua',
);

for (let i = 0; i < 20; i++) {
    const result = await parser.parse(content, {
        id: 36221,
        level: 1,
    });
    console.log(result);
    console.log(i);
}

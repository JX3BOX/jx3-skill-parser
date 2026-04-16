import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';
import { readFileSync } from 'fs';

const parser = await SkillParser.create({
    include(name) {
        try {
            return readFileSync(
                `/Users/x3zvawq/workspace/jx3box/jx3-raw/unpack/origin/${name.replace(/\\/g, '/')}`,
            );
        } catch {
            console.log('not found', name);
        }
    },
});
// const content = await fs.readFile(
//     '/d/games/SeasunGame_unpack/std/scripts/skill/长歌/套路及子技能/新相依雾散伤害子技能.lua',
// );
const content = await fs.readFile(
    '/Users/x3zvawq/workspace/jx3box/jx3-raw/unpack/origin/scripts/skill/长歌/镇派/宫增加吟唱时间.lua',
);

console.log(await parser.parse(content));

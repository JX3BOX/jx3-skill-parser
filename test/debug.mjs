import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';
import { readFileSync } from 'fs';

const parser = await SkillParser.create({
    include(name) {
        try {
            return readFileSync(`/d/games/SeasunGame_unpack/std/${name.replace(/\\/g, '/')}`);
        } catch {
            console.log('not found', name);
        }
    },
});
// const content = await fs.readFile(
//     '/d/games/SeasunGame_unpack/std/scripts/skill/长歌/套路及子技能/新相依雾散伤害子技能.lua',
// );
const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/七秀/猿公剑法_剑斩风流.lua',
);

console.log(
    await parser.parse(content),
);
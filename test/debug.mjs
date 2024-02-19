import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';
import { readFileSync } from 'fs';

const parser = await SkillParser.create({
    include(name) {
        try {
            return readFileSync(`/d/games/SeasunGame_unpack/std/${name.replace(/\\/g, '/')}`);
        } catch {
            return;
        }
    },
});

const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/七秀/剑器浑脱_心鼓弦.lua',
);

for (let i = 0; i < 40; i++) {
    console.log(i);
    const result = await parser.parse(content);
}

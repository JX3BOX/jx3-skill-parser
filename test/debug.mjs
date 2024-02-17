import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/npc/副本BOSS/恶人谷/陶寒亭_殁蝶刀·星沉.lua',
);

console.log(await parser.parse(content));

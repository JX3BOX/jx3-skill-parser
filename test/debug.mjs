import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/经脉/基础系/基础系_子技能_传送增强.lua',
);

console.log(await parser.parse(content));

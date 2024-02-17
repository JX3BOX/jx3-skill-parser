import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile('/d/games/SeasunGame_unpack/std/scripts/skill/万花/万花_点穴截脉_商阳指.lua');

console.log(await parser.parse(content));

import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile(
    '/d/games/SeasunGame_unpack/std/scripts/skill/明教/明教_暗尘弥散.lua',
);

console.log(await parser.parse(content));

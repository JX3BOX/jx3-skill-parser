import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile('./test/jianpo.lua');

console.log(await parser.parse(content));

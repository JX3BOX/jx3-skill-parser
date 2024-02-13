import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile('test/jianpo.lua');

const skill = await parser.parse(content, { skill_name: '猿公剑法_剑斩风流' });

import { SkillParser } from '../dist/index.js';
import fs from 'fs/promises';

const parser = await SkillParser.create();
const content = await fs.readFile('test/kuaixue.lua');

for (let i of Array.from({ length: 500 }, (_, i) => i)) {
    console.log(i)
    await parser.parse(content);
}

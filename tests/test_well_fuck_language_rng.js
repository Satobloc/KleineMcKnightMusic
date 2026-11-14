'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');

const htmlPath = process.argv[2] || 'SIMULATION_WORKDESKS/WELL_FUCK/builds/Well_Fuck_Cities_Lab_2_12.html';
const html = fs.readFileSync(htmlPath, 'utf8');
const scriptMatch = html.match(/<script\b[^>]*>([\s\S]*?)<\/script\s*>/i);
assert.ok(scriptMatch, 'simulation HTML must contain an inline script');
const script = scriptMatch[1];
const startMarker = '/* LANGUAGE_KERNEL_START */';
const endMarker = '/* LANGUAGE_KERNEL_END */';
const start = script.indexOf(startMarker);
const end = script.indexOf(endMarker, start + startMarker.length);
assert.ok(start >= 0 && end > start, 'language-kernel boundary markers must exist');
const kernel = script.slice(start + startMarker.length, end);
assert.doesNotMatch(kernel, /(?<![A-Za-z0-9_$])random\s*\(/,
  'language kernel must not draw from the physical/city random() stream');

const harness = [
  "function renderLanguagePanel() {}",
  "function trial(seed, hearAt = 0) {",
  "  turn = 0; rng = 0x12345678; buildings = []; communities = [];",
  "  communitySerial = 0; selectedCommunityId = null; languageLexemeSerial = 0;",
  "  seedLanguageRng(seed); seedUiRng(seed);",
  "  const c = createSpeechCommunity(null);",
  "  buildings.push({alive:true, communityId:c.id});",
  "  for (let t=1; t<=1200; t++) { turn = t; if (t === hearAt) overhearCommunity(c.id); advanceLanguages(); }",
  "  return {phrase:phraseSurface(c),ipa:phraseIPA(c),gloss:phraseGloss(c),",
  "    lexemeCount:Object.keys(c.lexicon).length,soundChanges:c.soundChanges.map(x=>x.id),",
  "    historyLength:c.history.length,sampleContexts:c.samples.map(x=>x.context),",
  "    languageRng,uiRng,cityRng:rng};",
  "}",
  "const baseline=trial(12345,0),repeated=trial(12345,0),observed=trial(12345,100),",
  "  observedRepeated=trial(12345,100),otherSeed=trial(12346,0);",
  "JSON.stringify({baseline,repeated,observed,observedRepeated,otherSeed});"
].join('\n');
const result = JSON.parse(vm.runInNewContext(kernel + '\n' + harness,
  {turn:0,rng:0x12345678}, {timeout:10000}));

assert.deepEqual(result.baseline, result.repeated,
  'same seed and same action sequence must reproduce the same language state');
assert.equal(result.baseline.phrase, result.observed.phrase,
  'UI observation must not change the simulated phrase');
assert.equal(result.baseline.ipa, result.observed.ipa,
  'UI observation must not change the simulated IPA');
assert.equal(result.baseline.languageRng, result.observed.languageRng,
  'UI observation must not consume the language simulation RNG');
assert.notEqual(result.baseline.uiRng, result.observed.uiRng,
  'UI observation should consume only the presentation RNG');
assert.deepEqual(result.observed, result.observedRepeated,
  'same seed and same UI interaction must reproduce the same sample');
assert.notDeepEqual(result.baseline.phrase, result.otherSeed.phrase,
  'a different language seed should be capable of producing a different trajectory');
assert.equal(result.baseline.cityRng, 0x12345678,
  'language evolution must leave the physical/city RNG unchanged');
assert.equal(result.observed.cityRng, 0x12345678,
  'UI observation must leave the physical/city RNG unchanged');
assert.equal(result.observed.sampleContexts.length, 1,
  'Overhear locals must still add an observational sample');

console.log('PASS: language RNG determinism, UI-stream isolation, sample reproducibility, and physical RNG non-interference');
console.log(JSON.stringify({
  phrase:result.baseline.phrase,
  ipa:result.baseline.ipa,
  sampleContext:result.observed.sampleContexts[0],
  languageRng:result.baseline.languageRng,
  uiRngAfterSample:result.observed.uiRng
}, null, 2));

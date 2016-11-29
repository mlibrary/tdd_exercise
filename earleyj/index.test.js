import { tallyScores } from './index'

test('tally scores', () => {
  const input = 'Heather: +4\nChen: +10\nHelga: +22\nHeather: -7\nChen: +2\nBalthazar: -1'
  const output = 'Balthazar: -1\nChen: +12\nHeather: -3\nHelga: +22'

  expect(tallyScores(input)).toBe(output);
});

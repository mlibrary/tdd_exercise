import { _ } from 'underscore'

export const tallyScores = (input) => {
	const split = input.split("\n");

  const deserialized = _.reduce(split, (list, tally) => {
  	if (tally != undefined) {
      const name  = tally.split(': ')[0]
      const score = tally.split(': ')[1]

      list.push({
        name: name,
        score: score
      })
    }

		return list
  }, [])

  const tally_totals = _.reduce(deserialized, (final_list, tally) => {
    // if name is not in output tally list
    // else if already in list, do some calc
    if(_.where(final_list, { name: tally.name }).length == 0) {
			final_list.push({
      	name: tally.name,
        tally: tally.score
      })
    } else {
    	const final_tally = _.findWhere(final_list, { name: tally.name })

      final_tally.tally = Number(tally.score) + Number(final_tally.tally)
    }

    //sort ascending
  	return _.sortBy(final_list, function(tally) { return tally.name; })
  }, [])

  const serialize = _.reduce(tally_totals, (string, tally, index) => {
  	if (tally.tally > 0) {
    	tally.tally = "+" + Number(tally.tally)
    }

    var new_line = '\n'

    if (tally_totals.length == index +1) {
      new_line = ''
    }

  	string = string + tally.name + ": " + tally.tally + new_line

    return string
  }, '')

  return serialized_to_string
}

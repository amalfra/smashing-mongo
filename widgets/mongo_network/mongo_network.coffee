class Dashing.MongoNetwork extends Dashing.Widget
    @accessor 'network_requests', Dashing.AnimatedValue

    @accessor 'network_in', Dashing.AnimatedValue

    @accessor 'network_out', Dashing.AnimatedValue

    @accessor "suffix", ->
        " MB" 

Batman.mixin Batman.Filters,
    round: (n) ->
        Math.round(n * 100) / 100

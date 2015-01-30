if Meteor.isClient
  Session.set 'showSmall', yes

  Template.index.helpers
    showSmall: ->
      Session.get 'showSmall'

  Template.index.events
    'click #switch': ->
      Session.set 'showSmall', not Session.get 'showSmall'
      console.time 'render'
      console.profile 'render'

  Template.large.helpers
    nums: ->
      [1..5000] 

  Template.small.rendered =
  Template.large.rendered = ->
    console.timeEnd 'render'
    console.profileEnd 'render'

@Record = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.title
      React.DOM.td null, @props.record.started_at
      React.DOM.td null, durationFormat(@props.record.duration)

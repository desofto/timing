@TotalBox = React.createClass
  render: ->
    React.DOM.div
      className: 'col-md-4'
      React.DOM.div
        className: "panel panel-#{ @props.type }"
        React.DOM.div
          className: 'panel-heading'
          @props.text
        React.DOM.div
          className: 'panel-body'
          durationFormat(@props.total)

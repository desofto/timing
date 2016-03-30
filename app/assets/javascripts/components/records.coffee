@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultProps: ->
    records: []
  addRecord: (record) ->
    records = @state.records.slice()
    records.push record
    @setState records: records
  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Records'
      React.DOM.div
        className: 'row'
        React.createElement TotalBox, type: 'success', total: @total(), text: 'Total'
      React.createElement RecordForm, handleNewRecord: @addRecord
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Task'
            React.DOM.th null, 'Started at'
            React.DOM.th null, 'Duration'
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record
  total: ->
    @state.records.reduce ((prev, curr) ->
      prev + curr.duration
    ), 0

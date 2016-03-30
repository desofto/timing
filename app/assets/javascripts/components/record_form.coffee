@RecordForm = React.createClass

  getInitialState: ->
    title: ''
    started_at: ''
    duration: ''

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Started at'
          name: 'started_at'
          value: @state.started_at
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Duration'
          name: 'duration'
          value: @state.duration
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.title && @state.started_at && @state.duration

  dataForPost: ->
    {
      title: @state.title,
      started_at: @state.started_at,
      duration: @state.duration * 60
    }

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @dataForPost() }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'

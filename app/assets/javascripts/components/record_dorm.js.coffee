@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'
  valid: ->
    @state.title && @state.date && @state.amount
  render: ->
    React.DOM.form
      className: 'records__form'
      onSubmit: @handleSubmit
      React.DOM.input
        type: 'text'
        className: 'records__form__input'
        placeholder: 'Date'
        name: 'date'
        value: @state.date
        onChange: @handleChange
      React.DOM.input
        type: 'text'
        className: 'records__form__input'
        placeholder: 'Title'
        name: 'title'
        value: @state.title
        onChange: @handleChange
      React.DOM.input
        type: 'number'
        className: 'records__form__input'
        placeholder: 'Amount'
        name: 'amount'
        value: @state.amount
        onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn records__form__btn'
        disabled: !@valid()
        'Create record'

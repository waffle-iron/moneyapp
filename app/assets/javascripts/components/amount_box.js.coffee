@AmountBox = React.createClass
  render: ->
    React.DOM.div
      className: 'records__info__box'
      React.DOM.div
        className: "records__info records__info--#{ @props.type }"
        React.DOM.div
          className: 'records__info__title'
          @props.text
        React.DOM.div
          className: 'records__info__text'
          amountFormat(@props.amount)

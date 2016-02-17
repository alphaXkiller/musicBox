React = require 'react'
# { Link } = require 'react-router'
{ render } = require 'react-dom'
{ div, button, form, label, input, br} = React.DOM

Login = React.createClass
  getInitialState: ->
    value: null

  handleChange: (e) ->
    @setState value: e.target.value

  render: ->
    value = @state.value
    div null,
      div null,
      'Log in'
      button null,
      'Facebook Login'
      div null,
      'or'
      form null,
        label null, 'Email'
        input
          type: 'text'
          value: value
          onChange: @handleChange
        label null, 'Password'
        input
          type: 'password'
          value: value
        button
          type: 'submit',
          'Submit'

element = React.createElement Login

render element, document.getElementById 'Login'
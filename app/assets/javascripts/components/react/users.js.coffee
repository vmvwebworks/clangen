@userListSection = React.createClass
  getInitialState: ->
    usersList: @props.data
  getDefaultProps: ->
    usersList: []
  render: ->
      React.DOM.div
        className: 'listOfUsers'
        React.DOM.h2
          className: 'title'
          'List of users'
        React.DOM.ul
          className: 'uk-list uk-list-line'
          for singleUser in @state.usersList
            React.DOM.li null, singleUser.username

var React = require('react');
var DefaultLayout = require('./layouts/default');
var style = {
  color: '#c01921',
  fontSize: '200px',
  fontWeight: '900',
};
var HelloMessage = React.createClass({
  render: function() {
    return (
      <DefaultLayout title={this.props.title}>
        <div>Hello {this.props.name}</div>
        <h1 className="title" style={style}>Hello, world!</h1>
      </DefaultLayout>
    );
  }
});

module.exports = HelloMessage;

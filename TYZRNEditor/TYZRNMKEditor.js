/* @flow */
'use strict';

var React = require('react-native');
var PropTypes = require('ReactPropTypes');
var {
	requireNativeComponent,
	DeviceEventEmitter
} = React;
var notice = null;
var TYZRNMKEditor = React.createClass({

	propTypes: {
		defaultMarkdownText: PropTypes.string,
		backEvent: PropTypes.func
	},

	componentWillMount: function() {
		notice = DeviceEventEmitter.addListener(
			'markdownEvent', (info) => {
				console.log('接受到一个事件');
				this.props.backEvent();
			}
		);
	},

	componentWillUnmount: function() {
		notice.remove();
	},
	getInitialState: function() {
		return {
			contentMarkdownText: this.props.defaultMarkdownText
		};
	},
	render: function() {

		TYZRNMKEditor.context = this;

		return (

			< TYZRNMKEditorView {...this.props
			}
			/ >
		);
	}
});

var TYZRNMKEditorView = requireNativeComponent('TYZRNMKEditor', TYZRNMKEditor);
module.exports = TYZRNMKEditor;
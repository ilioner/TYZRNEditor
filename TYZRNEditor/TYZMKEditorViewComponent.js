/* @flow */
'use strict';

var React = require('react-native');

var {
	StyleSheet,
	View,
} = React;

var TYZRNMKEditor = require('./TYZRNMKEditor');

var TYZMKEditorViewComponent = React.createClass({
	_backEvent: function() {
		this.props.navigator.pop();
	},



	render: function() {
		//讲当前类映射为TYZEditorViewComponent.mainContent
		TYZMKEditorViewComponent.mainContent = this;
		return (

			<TYZRNMKEditor style={styles.contentStyle} 
							ref='EditorView' 
							defaultMarkdownText = '##这是一条初始化的测试内容'
							backEvent={this._backEvent}
							/>
		);
	},
});


var styles = StyleSheet.create({
	contentStyle: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
	}
});

module.exports = TYZMKEditorViewComponent;
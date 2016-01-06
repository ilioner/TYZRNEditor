/* @flow */
'use strict';

var React = require('react-native');

var {
	StyleSheet,
	View,
	Text
} = React;

var TYZTopView = React.createClass({
	render: function() {
		return (
			<View style={styles.contentStyle}>
				<Text style={styles.textStyle}>
					这是一个富文本输入框
				</Text>
			</View>
		);
	}
});


var styles = StyleSheet.create({
	contentStyle: {
		flex: 1,
		backgroundColor: '#E3FBB3'
	},
	textStyle: {
		marginTop: 100
	}
});


module.exports = TYZTopView;
var React = require('react-native');
var PropTypes = require('ReactPropTypes');
var {
	requireNativeComponent,
	DeviceEventEmitter
} = React;

var TYZRNEditorViewManager = React.NativeModules.TYZRNEditorViewManager;
var subscription = null;
var backEventScript = null;

var TYZRNEditorView = React.createClass({

	propTypes: {
		contentStr: PropTypes.string,
		titleStr: PropTypes.string,
		backAction: PropTypes.func
	},

	componentWillMount: function() {
		subscription = DeviceEventEmitter.addListener(
			'event', (info) => {
				console.log('接受到一个事件');
				alert('接收到一个事件' + info);
			}
		);

		backEventScript = DeviceEventEmitter.addListener(
			'backEvent', (info) => {
				console.log('接受到一个返回事件');
				this.props.backAction();
			}
		);
	},

	componentWillUnmount: function() {
		subscription.remove();
		backEventScript.remove();
	},

	getInitialState: function() {
		return {
			contentStr: this.props.contentStr,
			titleStr: this.props.string
		};
	},

	render: function() {
		TYZRNEditorView.context = this;
		return ( < RCTMyEditorView {...this.props
			}
			/>
		);
	},

	//获取编辑器内容
	getContentString: function() {
		TYZRNEditorViewManager.getContentStrMethod((error, events) => {
			debugger;
			if (error) {
				console.error(error);
				return null;
			} else {
				console.log(events);
				this.setState({
					contentStr: events
				});
				return events;
			}
		});
	},
	//获取编辑器内容题目
	getTitleString: function() {
		TYZRNEditorViewManager.getTitleStrMethod((error, events) => {
			debugger;
			if (error) {
				console.error(error);
				return null;
			} else {
				console.log(events);
				this.setState({
					titleStr: events
				});
				return events;
			}
		});
	}
});


var RCTMyEditorView = requireNativeComponent('TYZRNEditorView', TYZRNEditorView);

module.exports = TYZRNEditorView;
var React = require('react-native');
var {
	requireNativeComponent
} = React;


class TYZRNEditorView extends React.Component {
	render() {
		return ( < RCTMyEditorView {...this.props
			}
			/>
		);
	}
}


TYZRNEditorView.propTypes = {
	isEditing: React.PropTypes.bool,
};


// requireNativeComponent 自动把这个组件提供给 "TYZRNEditorViewManager"

var RCTMyEditorView = requireNativeComponent('TYZRNEditorView', TYZRNEditorView);

module.exports = TYZRNEditorView;
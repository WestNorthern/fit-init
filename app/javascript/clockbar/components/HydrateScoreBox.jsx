import React from "react"
import HydrateScoreNode from './HydrateScoreNode'

class HydrateScoreBox extends React.Component {
	constructor(props) {
    super(props);
  }
  render() {
      return(
      	<div className="row">
          <div className="grid-x">
          { this.props.hydrateScoreArray.map( (node, index) => <HydrateScoreNode key={index} node={node} /> ) }
          </div>
        </div>
      );
      
  }
}

export default HydrateScoreBox
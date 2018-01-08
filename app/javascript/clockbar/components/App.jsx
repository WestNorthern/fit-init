import React from "react"
import Hour from "./Hour"
import WorkoutButton from "./WorkoutButton"
import HydrateButton from "./HydrateButton"
import DailyScoreBox from "./DailyScoreBox"
import HydrateScoreBox from "./HydrateScoreBox"

class App extends React.Component {
	constructor(props) {
    super(props);
    var date= this.getTimeString();
    var pastThree= this.getLastThree();
    var nextThree= this.getNextThree();
    this.state= {
      time: date,
      pastThreeHours: pastThree,
      nextThreeHours: nextThree
    }
  }

  getLastThree() {
  	var lastThreeArr = [];
  	const currentTime = new Date(Date.now()).getHours();

  	var x = 3;
  	while (x > 0) {
  		lastThreeArr.push(currentTime - x);
  		x--;
  	};
  	return lastThreeArr.map( x => {
  		if (x == 0){
  			return '12 AM';
  		}
  		else if (x == 12){
  			return '12 PM';
  		}
  		else if (x > 12){
  			x = x % 12;
  			return x + ' PM'
  		}
  		else{
  			return x + ' AM'
  		}
  	});
  }

  getNextThree() {
  	var nextThreeArr = [];
  	const currentTime = new Date(Date.now()).getHours();

  	var x = 0;
  	while (x < 3) {
  		nextThreeArr.push(currentTime + 1 + x);
  		x++;
  	};
  	
  	return nextThreeArr.map( x => {
  		if (x == 0){
  			return '12 AM';
  		}
  		else if (x == 12){
  			return '12 PM';
  		}
  		else if (x > 12){
  			x = x % 12;
  			return x + ' PM'
  		}
  		else{
  			return x + ' AM'
  		}
  	});
  }

  getTimeString() {
    const date = new Date(Date.now()).toLocaleTimeString();
    return date;
  }

  componentDidMount() {
    const _this = this;
    this.timer = setInterval(function(){
      var date = _this.getTimeString();
      var pastThree= _this.getLastThree();
    	var nextThree= _this.getNextThree();
      _this.setState({
        time: date,
        pastThreeHours: pastThree,
      	nextThreeHours: nextThree
      })
    },1000)
  }

  componentWillUnmount() {
      clearInterval(this.timer);
  }

  render() {
    
    return(
      <div className="app-wrapper">
      	<div className="clockbar-wrapper">
      		<div className="grid-x">
  	    		<div className="hours-wrapper small-5 columns grid-x"> { this.state.pastThreeHours.map( (hour, index) => <Hour hour={hour} key={hour} hourCheck={this.props.hourArray[index]} /> ) } </div>

  	      	<div className="current-time small-2 columns">{this.state.time}</div>

  	      	<div className="hours-wrapper small-5 columns grid-x"> {this.state.nextThreeHours.map( hour => <Hour hour={hour} key={hour} /> ) } </div>
        	</div>
        	<br/>

        	<div className="text-center">
            <WorkoutButton wav={this.props.wav} />
            &nbsp;
        		<HydrateButton hydrated={this.props.hydrated} />
        	</div>
        </div>
        <DailyScoreBox dayScoreArray={this.props.dayScoreArray} />
        <HydrateScoreBox hydrateScoreArray={this.props.hydrateScoreArray} />
      </div>
    );
  }
}

export default App



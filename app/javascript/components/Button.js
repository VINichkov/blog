import { h, render, Component } from 'preact';

class Button extends Component {
    state = { value: [] };

    onAdd=e=> {

        let arr = this.state.value;
        arr.push(e.target.value);
        this.setState({value: arr});
    }

    render(_, { value })  {
        let ps = value.map( (n)=> {return  <p>{n}</p>});
        console.log("Pfikb");
        return <div>
            <h1>Hello, world!</h1>
            <input onInput={this.onAdd}/>
            {ps}
        </div>;
    }
}

export default Button
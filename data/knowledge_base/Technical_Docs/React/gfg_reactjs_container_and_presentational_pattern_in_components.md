# ReactJS Container and Presentational Pattern in Components

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-container-and-presentational-pattern-in-components/

In this article we will categorise the react components in two types depending on the pattern in which they are written in application and will learn briefly about these two categories. We will also discuss about alternatives to this pattern.
Presentational and Container Components
The type of components is decided by components pattern. If the component decides how the data will be presented on the screen it is called as presentational component. If the component focuses on what data is to be shown to the user then it is called as container component
We will discuss individually about these components in this article.
Presentational components:
- Mainly concerned with how things look.
- Have no major dependencies on the rest of the app.
- No connection with the specification of the data that is outside the component.
- Mainly receives data and callbacks exclusively via props.
- May contain both presentational and container components inside it considering the fact that it contains DOM markup and styles of their own.
Example: For example, the below code denotes a presentational component, and it gets its data from the props and just focuses on showing an element.
// presentational component
const Users = props =>
(<ul>
    {props.users.map(user =>
        (<li>{itr}</li>))
    }
</ul>)
Container components:
- Mainly concerned with how things work.
- May contain both presentational and container components but does not have DOM and markup of their own.
- Provide the data and behavior to presentational or other container components.
- Call flux actions and provides these as callbacks to the presentational component.
// container component
class UsersContainer extends React.Component{
    constructor()
    {
        this.state = {
            itr: []
        }
    }
    componentDidMount() {
        axios.get('/users').then(itr => this.setState({ users: itr }))
        )
    }
    render() {
        return <Usersusers = {this.state.itr} />
}}
Benefits of Container/Presentational Pattern
- Creates pure functions
- Separates render and fetching logic
- Makes the components more reusable
- Testing the components is easier
Disadvantages of Container/Presentational Pattern
- It's alternatives perform better
- Usage is decreased as we no longer need class components to create states.
Alternative to Presentational/Container Pattern
This pattern based approach can be easily replaced with using hooks in React. Instead, of creating different components based on the pattern we can create a single component which uses hooks to implement different functionality. Since the introduction of hooks in React the use of this pattern is reduced but it is still used in some cases as performing tests is easier in this pattern approach.

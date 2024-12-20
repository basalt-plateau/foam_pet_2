


/*
import React from 'react';
import ErrorBoundary from '@/gems/ErrorBoundary';

function App() {
	return (
		<ErrorBoundary>
			<SomeComponent />
		</ErrorBoundary>
	);
}

export default App;
*/



import React, { Component } from 'react';

class ErrorBoundary extends Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false, errorInfo: null };
    }

    // This method is called when an error is thrown in a child component
    static getDerivedStateFromError(error) {
        // Update state to indicate an error has occurred
        return { hasError: true };
    }

    // This method logs error details
    componentDidCatch(error, errorInfo) {
        // You can log the error to an external service here (e.g., Sentry)
        console.error("Error caught by Error Boundary:", error, errorInfo);
    }

    render() {
        if (this.state.hasError) {
            // Fallback UI when an error is caught
            return <h1>Something went wrong. Please try again later.</h1>;
        }

		
		 // Render the children if no error
        return this.props.children;
    }
}

export default ErrorBoundary;

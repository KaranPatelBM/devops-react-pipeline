import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)
  const [log, setLog] = useState([])

  const handleCapture = () => {
    setLog([...log, count])
  }

  const handleReset = () => {
    setCount(0)
    setLog([])
  }

  return (
    <div className="container">
      <h1>React Counter App</h1>
      <p>This is a simple counter app built with React + Vite.</p>

      <div className="card">
        <p className="count-display">Count: {count}</p>
        <div className="button-group">
          <button onClick={() => setCount(count + 1)}>Increment</button>
          <button onClick={handleCapture}>Capture</button>
          <button onClick={handleReset} className="reset-btn">Reset</button>
        </div>
      </div>

      {log.length > 0 && (
        <div className="log-section">
          <h3>Captured Counts:</h3>
          <ul>
            {log.map((value, index) => (
              <li key={index}>#{index + 1}: {value}</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  )
}

export default App

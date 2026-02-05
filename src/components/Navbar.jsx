import '../styles/Navbar.css'

function Navbar() {
  const navItems = [
    { label: 'About', id: 'about' },
    { label: 'Work', id: 'work' },
    { label: 'Contact', id: 'contact' }
  ]

  return (
    <nav className="navbar">
      <div className="nav-container">
        <div className="nav-logo">
          <span className="logo-symbol">▲</span>
          <span className="logo-text">Portfolio</span>
        </div>
        
        <ul className="nav-menu">
          {navItems.map((item, index) => (
            <li key={index} className="nav-item">
              <a href={`#${item.id}`} className="nav-link">{item.label}</a>
            </li>
          ))}
        </ul>

        <div className="nav-snippets">
          <span className="snippet">Code • Design • Create</span>
        </div>
      </div>
    </nav>
  )
}

export default Navbar

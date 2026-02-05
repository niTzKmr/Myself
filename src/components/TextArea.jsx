import '../styles/TextArea.css'
import { FaInstagram, FaLinkedin, FaEnvelope } from "react-icons/fa";


function TextArea() {
  const links = [
  {
    label: "Instagram",
    url: "https://www.instagram.com/n1tisss/",
    icon: <FaInstagram />
  },
  {
    label: "LinkedIn",
    url: "https://www.linkedin.com/in/nitish-kumar-686440351",
    icon: <FaLinkedin />
  },
  {
    label: "Email",
    url: "mailto:Nitishkr7970@gmail.com",
    icon: <FaEnvelope />
  }
];


  return (
    <div className="text-area">
      <p className="hello">Hello, Meet</p>
      <h1>Nitish Kumar <span>a.k.a Nits</span></h1>
      <p className="desc">
        I am a last year BCA student in <span className="highlight">Amity University Jharkhand</span> with a strong passion for Software Development and Video Editing. My focus lies in <span className="highlight">Minimal Graphic motion editing, UI design</span>, and a deep enthusiasm for website and game development. Skilled in designing logos, engaging websites. My strengths include quick learning and adaptability across various creative and technical tools.
      </p>
      <div className="links">
        {links.map((link, index) => (
          <a key={index} href={link.url} title={link.label} className="social-link">
            <span className="icon">{link.icon}</span>
            <span className="label">{link.label}</span>
          </a>
        ))}
      </div>
    </div>
  )
}

export default TextArea

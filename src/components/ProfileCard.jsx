import '../styles/ProfileCard.css'

function ProfileCard() {
  return (
    <div className="card-deck-container">
      <div className="card-deck-scale">
        <div className="deck-card deck-card-1"></div>
        <div className="deck-card deck-card-2"></div>

        <div className="profile-card">
          <div className="card-header">
            <span className="card-number">1</span>
            <span className="card-date">20-12-2004</span>
            <span className="card-age">21</span>
          </div>
          <div className="card-image-wrapper">
            <img src="Profile.jpg" alt="Nitish Kumar" />
          </div>
          <div className="card-footer">
            <span className="card-tag">Video Editor-Software_Dev-UI-</span>
            <span className="card-name">Nits</span>
          </div>
        </div>
      </div>
    </div>
  )
}

export default ProfileCard

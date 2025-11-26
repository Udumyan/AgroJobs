import './App.css'
import { useState, useEffect } from "react";

export default function App() {
  const [jobs, setJobs] = useState([]);
  const [showForm, setShowForm] = useState(false);
  const [formData, setFormData] = useState({
    name: "",
    region: "",
    type: "",
    pay: "",
    contact: "",
  });

  // Load jobs from localStorage
  useEffect(() => {
    const savedJobs = JSON.parse(localStorage.getItem("jobs")) || [];
    setJobs(savedJobs);
  }, []);

  // Save jobs to localStorage
  useEffect(() => {
    localStorage.setItem("jobs", JSON.stringify(jobs));
  }, [jobs]);

  const handleInputChange = (e) => {
    setFormData((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const newJob = { id: Date.now(), ...formData };
    setJobs((prev) => [newJob, ...prev]);
    setFormData({ name: "", region: "", type: "", pay: "", contact: "" });
    setShowForm(false);
  };

  const handleDelete = (id) => {
    setJobs((prev) => prev.filter((job) => job.id !== id));
  };

  const handleCopy = (text) => {
    navigator.clipboard.writeText(text);
    alert("Copied to clipboard!");
  };

  return (
    <div className="App">
      <header className="site-header">
        <div className="container">
          <h1>AgroJobs</h1>
          <p className="tag">Գյուղատնտեսական աշխատանքներ — պարզ, արագ, տեղական</p>
        </div>
      </header>

      <main className="container">
        <section className="hero">
          <h2>Գտիր աշխատանք կամ աշխատող մի քանի րոպեում</h2>
          <p>Ավելացրու հայտարարություն կամ փնտրիր մոտակա ֆերմերների առաջարկները։</p>
          <div className="cta">
            <button className="btn primary" onClick={() => setShowForm(!showForm)}>
              Ավելացնել հայտարարություն
            </button>
          </div>
        </section>

        {showForm && (
          <section id="formSection" className="card">
            <h3>Ավելացնել հայտարարություն</h3>
            <form id="jobForm" onSubmit={handleSubmit}>
              <label>
                Անուն
                <input
                  type="text"
                  name="name"
                  required
                  placeholder="Ձեր անունը կամ ընկերության անունը"
                  value={formData.name}
                  onChange={handleInputChange}
                />
              </label>
              <label>
                Տարածք (օր․՝ Տավուշ)
                <input
                  type="text"
                  name="region"
                  required
                  placeholder="Մարզ"
                  value={formData.region}
                  onChange={handleInputChange}
                />
              </label>
              <label>
                Աշխատանքի տեսակը
                <input
                  type="text"
                  name="type"
                  required
                  placeholder="օր․ տրակտորիստ, հավաքարար"
                  value={formData.type}
                  onChange={handleInputChange}
                />
              </label>
              <label>
                Վարձատրություն
                <input
                  type="text"
                  name="pay"
                  placeholder="օր․ օրական 5000 AMD"
                  value={formData.pay}
                  onChange={handleInputChange}
                />
              </label>
              <label>
                Համար կապի (հեռ., telegram)
                <input
                  type="text"
                  name="contact"
                  placeholder="Բջջ. կամ Telegram"
                  value={formData.contact}
                  onChange={handleInputChange}
                />
              </label>
              <button className="btn primary" type="submit">
                Ավելացնել
              </button>
            </form>
          </section>
        )}

        <section id="jobsSection" className="card">
          <h3>Հայտարարություններ</h3>
          {jobs.length === 0 ? (
            <p className="muted">Ահա դեռ չկան հայտարարություններ — ավելացրեք առաջինը։</p>
          ) : (
            <ul className="jobs-list">
              {jobs.map((job) => (
                <li key={job.id} className="job card-small">
                  <div className="job-main">
                    <strong className="job-name">{job.name}</strong>
                    <span className="job-region">{job.region}</span>
                    <div className="job-type">{job.type}</div>
                  </div>
                  <div className="job-meta">
                    <span className="job-pay">{job.pay}</span>
                    <button
                      className="btn small copyBtn"
                      onClick={() => handleCopy(`${job.name} - ${job.contact}`)}
                    >
                      Copy
                    </button>
                    <button
                      className="btn small deleteBtn"
                      onClick={() => handleDelete(job.id)}
                    >
                      Delete
                    </button>
                  </div>
                </li>
              ))}
            </ul>
          )}
        </section>

        <section className="how card">
          <h3>Ինչպես է աշխատում</h3>
          <ol>
            <li>Ստեղծիր հայտարարություն</li>
            <li>Կիսվիր այն Facebook–ում կամ Telegram–ում</li>
            <li>Կապվիր թեկնածուների հետ անմիջապես</li>
          </ol>
        </section>
      </main>

      <footer className="site-footer">
        <div className="container">
          <p>© 2025 AgroJobs — ցուցադրական նախագիծ</p>
        </div>
      </footer>
    </div>
  );
}



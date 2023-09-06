class user extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: "open" });
  }

  static get styles() {
    return /* css */ `
     :host {
        display: block;
     }

     h2{
        color: #223;
     }
     .user__api{
      display: flex;
      align-items: center;
      column-gap: 1rem;
     }
     img.user__image {
      width: 48px;
      height: 48px;
      object-fit: cover;
     }
   `;
  }

  connectedCallback() {
    this.render();
  }

  render() {
    this.shadowRoot.innerHTML = /* html */ `
      <style>${user.styles}</style>
      <section class="user__api">
         <img class="user__image"  src="https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png" alt="User image" />
         <h2>User Com</h2>
      </section>
    `;
  }

  disconnectedCallback() {
    this.shadowRoot.innerHTML = /* html */ "";
  }

  attributeChangedCallback(attr, old, now) {}

  static get observedAttributes() {
    return [""];
  }
}

window.customElements.define("user-api", user);

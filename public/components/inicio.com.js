export default class Inicio extends HTMLElement {


    constructor() {
      super();
      this.attachShadow({mode: 'open'})
   }
   
    static get styles() {
      return /* css */ `
        :host {
           display: block;
        }
        .inicio{
           height: 100vh;
        }
        h2{
           color: snow;
           text-align: center;
        }
      `;
   }
   
    connectedCallback() {
       this.render();
   }
   
    render() {
   
       this.shadowRoot.innerHTML = /* html */ `
         <style>${Inicio.styles}</style>
         <section class="inicio">
           <h2>${this.hasAttribute("text") ? this.getAttribute('text') : ''}</h2>
         </section>
         
       `;
   
    }
   
   
    disconnectedCallback() {
       this.shadowRoot.innerHTML = /* html */ "";
    }
   
    attributeChangedCallback(attr,old,now) {}
   
   
    static get observedAttributes() {
       return [''];
    }
   }
   
   window.customElements.define("inicio-app", Inicio);
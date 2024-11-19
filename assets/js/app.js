// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken}
})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

document.addEventListener("DOMContentLoaded", function() {
  // Gráfico de Receitas
  fetch("/api/receitas_mensais")
    .then(response => response.json())
    .then(data => {
      const nomesMeses = [
        "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
        "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
      ];

      data.sort((a, b) => a.mes - b.mes);

      const meses = data.map(item => item.mes);
      const valores = data.map(item => item.total);

      const traceReceitas = {
        x: meses.map(mes => nomesMeses[mes - 1]),
        y: valores,
        type: 'bar',
        marker: {
          color: 'rgba(34, 139, 34, 0.6)', // Cor translúcida verde folha para receitas
          line: {
            color: 'rgba(34, 139, 34, 1)',
            width: 1
          }
        },
        text: valores.map(val => `${(val / 1000).toFixed(1)}k`),
        textposition: 'auto'
      };
      

      const layoutReceitas = {
        title: {
          text: 'Receitas Mensais',
          font: {
            family: 'Arial, sans-serif',
            size: 18,
            color: 'black',
            weight: 'bold' 
          }
        },
        xaxis: {
          title: 'Meses',
          automargin: true
        },
        yaxis: {
          title: 'Valor (R$)',
          tickformat: '~s',
          automargin: true
        },
        margin: {
          t: 40,
          l: 60,
          r: 20,
          b: 80
        }
      };

      Plotly.newPlot('receitasMensaisChart', [traceReceitas], layoutReceitas);
    });

  // Gráfico de Despesas
  fetch("/api/despesas_mensais")
    .then(response => response.json())
    .then(data => {
      const nomesMeses = [
        "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
        "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
      ];

      data.sort((a, b) => a.mes - b.mes);

      const meses = data.map(item => item.mes);
      const valores = data.map(item => item.total);

      const traceDespesas = {
        x: meses.map(mes => nomesMeses[mes - 1]),
        y: valores,
        type: 'bar',
        marker: {
          color: 'rgba(255, 99, 132, 0.6)', 
          line: {
            color: 'rgba(255, 99, 132, 1)',
            width: 1
          }
        },
        text: valores.map(val => `${(val / 1000).toFixed(1)}k`),
        textposition: 'auto'
      };

      const layoutDespesas = {
        title: {
          text: 'Despesas Mensais',
          font: {
            family: 'Arial, sans-serif',
            size: 18,
            color: 'black',
            weight: 'bold' 
          }
        },
        xaxis: {
          title: 'Meses',
          automargin: true
        },
        yaxis: {
          title: 'Valor (R$)',
          tickformat: '~s',
          automargin: true
        },
        margin: {
          t: 40,
          l: 60,
          r: 20,
          b: 80
        }
      };

      Plotly.newPlot('despesasMensaisChart', [traceDespesas], layoutDespesas);
    });
});

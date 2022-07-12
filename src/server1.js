const client = require('prom-client');
const collectDefaultMetrics = client.collectDefaultMetrics;
// Probe every 5th second.
collectDefaultMetrics({ timeout: 5000 });

const Prometheus = require('prom-client')
const MetricsInterval = Prometheus.collectDefaultMetrics()
// const app = ()
// const port = process.env.PORT || 3001

app.get('/metrics', (req, res) => {
	res.set('Content-Type', Prometheus.register.contentType)
	res.end(Prometheus.register.metrics())
})

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AQI Visualization</title>

<style>
:root{
--bg:#0d1117;
--card:#161b22;
--line:#30363d;
--text:#e6edf3;
--muted:#8b949e;
--blue:#58a6ff;
--green:#3fb950;
--yellow:#d29922;
--red:#f85149;
}

*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
font-family:Arial, Helvetica, sans-serif;
background:var(--bg);
color:var(--text);
line-height:1.6;
padding:30px;
}

.container{
max-width:1100px;
margin:auto;
}

.card{
background:var(--card);
border:1px solid var(--line);
padding:25px;
border-radius:14px;
margin-bottom:25px;
}

h1,h2,h3{
margin-bottom:15px;
}

h1{
font-size:42px;
color:white;
}

h2{
font-size:28px;
color:var(--blue);
border-bottom:1px solid var(--line);
padding-bottom:8px;
margin-top:10px;
}

h3{
font-size:22px;
color:white;
margin-top:15px;
}

p{
margin-bottom:14px;
color:var(--text);
}

ul{
padding-left:22px;
margin-bottom:14px;
}

li{
margin-bottom:8px;
}

code{
background:#0b1220;
padding:3px 7px;
border-radius:6px;
}

pre{
background:#0b1220;
padding:18px;
border-radius:10px;
overflow-x:auto;
margin-top:12px;
margin-bottom:15px;
border:1px solid var(--line);
}

table{
width:100%;
border-collapse:collapse;
margin-top:10px;
margin-bottom:20px;
}

th,td{
border:1px solid var(--line);
padding:12px;
text-align:left;
}

th{
background:#1f2937;
color:var(--blue);
}

.good{color:var(--green);font-weight:bold;}
.mod{color:var(--yellow);font-weight:bold;}
.bad{color:var(--red);font-weight:bold;}

.footer{
text-align:center;
margin-top:40px;
color:var(--muted);
}
</style>
</head>

<body>

<div class="container">

<div class="card">
<h1>AQI Visualization 🌍📊</h1>
<p>
Interactive Air Quality Index analytics built with <strong>Processing</strong> and <strong>Python</strong>.
This project transforms raw AQI data into charts, comparisons, and heatmaps.
</p>
</div>

<div class="card">
<h2>📌 Project Overview</h2>
<p>
AQI Visualization helps users compare pollution trends across cities and years using interactive visuals.
</p>

<ul>
<li>Monthly AQI trend tracking</li>
<li>City-to-city comparison</li>
<li>Year-over-year changes</li>
<li>Interactive graph modes</li>
<li>Heatmap analytics</li>
</ul>
</div>

<div class="card">
<h2>⚙️ Tools Required Before Cloning</h2>

<h3>1. Install Git</h3>
<p>Needed to clone the repository.</p>
<pre><code>https://git-scm.com/downloads</code></pre>

<h3>2. Install Python (3.10+ recommended)</h3>
<p>Needed to run the data scripts.</p>
<pre><code>https://www.python.org/downloads/</code></pre>

<h3>3. Install Processing IDE</h3>
<p>Needed to run the interactive AQI visualization sketch.</p>
<pre><code>https://processing.org/download</code></pre>

<h3>4. Install VS Code (Optional)</h3>
<p>Recommended for editing Python / HTML / project files.</p>
<pre><code>https://code.visualstudio.com/</code></pre>

</div>

<div class="card">
<h2>⬇️ How To Clone This Repository</h2>

<h3>Step 1: Open Terminal / Command Prompt</h3>

<h3>Step 2: Run:</h3>
<pre><code>git clone https://github.com/tgade5452-cloud/AQI_Visualization.git</code></pre>

<h3>Step 3: Enter Project Folder</h3>
<pre><code>cd AQI_Visualization</code></pre>

</div>

<div class="card">
<h2>🐍 Install Python Dependencies</h2>

<p>Run this after entering the repo folder:</p>

<pre><code>pip install pandas matplotlib seaborn</code></pre>

<p>If pip fails:</p>

<pre><code>python -m pip install pandas matplotlib seaborn</code></pre>

</div>

<div class="card">
<h2>🚀 Run Python Scripts</h2>

<h3>Clean Data</h3>
<pre><code>python clean_aqi_data.py</code></pre>

<h3>Create Heatmap</h3>
<pre><code>python heatmap_aqi.py</code></pre>

</div>

<div class="card">
<h2>🎮 Run Processing Visualization</h2>

<ol style="padding-left:22px;">
<li>Open Processing IDE</li>
<li>Click File → Open</li>
<li>Select <code>AQIVisualization.pde</code></li>
<li>Press Run ▶</li>
</ol>

</div>

<div class="card">
<h2>⌨️ Controls</h2>

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>

<tr>
<td>B</td>
<td>Bar Graph</td>
</tr>

<tr>
<td>L</td>
<td>Line Graph</td>
</tr>

<tr>
<td>V</td>
<td>Toggle Vertical Lines</td>
</tr>

<tr>
<td>1</td>
<td>Los Angeles Data</td>
</tr>

<tr>
<td>2</td>
<td>New York Data</td>
</tr>
</table>

</div>

<div class="card">
<h2>🌫 AQI Levels</h2>

<table>
<tr>
<th>Range</th>
<th>Status</th>
</tr>

<tr>
<td>0 - 50</td>
<td class="good">Good</td>
</tr>

<tr>
<td>51 - 100</td>
<td class="mod">Moderate</td>
</tr>

<tr>
<td>101+</td>
<td class="bad">Unhealthy</td>
</tr>

</table>
</div>

<div class="card">
<h2>📁 Project Structure</h2>

<pre><code>AQI_Visualization/
│── DATA/
│── AQIVisualization.pde
│── FloatTable.pde
│── Integrator.pde
│── clean_aqi_data.py
│── heatmap_aqi.py
│── aqi_heatmap.png
│── README.md
│── index.html
</code></pre>

</div>

<div class="card">
<h2>🔮 Future Improvements</h2>

<ul>
<li>Live AQI API integration</li>
<li>More cities</li>
<li>Machine learning AQI prediction</li>
<li>Web dashboard version</li>
<li>Mobile version</li>
</ul>

</div>

<div class="footer">
<p>Created by tgade5452-cloud</p>
<p>MIT License</p>
</div>

</div>

</body>
</html>
```

<div align="center">

<h1>AQI Visualization</h1>

<p>
  Interactive Air Quality Index (AQI) visualization project built with
  <strong>Processing</strong> and <strong>Python</strong>.
</p>

<p>
  Explore AQI trends across cities and years using bar charts, line graphs,
  and generated heatmaps.
</p>

</div>

<hr>

<h2>Overview</h2>

<p>
  This project visualizes monthly <strong>Air Quality Index (AQI)</strong> data
  for different cities and years. It combines an interactive
  <strong>Processing</strong> sketch with <strong>Python</strong> scripts for
  data cleaning and heatmap generation.
</p>

<p>The project is designed to help users:</p>

<ul>
  <li>Compare AQI trends across cities</li>
  <li>Analyze yearly and monthly air quality patterns</li>
  <li>Switch between different graph modes interactively</li>
  <li>Generate supporting visual outputs from processed data</li>
</ul>

<hr>

<h2>Features</h2>

<ul>
  <li>Interactive AQI visualization in Processing</li>
  <li>Bar graph and line graph display modes</li>
  <li>City and year comparison</li>
  <li>Hover-based AQI inspection</li>
  <li>Vertical guide line toggle</li>
  <li>Python-based AQI cleaning workflow</li>
  <li>Heatmap generation for quick pattern recognition</li>
</ul>

<hr>

<h2>Tech Stack</h2>

<table>
  <thead>
    <tr>
      <th>Tool</th>
      <th>Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Processing</td>
      <td>Interactive data visualization</td>
    </tr>
    <tr>
      <td>Python</td>
      <td>Data processing and scripting</td>
    </tr>
    <tr>
      <td>pandas</td>
      <td>Data cleaning and transformation</td>
    </tr>
    <tr>
      <td>matplotlib</td>
      <td>Plot generation</td>
    </tr>
    <tr>
      <td>seaborn</td>
      <td>Heatmap visualization</td>
    </tr>
  </tbody>
</table>

<hr>

<h2>Repository Structure</h2>

<pre><code>AQI_Visualization/
│
├── DATA/
├── AQIVisualization.pde
├── FloatTable.pde
├── Integrator.pde
├── clean_aqi_data.py
├── heatmap_aqi.py
├── aqi_heatmap.png
├── AQIVisualizationPresentation.pptx
└── README.md
</code></pre>

<hr>

<h2>Requirements</h2>

<h3>1. Install Processing</h3>

<p>
  Download and install the Processing IDE from the official Processing website.
</p>

<h3>2. Install Python</h3>

<p>
  Make sure Python 3 is installed on your machine.
</p>

<h3>3. Install Required Python Packages</h3>

<pre><code>pip install pandas matplotlib seaborn</code></pre>

<hr>

<h2>How to Clone and Run the Project</h2>

<h3>Step 1: Clone the Repository</h3>

<pre><code>git clone https://github.com/tgade5452-cloud/AQI_Visualization.git
cd AQI_Visualization</code></pre>

<h3>Step 2: Install Python Dependencies</h3>

<pre><code>pip install pandas matplotlib seaborn</code></pre>

<h3>Step 3: Run the Data Cleaning Script</h3>

<pre><code>python clean_aqi_data.py</code></pre>

<p>This script prepares and exports cleaned AQI datasets.</p>

<h3>Step 4: Generate the Heatmap</h3>

<pre><code>python heatmap_aqi.py</code></pre>

<p>This creates the heatmap output image from the processed AQI data.</p>

<h3>Step 5: Open the Processing Sketch</h3>

<p>
  Open <code>AQIVisualization.pde</code> in the Processing IDE and run it.
</p>

<hr>

<h2>Controls</h2>

<table>
  <thead>
    <tr>
      <th>Key</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>b</code></td>
      <td>Switch to bar graph</td>
    </tr>
    <tr>
      <td><code>l</code></td>
      <td>Switch to line graph</td>
    </tr>
    <tr>
      <td><code>v</code></td>
      <td>Toggle vertical guide lines</td>
    </tr>
    <tr>
      <td><code>1</code></td>
      <td>Load Los Angeles dataset</td>
    </tr>
    <tr>
      <td><code>2</code></td>
      <td>Load New York dataset</td>
    </tr>
  </tbody>
</table>

<hr>

<h2>AQI Categories</h2>

<table>
  <thead>
    <tr>
      <th>AQI Range</th>
      <th>Condition</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0 - 50</td>
      <td>Good</td>
    </tr>
    <tr>
      <td>51 - 100</td>
      <td>Moderate</td>
    </tr>
    <tr>
      <td>101+</td>
      <td>Unhealthy</td>
    </tr>
  </tbody>
</table>

<hr>

<h2>Output</h2>

<p>The repository includes a generated heatmap image:</p>

<pre><code>aqi_heatmap.png</code></pre>

<p>
  This output helps compare AQI intensity by city, year, and month.
</p>

<hr>

<h2>Notes</h2>

<ul>
  <li>The Python scripts currently work with sample or prepared AQI datasets.</li>
  <li>The project can be extended with real AQI APIs or official environmental datasets.</li>
  <li>If file paths fail, check whether your folder name is <code>DATA</code> or <code>data</code>.</li>
</ul>

<hr>

<h2>Future Improvements</h2>

<ul>
  <li>Add more cities</li>
  <li>Integrate live AQI APIs</li>
  <li>Add pollutant-specific views such as PM2.5, NO2, and Ozone</li>
  <li>Build a web-based dashboard version</li>
  <li>Add predictive AQI analysis</li>
</ul>

<hr>

<h2>Author</h2>

<p>Created by <strong>tgade5452-cloud</strong></p>

<hr>

<h2>License</h2>

<p>MIT License</p>

<h1>static-sinatra</h1>

<p>A <a href="http://www.sinatrarb.com/">Sinatra</a> application with RakeFile designed
for a static <span class="caps">HTML</span> site</p>

<h2>Quick start</h2>

<ul>
	<li>in the terminal, cd to your clone of this repo and <code>bundle install</code></li>
	<li>then <code>ruby app.rb</code></li>
	<li>in your browser, got to <a href="http://localhost:4567/">http://localhost:4567/</a> and you should be up and running</li>
</ul>

<h2>Developing and editing</h2>

<h3>Application structure</h3>

<p>+ <b>helpers</b> - small handy ruby tools<br />
+ <b>public</b> - images, javascripts, css, flash<br />
+ <b>views</b><br />
+ + <b>layouts</b> - aka default master-pages - wrap around "pages"<br />
+ + <b>pages</b> - this is where all the site content lives<br />
+ + <b>partials</b> - repeated Haml e.g footer<br />
+ + <b>sass</b> - to convert to css<br />
- <b>app.rb</b> - main application file<br />
- <b>Rakefile</b> - contains our "build" and "export" tasks used by&hellip;<br />
- <b>preview.bat</b> - our windows "preview" double-clicker<br />
- <b>build.bat</b> - our windows "build" double-clicker<br />
+ <b>test</b> - theres a rake task and results.html in here that scrapes all the static files for errors<br />
</p>

<h2>Running the application</h2>

<h4>Mac <span class="caps">OSX</span></h4>
<p><code>ruby app.rb</code></p>

<h4>Windows</h4>

<p>Double click the <b>preview.bat</b> file</p>

<p>The browser should now be "previewing" the application - the files don't actually exist
yet.</p>

<p>Now you can see your local modifications at <a href="http://localhost:4567/">http://localhost:4567/</a></p>

<h2>Building the <span class="caps">HTML</span>
templates</h2>

<h3>Mac <span class="caps">OSX</span></h3>
<p><code>rake build</code></p>

<h3>Windows</h3>

<p>Double click the <b>build.bat</b> file in the root directory</p>

<p>This will grab all the generated <span class="caps">HTML</span> code from your local
server,<br />
and write it to the static folder.</p>

<h2>Exporting a stand alone version of the sites</h2>
<ul>
	<li>Build the app (see above)</li>
	<li>Copy the contents of <code>public</code> and the contents of <code>static</code> to your desired location/zip</li>
</ul>

<h2>Testing</h2>

<p>There is a very simple test suite that uses Rspec, in the test directory</p>
<p>Make sure to build the files before running the tests</p>
<p>run <code>rake run_tests</code> <strong>from the test directory</strong></p>

<p>A report will then be generated that you can open manually in your browser
(<code>results.html</code>)</p>

<h2><strong>Modifying the <span class="caps">CSS</span></strong></h2>

<p>The <span class="caps">CSS</span> has been written in a meta-language called
<a href="http://sass-lang.com/">Sass</a>. You can go right ahead and edit the<br />
Sass files inside <code>views/sass/core.sass</code> and these will appear at <a href="http://localhost:4567/">http://localhost:4567/</a>.</p>

<p><strong>Every time localhost is refreshed, a new generated <span class="caps">CSS</span> file is written to <code>public/stylesheets/*.css</code></strong></p>


<h2>Ammending the site structure</h2>
<p>In order to make our navigation work, the folder structure inside <code>/views/pages/</code> should be mirrored in <code>/helpers/navigation.rb</code></p>


<h2>Extend</h2>
<p><strong>Note: if you change a helper file you will need to stop the preview and restart it to see your changes</strong></p>

<p>Sinatra has good, comprehensive documentation, see:</p>

<ul>
	<li><strong><a href="http://www.sinatrarb.com/intro">Intro (Pretty comprehensive)</a></strong></li>
	<li><strong><a href="http://www.sinatrarb.com/faq"><span class="caps">FAQ</span></a></strong></li>
	<li><strong><a href="http://www.sinatrarb.com/documentation">Documentation</a></strong></li>
	<li><strong><a href="http://railsapi.com/doc/sinatra-v1.0/"><span class="caps">API</span></a></strong></li>
	<li><strong><a href="http://sinatra-book.gittr.com/">Book</a></strong></li>
</ul>

<h2><strong>Technical differences to Staticmatic</strong></h2>
<ul>
	<li>You set up your own routes in the app file</li>
	<li>The site (outputted html files) folder is created one directory up from
	the route</li>
</ul>
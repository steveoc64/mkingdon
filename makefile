all: clean run

clean:
	rm -rf dist server/mkingdon


dist: 
	##### Clean Out Dist Directory
	rm -rf dist
	mkdir -p dist/public
	mkdir -p dist/public/css dist/public/js
	##### Copy 3rd Party Assets
	cp ink/dist/css/font-awesome.min.css dist/public/css
	cp ink/dist/css/ink.css dist/public/css
	cp ink/dist/css/ink-flex.min.css dist/public/css
	cp ink/dist/css/ink-legacy.min.css dist/public/css
	cp ink/dist/js/ink-all.min.js dist/public/js
	cp ink/dist/js/holder.js dist/public/js
	cp ink/dist/js/autoload.js dist/public/js
	cp -R ink/dist/fonts dist/public
	cp -R ink/dist/img dist/public
	##### Copy Our Assets
	cp assets/index.html dist/public
	cp -R assets/img dist/public
	cp -R assets/js dist/public
	cp server/config.json dist
	# cp -R assets/css dist/public
	##### Building Client App
	cd app && gopherjs build *.go -o ../dist/public/app.js -m
	##### Building Server App
	cd server && go build -o ../dist/mkingdon
	##### Dist directory looks like this	
	cd dist && ls -l && ls -l public/app.js

dist-uikit: 
	##### Clean Out Dist Directory
	rm -rf dist
	mkdir -p dist/public
	mkdir -p dist/public/css dist/public/font dist/public/js
	##### Copy Our Assets
	cp assets/index.html dist/public
	cp -R assets/img dist/public
	# cp -R assets/fonts dist/public
	cp -R assets/css dist/public
	##### Copy 3rd Party Assets
	cp bower_components/uikit/css/uikit.min.css dist/public/css
	cp bower_components/uikit/css/components/sticky.almost-flat.min.css dist/public/css
	cp bower_components/uikit/js/uikit.min.js dist/public/js
	cp bower_components/uikit/js/components/sticky.min.js dist/public/js
	cp bower_components/jquery/dist/jquery.min.js dist/public/js
	cp -R bower_components/uikit/fonts dist/public
	cp server/config.json dist
	##### Building Client App
	cd app && gopherjs build *.go -o ../dist/public/app.js -m
	##### Building Server App
	cd server && go build -o ../dist/mkingdon
	##### Dist directory looks like this	
	cd dist && ls -l && ls -l public/app.js

run: dist
	###################################################################################################
	#  !!! All code passed compile and build stage !!!
	###################################################################################################
	./terminate
	cd dist && ./mkingdon

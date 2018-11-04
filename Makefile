generate: generate_css generate_resume generate_hugo

generate_css:
	npm install
	npm run build

generate_hugo:
	hugo

########################################################
# PanDoc helpers to create a resume in various formats #
########################################################
RESUME_CSS_DIR=resume/styles
RESUME_CSS_STYLE=chmduquesne
RESUME_OUT_DIR=content/resume
RESUME_DIR=resume/markdown
RESUME_FILE_NAME=geraldhspencer

resume_init:
	mkdir -p $(RESUME_OUT_DIR)
	rm -f $(RESUME_OUT_DIR)/* || true

generate_resume_html: resume_init
	for file in $(RESUME_DIR)/*.md; do \
		FILE_NAME=`basename $$file | sed 's/.md//g'`; \
		echo $$FILE_NAME.html; \
		pandoc --standalone --include-in-header $(RESUME_CSS_DIR)/$(RESUME_CSS_STYLE).css \
				--lua-filter=resume/pdc-links-target-blank.lua \
				--from markdown --to html \
				--output $(RESUME_OUT_DIR)/$$FILE_NAME.html $$file; \
	done

generate_resume_pdf: resume_init
	for file in $(RESUME_DIR)/*.md; do \
		FILE_NAME=`basename $$file | sed 's/.md//g'`; \
		echo $$FILE_NAME.pdf; \
		pandoc --standalone --template $(RESUME_CSS_DIR)/$(RESUME_CSS_STYLE).tex \
			--from markdown --to context \
			--variable papersize=A4 \
			--output $(RESUME_OUT_DIR)/$$FILE_NAME.tex $$file > /dev/null; \
		mtxrun --path=$(RESUME_OUT_DIR) --result=$$FILE_NAME/$$FILE_NAME.pdf --script context $$FILE_NAME.tex; \
	done

resume_build_clean:
	rm $(RESUME_OUT_DIR)/*tex $(RESUME_OUT_DIR)/*log $(RESUME_OUT_DIR)/*tuc

generate_resume: generate_resume_html generate_resume_pdf resume_build_clean

#######################
# Development helpers #
#######################
watch:
	npm run watch&
	hugo server

###########################
# Version control helpers #
###########################
commit:
	git add content/ docs/ resume/
	git status
	read -p "Enter commit message: " commit
	git commit -am "$commit"

push:
	read -p "Push to $() [y|n]? " push
	case "$push" in
		y|Y ) git push origin master;;
	    n|N ) exit;;
	esac

press: generate commit push

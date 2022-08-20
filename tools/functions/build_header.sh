#!/bin/bash
# Builds the page header
# Takes arguments in the form of "build_header destination.html"
# This function assumes that metadata has already been fetched in the current subshell. If no metadata is present, it will do nothing.

build_header() {
        # Verify that metadata variables are populated before running.
        [[ $title != '' ]] && {
                cat $config/header.html > $1

                sed -i "s^{{title}}^$title^g" $1
                sed -i "s^{{author}}^$author^g" $1
                sed -i "s^{{description}}^$description^g" $1
                sed -i "s^{{thumbnail}}^$thumbnail^g" $1
                sed -i "s^{{published_date}}^$published_date^g" $1
                sed -i "s^{{modified_date}}^$modified_date^g" $1
                sed -i "s^{{canonical_url}}^$canonical_url^g" $1
        }
}

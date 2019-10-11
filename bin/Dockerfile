FROM cloudfoundry/cflinuxfs3

# git repos to clone and build
RUN git clone --branch 1.34.3 https://github.com/mapbox/tippecanoe.git

# build tippecanoe
RUN cd tippecanoe && make -j && make install

CMD ["sh"]

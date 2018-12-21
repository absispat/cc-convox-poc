sea=xyz-ajay-no-siddhart-ubidone-fdh-DMJK.UK.1.0-32133-Z-1.tgz
sea2=${sea/*[[:lower:]]-/}; echo ${sea2%.*}
echo $sea2

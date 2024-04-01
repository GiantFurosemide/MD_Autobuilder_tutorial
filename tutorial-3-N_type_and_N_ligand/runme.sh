my_root=${PWD}
# prepare the environment
mkdir output_final
cp script/AutoMdBuilder-main.zip output_final/
cd output_final/ 
unzip AutoMdBuilder-main.zip && rm -rfv AutoMdBuilder-main.zip

# copy the input data to the project directory's "structure" folder
my_work_dir=${PWD}/AutoMdBuilder-main/projects
mkdir -p $my_work_dir/structures
cp -r ../input_data/* $my_work_dir/structures/

################################################################
# ingnore this part for now. I just update parameters for a faster tutorial. 
sed -i "s/SIMULATIONTIME='5'/SIMULATIONTIME='0.5'/g" $my_work_dir/structures/*/mdbuild_add_multi_ligands.sh
################################################################

cd $my_work_dir
source runme_single_protein_multiple_ligands.sh
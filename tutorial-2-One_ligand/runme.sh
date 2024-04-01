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
scripts_dir=$my_root/output_final/AutoMdBuilder-main/scripts/protocolgromacs_single_ligand
sed -i "s/BOXSIZE=21.8/BOXSIZE=10.0/g" $scripts_dir/runGromacs.sh
sed -i "s/NUMBEROFREPLICAS=3/NUMBEROFREPLICAS=2/g" $scripts_dir/runGromacs.sh
sed -i "s/FF=charmm36-jul2022/FF=amber99sb-ildn/g" $scripts_dir/runGromacs.sh
sed -i "s/LIGNAME=\"\"/LIGNAME=\"PP1\"/g" $scripts_dir/runGromacs.sh
################################################################


cd $my_work_dir
source runme_single_protein_single_ligand.sh
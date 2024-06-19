# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Trained model files for Howdy."
HOMEPAGE="https://github.com/davisking/dlib-models"
SRC_URI="
	https://github.com/davisking/dlib-models/raw/master/dlib_face_recognition_resnet_model_v1.dat.bz2
	https://github.com/davisking/dlib-models/raw/master/mmod_human_face_detector.dat.bz2
	https://github.com/davisking/dlib-models/raw/master/shape_predictor_5_face_landmarks.dat.bz2
"

S="${WORKDIR}"
LICENSE="CC0-1.0"
SLOT="0"
INSTALL_PATH=/usr/share/dlib-data/

src_install() {
	insinto "${INSTALL_PATH}"
	doins "${WORKDIR}/dlib_face_recognition_resnet_model_v1.dat"
	doins "${WORKDIR}/mmod_human_face_detector.dat"
	doins "${WORKDIR}/shape_predictor_5_face_landmarks.dat"
}

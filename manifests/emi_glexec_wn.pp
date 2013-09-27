class glexecwn::emi_glexec_wn (
  $emi_glexec_wn = 'emi-glexec_wn') {
  # lcas-plugins-basic
  # emi-version
  # mkgltempdir
  # lcmaps-plugins-tracking-groupid
  # lcmaps-plugins-basic
  # yaim-glexec-wn
  # lcmaps-plugins-verify-proxy
  # nagios-plugins-emi.glexec
  # lcmaps-plugins-c-pep
  # lcmaps-plugins-voms
  # glexec
  # glexec-wrapper-scripts
  # lcas-plugins-check-executable
  # lcas
  # edg-mkgridmap
  # lcmaps
  # lcas-plugins-voms
  # rpmlib(PayloadFilesHavePrefix) <= 4.0-1
  # rpmlib(CompressedFileNames) <= 3.0.4-1

  package { $emi_glexec_wn: ensure => present, }
}
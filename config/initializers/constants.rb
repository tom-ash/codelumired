# frozen_string_literal: true

SKILLFIND_TECH_NAME = 'skillfind.tech'
SKILLFIND_TECH_NAME_CONSTANTIZED_NAME = 'SkillfindTech'
SKILLFIND_TECH_NAME_APEX_DOMAIN = 'skillfind.tech'
SKILLFIND_TECH_NAME_ROOT_DOMAIN = SKILLFIND_TECH_NAME_APEX_DOMAIN
SKILLFIND_TECH_NAME_LANGS = %i[en pl].freeze
SKILLFIND_TECH_URL = "https://#{SKILLFIND_TECH_NAME_ROOT_DOMAIN}"
SKILLFIND_TECH_S3 = ENV['AWS_S3_SOUNDOFIT_BUCKET']
SKILLFIND_TECH_IMAGE = 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg'

MAPAWYNAJMU_PL_NAME = 'mapawynajmu.pl'
MAPAWYNAJMU_PL_CONSTANTIZED_NAME = 'MapawynajmuPl'
MAPAWYNAJMU_PL_APEX_DOMAIN = 'mapawynajmu.pl'
MAPAWYNAJMU_PL_ROOT_DOMAIN = MAPAWYNAJMU_PL_APEX_DOMAIN
MAPAWYNAJMU_PL_NAME_LANGS = %i[pl en].freeze
MAPAWYNAJMU_PL_URL = "https://#{MAPAWYNAJMU_PL_ROOT_DOMAIN}"
MAPAWYNAJMU_PL_S3 = ENV['AWS_S3_MAPAWYNAJMUPL_BUCKET']
MAPAWYNAJMU_PL_IMAGE = 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg'

# DEV
SKILLFIND_TECH_DOMAIN_DEV = 'local.skillfind.tech:8080'
SKILLFIND_TECH_URL_DEV = "http://#{SKILLFIND_TECH_DOMAIN_DEV}"
MAPAWYNAJMU_PL_DOMAIN_DEV = 'local.mapawynajmu.pl:8080'
MAPAWYNAJMU_PL_URL_DEV = "http://#{MAPAWYNAJMU_PL_DOMAIN_DEV}"

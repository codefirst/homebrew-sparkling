class Shinchoku < BrewSparkling::Recipe::Builder
  github 'mzp/Shinchoku', branch: '1.0'
  description 'ask shinchou once a hour'
  version '1.0'
  bundle_identifiers %w(jp.mzp.Shinchoku jp.mzp.Shinchoku.watchkitapp jp.mzp.Shinchoku.watchkitapp.watchkitextension)

  def build
    if ENV['SHINCHOKU_IMAGE']
      system './make_app_icon.sh', ENV['SHINCHOKU_IMAGE']
    end

    xcodebuild_archive(scheme: 'Shinchoku')
  end
end

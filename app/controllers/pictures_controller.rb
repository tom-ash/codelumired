include UsersCiphers

class PicturesController < ApplicationController
  def create_temporary
    # USER SECURE
      
      if request.headers[:fileType].include?("jpg")
        file_type = "jpg"
      elsif request.headers[:fileType].include?("jpeg")
        file_type = "jpeg"
      elsif request.headers[:fileType].include?("bmp")
        file_type = "bmp"
      elsif request.headers[:fileType].include?("png")
        file_type = "png"
      else
        file_type = "png"
      end

      key = Time.now.strftime("%Y%m%d%H%M%S%L") + "#{SecureRandom.urlsafe_base64}.#{file_type}"
      post = Aws::S3::PresignedPost.new(CREDS,
                                        'eu-central-1',
                                        Rails.application.secrets.aws_bucket,
                                        {
                                          key: "temporary/" + key,
                                          success_action_status: '201',
                                          acl: 'private',
                                        })

      render json: {
       'fields': post.fields,
       'url': post.url,
       'key': key
      }

    # end
  end


  def create_for_announcement


    if request.headers[:fileType].include?("jpg")
      file_type = "jpg"
    elsif request.headers[:fileType].include?("jpeg")
      file_type = "jpeg"
    elsif request.headers[:fileType].include?("bmp")
      file_type = "bmp"
    elsif request.headers[:fileType].include?("png")
      file_type = "png"
    else
      file_type = "png"
    end

    key = Time.now.strftime("%Y%m%d%H%M%S%L") + "#{SecureRandom.urlsafe_base64}.#{file_type}"


    post = Aws::S3::PresignedPost.new(CREDS,
                                      'eu-central-1',
                                      Rails.application.secrets.aws_bucket,
                                      {
                                        key: "announcements/#{params[:id]}/" + key,
                                        success_action_status: '201',
                                        acl: 'private',
                                      })

    render json: {
     'fields': post.fields,
     'url': post.url,
     'key': key
    }






  end



  def show
    signer = Aws::S3::Presigner.new(
     region: Rails.application.secrets.aws_region,
     credentials: CREDS
    )
    url = signer.presigned_url(:get_object,
                               bucket: Rails.application.secrets.aws_bucket,
                               key: request.headers[:key])
    render json: { url: url }
  end
end
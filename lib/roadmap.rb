module Roadmap
    def get_roadmap(id)
        url = 'https://www.bloc.io/api/v1/roadmaps/' + id.to_s
        response = self.class.get( url, values: { "id" => id }, headers: { "authorization" => @auth_token })
        @roadmap = JSON.parse(response.body.to_s)
      end
    
      def get_checkpoint(id)
        url = 'https://www.bloc.io/api/v1/checkpoints/' + id.to_s
        response = self.class.get( url, values: { "id" => id }, headers: { "authorization" => @auth_token })
        @checkpoint = JSON.parse(response.body.to_s)
      end
end
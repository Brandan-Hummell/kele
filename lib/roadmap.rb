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

      def create_checkpoint(assignment_branch, assignment_commit_link, checkpoint_id, comment="No Comment")
        me_response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token })
        me = JSON.parse(me_response.body.to_s)
        enrollment_id = me["current_enrollment"]["id"]
        p enrollment_id
        url = 'https://www.bloc.io/api/v1/checkpoint_submissions'
        response = self.class.post( url, body: { "assignment_branch" => assignment_branch, "assignment_commit_link" => assignment_commit_link, "checkpoint_id" => checkpoint_id, "comment" => comment, "enrollment_id" => enrollment_id }, headers: { "authorization" => @auth_token })
      end
end
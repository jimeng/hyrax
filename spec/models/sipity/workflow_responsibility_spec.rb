module Sipity
  RSpec.describe WorkflowResponsibility, type: :model, no_clean: true do
    subject { described_class }

    its(:column_names) { is_expected.to include('agent_id') }
    its(:column_names) { is_expected.to include('workflow_role_id') }
  end
end

RSpec.describe "file" do
  context "permission" do
    let(:permission) { "-rwxr-xr-x" }
    let(:scripts) { `./all`.strip.scan(/\s\s([\w-]+)\s\s/).map(&:first) }

    it "expect all files are executable" do
      scripts.each do |script|
        got = file_permission(script)

        expect(got).to eq(permission),
          "expected script '#{script}' to be executable, got: #{got}"
      end
    end

    def file_permission(path)
      path.gsub!("-", "\-")
      `ls -l | grep '\s#{path}$' | awk '{print $1}'`.strip
    end
  end
end

require "xcodeproj"

module Fastlane
  module Actions
    class UpdateNativeSdksAction < Action
      class << self
        UI = FastlaneCore::UI

        def run(params)
          # TODO: Update submodules

          # TODO: Android

          ios_subdir = File.expand_path 'ios', '.'
          update_branch_podspec_from_submodule ios_subdir
          adjust_rnbranch_xcodeproj ios_subdir
        end

        def available_options
          []
        end

        def update_branch_podspec_from_submodule(ios_subdir)
          branch_sdk_podspec_path = File.join ios_subdir, "Branch-SDK.podspec"

          # Copy the podspec from the submodule
          `cp #{ios_subdir}/Branch-SDK/Branch.podspec #{branch_sdk_podspec_path}`
          UI.user_error! "Unable to update #{branch_sdk_podspec_path}" unless $?.exitstatus == 0

          # Change the pod name to Branch-SDK
          other_action.apply_patch(
            files: branch_sdk_podspec_path,
            regexp: /(s\.name\s*)= "Branch"/,
            mode: :replace,
            text: '\1= "Branch-SDK"'
          )

          # Add s.header_dir = "Branch" (also determines the module name)
          other_action.apply_patch(
            files: branch_sdk_podspec_path,
            regexp: /s.requires_arc.*$/,
            mode: :append,
            text: "\n  s.header_dir       = \"Branch\""
          )

          # Add an additional Branch-SDK/ path component to all paths to account for the submodule
          other_action.apply_patch(
            files: branch_sdk_podspec_path,
            regexp: %r{(['"]Branch-SDK/)},
            mode: :replace,
            text: '\1Branch-SDK/',
            global: true
          )

          UI.message "Updated #{ios_subdir}/Branch-SDK.podspec"
        end

        def adjust_rnbranch_xcodeproj(ios_subdir)
          project = Xcodeproj::Project.open File.join(ios_subdir, "RNBranch.xcodeproj")
          ios_subdir_pathname = Pathname.new ios_subdir

          Dir[File.expand_path "Branch-SDK/**/*.h", ios_subdir].each do |header|
            relative_path = Pathname.new(header).relative_path_from(ios_subdir_pathname).to_s
            next if project.files.find { |f| f.name =~ /#{relative_path}$/ }
            UI.message "New header file: #{header}"
          end
        end
      end
    end
  end
end

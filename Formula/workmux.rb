class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.279"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.279/workmux-darwin-arm64.tar.gz"
      sha256 "febd0691a654b474a8e2a2696c35df7f6e2535825ab2214adadfaeb5684f45fd"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.279/workmux-darwin-amd64.tar.gz"
      sha256 "6ab12a93681a06b34db0eb4e3872ad4a0ddaa36dd33efff6012346706f55bfb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.279/workmux-linux-arm64.tar.gz"
      sha256 "c4e6aa53c08f204fb12c501c285dddc49c9ce15b7b90376d07227ceaafe5e267"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.279/workmux-linux-amd64.tar.gz"
      sha256 "72453ac68cdf03ee2d744ebffa4d4a9507a0ee2dd9b754cd178d84f57d756e68"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

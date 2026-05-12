class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.206"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.206/workmux-darwin-arm64.tar.gz"
      sha256 "46375251c3fcf47e4a2cea2559d5b52f70a745f24e828d6f137c4e575d51318c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.206/workmux-darwin-amd64.tar.gz"
      sha256 "f16ea9efbd34c7df6e464a59272b3994f9cc964d8a8753e84f93a5f4d1a83cec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.206/workmux-linux-arm64.tar.gz"
      sha256 "a8c43dae4cf176776475fe591cc3612a63f53abca6f1e16be094fc05ab14776e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.206/workmux-linux-amd64.tar.gz"
      sha256 "0805a3b8b1cc3f314a0fb5434cbfdc7757edc078e50e867e227bfec55f834b3c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.276"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.276/workmux-darwin-arm64.tar.gz"
      sha256 "52277f115e350dd8e7d9c157cbf273395a5a49f8dbc1d304db5b731e9513fd8c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.276/workmux-darwin-amd64.tar.gz"
      sha256 "8ce24e5d33db3521f4455c68f6a0ab334cec92492576dde0fb109f08fb5918c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.276/workmux-linux-arm64.tar.gz"
      sha256 "300caf13714e938943ff71ba5f8078098fc818207834df69fb4ca0170a0b5042"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.276/workmux-linux-amd64.tar.gz"
      sha256 "723188028dae85648f0cc9c687d0ddfa4fb2ac94dc913b9c4cd23d22a03766c0"
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

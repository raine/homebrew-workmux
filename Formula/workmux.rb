class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.210"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.210/workmux-darwin-arm64.tar.gz"
      sha256 "c87aaed881bbc9165a9eb91d0c3754513ffda954f626ee3143415c731262872d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.210/workmux-darwin-amd64.tar.gz"
      sha256 "c32978489116f66dd44e1c22162645425687479b7649b71b63c2fc472667bdf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.210/workmux-linux-arm64.tar.gz"
      sha256 "1667ac4b3e19525933ca2a2b6f2d2f9876253ed8533946cb9a6b77ffaf48f8f7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.210/workmux-linux-amd64.tar.gz"
      sha256 "cb16f7b5094e1ae0423052bfa4d186dcbecc32daab0f7d704078912933473fe1"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

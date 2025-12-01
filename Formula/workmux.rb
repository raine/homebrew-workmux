class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.36/aarch64-apple-darwin.tar.gz"
      sha256 "4a4e583388c7aa3d73ba58417fb3a696ab6b0e772720182ae4af54c7bb2cc3db"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.36/x86_64-apple-darwin.tar.gz"
      sha256 "d80e57f8d8d03a19739d2b99117fa5d7e765603ea6a4045652b598c8d04f715b"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.36/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ad0386a535713643359f4569fde42c2b89ac4f37ae6dfceac00bc231841a72ed"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

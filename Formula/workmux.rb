class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.34/aarch64-apple-darwin.tar.gz"
      sha256 "11d816e0c4cde270efd6fe4949bdd4c143938d31dbabae87d824b69d06421548"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.34/x86_64-apple-darwin.tar.gz"
      sha256 "020f3b5350878fae5b7d231eb5633c431cce32386988bad4f624680def275637"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.34/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15d928856a0fc6cc7392aed8f741a138acd7dd92abf5d4d29992d204d62886d1"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

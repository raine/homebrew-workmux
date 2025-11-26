class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.28/aarch64-apple-darwin.tar.gz"
      sha256 "60b79a93ebff922d1e677fe1380cea6ac4cf064d96c35b413d7c3106a2fc2bfe"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.28/x86_64-apple-darwin.tar.gz"
      sha256 "03f0562cc9876b3adfbf7880484922a581b0b19cde6e54df8ccad6fc9d9e661e"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.28/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e746a2dc11b56638d788ef9376d5bc2b4cbe6ac2c8cee1097245345162445c98"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

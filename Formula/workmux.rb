class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.61/aarch64-apple-darwin.tar.gz"
      sha256 "ae0af8e7069e57b822d31d8052b2e24912a9cbf9a99cd9bdefd4e581af0e7f58"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.61/x86_64-apple-darwin.tar.gz"
      sha256 "794fd4882e595b54e7e9c3cdb23e7f8f7a2700b33329529b763f812806ac3bad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.61/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "103060e51c69bbbd93ebbc7c9695185a105075b664fa62aa13b53fc1fb5cc7bb"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.61/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8f5715f6dcf206f372b1a75931961d215a9164e839350ea7f3d6eb452ab3cdb"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

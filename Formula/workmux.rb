class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.168"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.168/workmux-darwin-arm64.tar.gz"
      sha256 "262b8cbb546b6368e41dc968179afb9526f2597a537fcee692f5f9f1bc1b720a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.168/workmux-darwin-amd64.tar.gz"
      sha256 "5e299be9caae6b4736cbec3731c4425467eb6f6056aa68f3aa73ce5e217ed6e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.168/workmux-linux-arm64.tar.gz"
      sha256 "117fe8086c96e0d7e24751ce4a1fa4b87968fe8a7e96ae88bfb7ef6947aa39f7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.168/workmux-linux-amd64.tar.gz"
      sha256 "275b1d0d37abd8b97e014758e177fbda93f07355d2efb586df8f5481fa1aa373"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

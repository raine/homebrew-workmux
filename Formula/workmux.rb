class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.190"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.190/workmux-darwin-arm64.tar.gz"
      sha256 "0c3807c0ceb286ff6454e592e966f75a838dcaeeb952a06a3ea80f23add4ae6f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.190/workmux-darwin-amd64.tar.gz"
      sha256 "cd0da78ba345009801194701675693fffd2f7a7cf83641877bc3ce0ce7947d5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.190/workmux-linux-arm64.tar.gz"
      sha256 "326c4b256d4051143898e22ea7da62c70e2ad6c217aa443a7f67664e2a3a724c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.190/workmux-linux-amd64.tar.gz"
      sha256 "fb6a7e733423893a30f35e57390371b27cdfeaf76195c919afa72ef9029f4379"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

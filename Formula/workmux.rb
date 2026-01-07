class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.76"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.76/workmux-darwin-arm64.tar.gz"
      sha256 "66d80c2bf72fd9629502cb45ff21750f0e9a097461535028e79d59f89417b61f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.76/workmux-darwin-amd64.tar.gz"
      sha256 "fc777ef080d0d099daf77c2c8a9ea4586395977b18654c061adfaf31c6c37863"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.76/workmux-linux-arm64.tar.gz"
      sha256 "20b56fab0fb48e2aa6c226f27da21e943b1e14c87f38218dcd55b8d6c01d7018"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.76/workmux-linux-amd64.tar.gz"
      sha256 "50938d108e671a40cb53a765ef8a5c62fec2593f0b7757e2ed7e1f7dd089f4bb"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

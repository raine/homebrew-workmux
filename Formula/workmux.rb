class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.266"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.266/workmux-darwin-arm64.tar.gz"
      sha256 "5d685a22339bfab4a62fcfd42880fa15662e0c95130a2c64019da6cad42748f3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.266/workmux-darwin-amd64.tar.gz"
      sha256 "e3466ac9a2222f052c9c495159ab3a65bf75e0df796aa86aa5862c8422810c3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.266/workmux-linux-arm64.tar.gz"
      sha256 "4015972074a5638bb4f0c14bdbb907ef8b489f10acd59d678c9ff4ccf326e3ed"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.266/workmux-linux-amd64.tar.gz"
      sha256 "a316b78dfa92bbc63ea9b2fa2570cf5a7fbe08d56691781edc52dcb672b8be31"
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

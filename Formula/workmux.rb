class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.160"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.160/workmux-darwin-arm64.tar.gz"
      sha256 "54f962598a5df2a85be27a62eefc1abc33c6166d2ff7313102e87f9ee5553aeb"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.160/workmux-darwin-amd64.tar.gz"
      sha256 "61f1ac126d42022c0422e9dd12617612c29ea766129b4bbce445f6b64d32385b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.160/workmux-linux-arm64.tar.gz"
      sha256 "35df86037f960e0f8a41a01aec1e5e2622cc534338799b65c131aa79022e0088"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.160/workmux-linux-amd64.tar.gz"
      sha256 "5167b0b7e686d0b42424d28a477cd2fdaffe2aef2183bc1a2d37c3b462c17ac9"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

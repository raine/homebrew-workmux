class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.231"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.231/workmux-darwin-arm64.tar.gz"
      sha256 "56bc6a7b59cd61ff34e14af0088c7829cc0b3c34191439ae5a73d3ae728a1084"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.231/workmux-darwin-amd64.tar.gz"
      sha256 "9f31b8a9d51121059abbea57d0747d482e6c566955ad073983063ce0a309d465"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.231/workmux-linux-arm64.tar.gz"
      sha256 "4752891866e21b41f7bcd188801d3ab46784dc101c81da80b65f05639507b8ed"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.231/workmux-linux-amd64.tar.gz"
      sha256 "199993e86debe73cf10d8861aea996337c015e4083177ba1b2fc6d168f825826"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

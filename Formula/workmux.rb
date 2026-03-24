class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.149"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.149/workmux-darwin-arm64.tar.gz"
      sha256 "e4bbb787d604e1696d43ea03ba32c0f3786850fe74772ea03b3377be7a3ec202"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.149/workmux-darwin-amd64.tar.gz"
      sha256 "0f3ced72bee4c7ae857a59935862e705767ecc8ddb6517b10a53c900bb637889"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.149/workmux-linux-arm64.tar.gz"
      sha256 "e3cff125c1bf7edc6c156d8eeb248bd0341d69a88aa5c09b4142da7ce911b67a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.149/workmux-linux-amd64.tar.gz"
      sha256 "497279539c84a3482ac1a8df24ee98a8440d53c6ab1565caca3d674a363eb473"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

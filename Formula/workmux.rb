class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.86"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.86/workmux-darwin-arm64.tar.gz"
      sha256 "f9fa444d18af0a36d762523f99629cf112cd43c2cf254e57090c053584e3b2b8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.86/workmux-darwin-amd64.tar.gz"
      sha256 "bb228bb0be5d1f8febd75af5bf330de03d527632c2502375809667bad5fb49a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.86/workmux-linux-arm64.tar.gz"
      sha256 "8e3573a890dfd17ce1a4d14ca7058515e06c7494363a6949fa3f72b8c454ddf8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.86/workmux-linux-amd64.tar.gz"
      sha256 "5a276d8d4b1ac1015887d9b1546a6277a2e81fd179818442fe26ae4c054bd976"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end

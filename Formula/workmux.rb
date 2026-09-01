class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.252"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.252/workmux-darwin-arm64.tar.gz"
      sha256 "809c7589f7716d5a919b76768f4e50da06d7045154cfd5ac1e0e6f5d8a094a84"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.252/workmux-darwin-amd64.tar.gz"
      sha256 "b20c5107ffe0b41f51c2bce32f5e7bd6ca4ae8cf2852e496c4c3091b6762dee3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.252/workmux-linux-arm64.tar.gz"
      sha256 "cf0ca56b6119c8c49bedd3936cffb7a564230d32195d91bd0ff7211bdf42d9db"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.252/workmux-linux-amd64.tar.gz"
      sha256 "75156f906cbf9e893ac8223f893dd7aa9ae36cbdccdca38b84974ddcb5392deb"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
